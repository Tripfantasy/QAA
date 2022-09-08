#!/usr/bin/env python3.10
import numpy as np
import matplotlib.pyplot as plt
import argparse
import bioinfo
import gzip
#1 control_filtered1P.fq.gz
#2 control_filtered1U.fq.gz
#3 contol_filtered2P.fq.gz
#4 control_filtered2U.fq.gz
#5 undetermined_filtered1P.fq.gz
#6 undetermined_filtered1U.fq.gz
#7 undetermined_filtered2P.fq.gz
#8 undetermined_filtered2U.gq.gz
def get_args():
    parser = argparse.ArgumentParser(description = "Args to select filename")
    parser.add_argument("-f","--filename", help ="File name", type = str, required = False)
    return parser.parse_args()

args = get_args()
with gzip.open(args.filename,'r') as myfile:
    i = 0
    lendict = {}
    for i, line in enumerate(myfile):
        i += 1
        if i%4 == 1:
            readlen = len(line)
            if readlen in lendict:
                lendict[readlen] += 1 
            else:
                lendict[readlen] = 1

keys = list(lendict.keys())
values = list(lendict.values())
print(keys)
print(values)


