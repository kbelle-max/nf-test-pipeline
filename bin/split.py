#!/usr/bin/env python3

def convert_string_list(path):
    with open(path,'r') as f:
        file=f.readline().strip()
    return [l for l in file]

if __name__=="__main__":
    import sys
    print(convert_string_list(sys.argv[1]))