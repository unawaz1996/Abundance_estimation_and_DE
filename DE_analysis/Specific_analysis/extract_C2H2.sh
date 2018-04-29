#!/bin/bash

#extracting proteins with C2H2 

awk '{if ($0 ~ "C2H2") {print $0} }' annotations.txt > transcripts_wC2H2_domains.txt #extracts the name of all transcripts with "C2H2" from the annotation report
cut -f1 transcripts_wC2H2_domains.txt > names.txt #cuts the first column (which contains the transcript name without annotation)
grep -Fwf names.txt Trinity.isoform.counts.matrix > only_C2H2 # extracts rows from isoform.matrix matching the rows from names.txt
head -n1 Trinity.isoform.counts.matrix > header #extracts the header
cat header only_C2H2 > C2H2_isoform_counts.matrix #turns it into a proper matrix

#then runDE analysis
