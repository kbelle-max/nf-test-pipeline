#!/usr/bin/env nextflow


params.strings=['heohzkouteanbg','greabtabtea','greagreagreag']
params.outdir="$projectDir/dir"

log.info """\
         TEST   P I P E L I N E    
         =============================
         strings: ${params.strings}
         """
         .stripIndent()

params_ch=Channel
    .fromList(params.strings)

process rev_string{
    publishDir params.outdir, mode: 'copy', overwrite: true

    input :
    each string from params_ch.collect()

    output:
    file "${string}_rev.txt" into rev_string_ch

    """
    rev.py $string > ${string}_rev.txt
    """
}

process uppercase_string{
    publishDir params.outdir, mode: 'copy', overwrite: true

    input:
    each path(string) from rev_string_ch

    output:
    file "${string}_upper.txt" into upper_ch

    script:

    """
    cat $string | tr a-z A-Z >${string}_upper.txt
    """

}
process split_string{
    publishDir params.outdir, mode: 'copy' , overwrite: true

    input: 
    each path(string) from upper_ch

    output:
    file "${string}_splitbycomma.txt" into splitbycomma_ch

    script:
    """
    split.py ${string} > ${string}_splitbycomma.txt
    """
}
