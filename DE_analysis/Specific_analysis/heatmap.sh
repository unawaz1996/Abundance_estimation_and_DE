#!/bin/bash 

#program scripts 
script=/usr/local/Cellar/trinity/2.5.1/Analysis/DifferentialExpression/PtR


#my directories 
Samples=/Users/urwahnawaz/Documents/Final_thesis/Analysis/Expression_analysis/edgeR_transcript/C2H2_analysis/samples_all.txt
Matrix=/Users/urwahnawaz/Documents/Final_thesis/Analysis/Expression_analysis/edgeR_transcript/C2H2_analysis/diffExpr.P1e-3_C2.matrix.log2.centered.dat


 
 $script -m $Matrix -s $Samples \
     --gene_dist euclidean --sample_dist euclidean \
      --heatmap --heatmap_colorscheme "blue, white, red"
