#!/bin/bash 

#SBATCH -p batch
#SBATCH -n 16
#SBATCH --time=02:00:00
#SBATCH --mem=30GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

module load Trinity/2.5.1-foss-2016b
module load R/3.4.2-foss-2016b
module load Perl/5.24.0-foss-2017a


#program scripts 

average_matrix=/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/Analysis/DifferentialExpression/replicates_to_sample_averages_matrix.pl 

DIR=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/Transcript_quantification/RSEM_analysis/Expression_matrix
matrix=$DIR/Trinity.isoform.TMM.EXPR.matrix
samples=$DIR/samples_all.txt

$average_matrix --matrix $matrix --samples_file $samples --avg_log_val
