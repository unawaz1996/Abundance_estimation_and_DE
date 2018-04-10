#!/bin/bash

# using awk to extract rows and divide them into tissues 

head -n1 Trinity.isoform.counts.matrix > header

#gene level

awk -F "\t" '{ if (($2 >= 3) && ($3 >= 3) && ($4 < 3 ) && ($5 < 3)) { print } }' Trinity.gene.counts.matrix > embryo.filtered.gene.counts
awk -F "\t" '{ if (($2 < 3) && ($3 < 3) && ($4 >= 3 ) && ($5 >= 3)) { print } }' Trinity.gene.counts.matrix > kidney.filtered.gene.counts
awk -F "\t" '{ if (($2 < 3) && ($3 < 3) && ($4 < 3 ) && ($5 < 3)) { print } }' Trinity.gene.counts.matrix > DNMTC.filtered.gene.counts

#commonly expressed between all samples 
awk -F "\t" '{ if (($2 >= 3) && ($3 >= 3) && ($4 >= 3 ) && ($5 >= 3)) { print } }' Trinity.gene.counts.matrix > Trinity.filtered.gene.counts.matrix
awk -F "\t" '{ if (($2 >= 3) && ($4 >= 3 )) { print } }' Trinity.gene.counts.matrix > both1.filtered.gene.counts.matrix
awk -F "\t" '{ if (($2 >= 3) && ($5 >= 3)) { print } }' Trinity.gene.counts.matrix > both2.filtered.gene.counts.matrix
awk -F "\t" '{ if (($3 >= 3) && ($4 >= 3 )) { print } }' Trinity.gene.counts.matrix > both3.filtered.gene.counts.matrix
awk -F "\t" '{ if (($3 >= 3) && ($5 >= 3)) { print } }' Trinity.gene.counts.matrix > both4.filtered.gene.counts.matrix

cat header embryo.filtered.gene.counts > embryo.filtered.gene.counts.matrix && rm embryo.gene.gene.counts
cat header kidney.filtered.gene.counts > kidney.filtered.gene.counts.matrix && rm kidney.gene.gene.counts
cat header DNMTC.filtered.gene.counts > DNMTC.filtered.gene.counts.matrix && rm DNMTC.filtered.gene.counts

sort -u Trinity.filtered.gene.counts.matrix both1.filtered.gene.counts.matrix both2.filtered.gene.counts.matrix both3.filtered.gene.counts.matrix both4.filtered.gene.counts.matrix > Both.tissues.gene.counts

rm both*
rm Trinity.filtered*

cat header Both.tissues.gene.counts > Both.tissues.gene.counts.matrix  && rm Both.tissues.gene.counts

mkdir -p gene_level 

mv *.gene.* gene_level



#isoform level

awk -F "\t" '{ if (($2 >= 3) && ($3 >= 3) && ($4 < 3 ) && ($5 < 3)) { print } }' Trinity.isoform.counts.matrix > embryo.filtered.isoform.counts
awk -F "\t" '{ if (($2 < 3) && ($3 < 3) && ($4 >= 3 ) && ($5 >= 3)) { print } }' Trinity.isoform.counts.matrix > kidney.filtered.isoform.counts
awk -F "\t" '{ if (($2 < 3) && ($3 < 3) && ($4 < 3 ) && ($5 < 3)) { print } }' Trinity.isoform.counts.matrix > DNMTC.filtered.isoform.counts

#commonly expressed between all samples 
awk -F "\t" '{ if (($2 >= 3) && ($3 >= 3) && ($4 >= 3 ) && ($5 >= 3)) { print } }' Trinity.isoform.counts.matrix > Trinity.filtered.isoform.counts.matrix
awk -F "\t" '{ if (($2 >= 3) && ($4 >= 3 )) { print } }' Trinity.isoform.counts.matrix > both1.filtered.isoform.counts.matrix
awk -F "\t" '{ if (($2 >= 3) && ($5 >= 3)) { print } }' Trinity.isoform.counts.matrix > both2.filtered.isoform.counts.matrix
awk -F "\t" '{ if (($3 >= 3) && ($4 >= 3 )) { print } }' Trinity.isoform.counts.matrix > both3.filtered.isoform.counts.matrix
awk -F "\t" '{ if (($3 >= 3) && ($5 >= 3)) { print } }' Trinity.isoform.counts.matrix > both4.filtered.isoform.counts.matrix

cat header embryo.filtered.isoform.counts > embryo.filtered.isoform.counts.matrix && rm embryo.filtered.isoform.counts
cat header kidney.filtered.isoform.counts > kidney.filtered.isoform.counts.matrix && rm kidney.filtered.isoform.counts
cat header DNMTC.filtered.isoform.counts > DNMTC.filtered.isoform.counts.matrix && rm DNMTC.filtered.isoform.counts

sort -u Trinity.filtered.isoform.counts.matrix both1.filtered.isoform.counts.matrix both2.filtered.isoform.counts.matrix both3.filtered.isoform.counts.matrix both4.filtered.isoform.counts.matrix > Both.tissues.isoform.counts
rm both*
rm Trinity.filtered*


cat header Both.tissues.isoform.counts > Both.tissues.isoform.counts.matrix && rm Both.tissues.isoform.counts


mkdir -p transcript_level

mv *.isoform.* transcript_level



#DNMTC = did not make the cut
