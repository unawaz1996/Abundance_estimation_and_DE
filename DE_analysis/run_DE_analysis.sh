#!/bin/bash 


#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=10:00:00
#SBATCH --mem=45GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au



module load Trinity/2.5.1-foss-2016b
module load R/3.4.2-foss-2016b
module load Perl/5.24.0-foss-2017a

#identifying DE transcripts and genes in pairwise tissue comparisons

MatrixDIR=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/Transcript_quantification/RSEM_analysis/Expression_matrix
SamplesDIR=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/Transcript_quantification/RSEM_analysis/Expression_matrix
outDIR=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/Transcript_quantification/RSEM_analysis/Expression_matrix/edgeR_analysis


if [ -d $outDIR]; then
	echo " $outDIR exists"; 
else 
	mkdir $outDIR
fi

echo "running EdgeR analysis"
/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/Analysis/DifferentialExpression/run_DE_analysis.pl \
      --matrix ${MatrixDIR}/Trinity.gene.counts.matrix \
      --samples_file ${MatrixDIR}/gene_rsem.txt \
      --method edgeR \
      --output ${outDIR}/edgeR_gene

/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/Analysis/DifferentialExpression/run_DE_analysis.pl \
      --matrix ${MatrixDIR}/Trinity.isoform.counts.matrix \
      --samples_file ${MatrixDIR}/isoform_rsem.txt \
      --method edgeR \
      --output ${outDIR}/edgeR_transcript


DIR=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/Transcript_quantification/RSEM_analysis/Expression_matrix/DESeq2

if [ -d $DIR]; then 
	echo "$DIR exists"
else 
	mkdir $DIR
fi

echo "Running DESeq2"

/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/Analysis/DifferentialExpression/run_DE_analysis.pl \
      --matrix ${MatrixDIR}/Trinity.gene.counts.matrix \
      --samples_file ${MatrixDIR}/gene_rsem.txt \
      --method DESeq2 \
      --output ${DIR}/DESeq2_gene

/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/Analysis/DifferentialExpression/run_DE_analysis.pl \
      --matrix ${MatrixDIR}/Trinity.isoform.counts.matrix \
      --samples_file ${MatrixDIR}/isoform_rsem.txt \
      --method DESeq2 \
      --output ${DIR}/DESeq2_transcripts
