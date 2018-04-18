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
script=/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/Analysis/DifferentialExpression/run_DE_analysis.pl


#my directories 
Matrix=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/Transcript_quantification/RSEM_analysis/Expression_matrix
Samples=$Matrix/samples_all.txt
outDIR=$Matrix/edgeR

if [ -d $outDIR ]; then
	echo " $outDIR exists"
else 
	mkdir -p $outDIR
fi

#gene level

echo "Commencing DE analysis using edgeR for Trinity 'genes' "
$script --matrix ${Matrix}/Trinity.gene.counts.matrix --samples_file $Samples --method edgeR --output ${outDIR}/edgeR_gene

#transcript level 
echo " Commencing DE analysis using edgeR for Trinity 'transcripts'"
$script --matrix ${Matrix}/Trinity.isoform.counts.matrix  --samples_file $Samples --method edgeR --output ${outDIR}/edgeR_transcript
