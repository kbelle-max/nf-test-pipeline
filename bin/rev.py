#!/usr/bin/env python3

import sys

def rev_string(string):
    return string[::-1]

if __name__=="__main__":
    print(rev_string(sys.argv[1]))