#!/bin/bash

#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=2:00:00
#SBATCH --mem=80GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au


module load Trinity/2.5.1-foss-2016b
module load R/3.4.2-foss-2016b
module load Perl/5.24.0-foss-2017a


#program scripts 
script=/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/Analysis/DifferentialExpression/analyze_diff_expr.pl


#my directories 
Matrix=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/Transcript_quantification/RSEM_analysis/Expression_matrix
Samples=$Matrix/samples_all.txt
go_annot=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/all_assembly/loading_into_database/without_homology/GO_terms/go_annotations_transcript.txt 
length=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/all_assembly/loading_into_database/trinity_length/Trinity.fasta.seq_lens 




$script --matrix $Matrix/Trinity.isoform.TMM.EXPR.matrix -P 1e-3 -C 2 --samples $Samples --max_genes_clust 38000 --examine_GO_enrichment --GO_annots $go_annot --gene_lengths $length
