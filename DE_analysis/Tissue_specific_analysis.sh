#!/bin/bash 

#SBATCH -p batch
#SBATCH -n 16
#SBATCH --time=00:30:00
#SBATCH --mem=30GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

module load Trinity/2.5.1-foss-2016b
module load R/3.4.2-foss-2016b
module load Perl/5.24.0-foss-2017a


#program scripts 

pairwise=/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/Analysis/DifferentialExpression/TissueEnrichment/DE_results_to_pairwise_summary.pl

pairwise_classification=/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/Analysis/DifferentialExpression/TissueEnrichment/pairwise_DE_summary_to_DE_classification.pl

DIR=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/Transcript_quantification/RSEM_analysis/Expression_matrix
matrix=$DIR/Trinity.isoform.TMM.EXPR.matrix.avg_reps.byLog.matrix
samples=$DIR/samples_all.txt

$pairwise $matrix ./. > DE_pairwise_summary.txt
$pairwise_classification DE_pairwise_summary.txt
