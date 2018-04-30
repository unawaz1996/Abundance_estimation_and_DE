import pandas as pd
import numpy as np

annotationreport = "trinotate_report.csv"
filedf = open(annotationreport,'r')

write_file = "protocadherin_annotations.csv"
with open(write_file, "w") as output:
    for row in filedf:
        if "Protocadherin" in row:
            output.write(row + '\n')
           
#basically same as the script used to extract cephalopod annotaions
