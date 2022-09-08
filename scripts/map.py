#!/bin/env python3.10
 
import argparse
import re
 
def get_args():
    parser = argparse.ArgumentParser(description="A program to introduce yourself")
    parser.add_argument("-f", "--file", help="File name")
    parser.add_argument("-o", "--output", help="Ouput File")
    return parser.parse_args()
args=get_args()
 

number_mapped = 0
number_unmapped = 0
number_reads = 0
with open(args.file, 'r') as fh:
    for line in fh:
        # if not line.startswith("@"):
        if line[0] != '@':
            number_reads += 1
   
            #split first and then specify index
            line = line.split('\t')
            flag = int(line[1])
                    #checking for secondary alignment, so we have to verify 256 
                    #may encounter each read in a file more than once. (multi align per read)
           
            if((flag & 256) != 256):
                #Primary alignment
                #not equal to 4
                if((flag & 4) == 4):
                    number_unmapped += 1
                   
                else:
                    number_mapped +=1
                   
print("Reads Mapped", number_mapped)
print("Reads unmapped", number_unmapped)
print("Reads", number_reads)

#Command to run: ./Parse.py -f Aligned.out.sort.sam 
# Output: Reads Mapped 21716948
# Output: Reads unmapped 1780010
# Output: Reads 24946360