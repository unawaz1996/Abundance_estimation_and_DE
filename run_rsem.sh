#!/bin/bash 

#SBATCH -p batch
#SBATCH -n 16
#SBATCH --time=1-00:00
#SBATCH --mem=120GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au


module load Trinity/2.5.1-foss-2016b
module load SAMtools/1.3.1-foss-2016b
module load Bowtie2/2.2.9-foss-2016b
##module load RSEM/1.2.30-foss-2017a
module load RSEM/1.2.25-foss-2015b
module load GCC/6.3.0-2.27

AssemblyDir=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir
SampleDir=/fast/users/a1654797/Second_try/Trimmed_sequences2nd/trim_galore
outDIR=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/Transcript_quantification/RSEM_analysis/With_bam

if [ -d $outDIR ]; then
    echo "Folder exists ..."
else
    mkdir $outDIR
fi

cd $SampleDir

READS=$(ls *_R1_val_1.fq)


for f in ${READS} ;
do 

	readname=${f%_R1_val_1.fq}

	/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/util/align_and_estimate_abundance.pl --seqType fq \
        	 --left $SampleDir/${readname}_R1_val_1.fq \
         	--right $SampleDir/${readname}_R2_val_2.fq \
        	--transcripts $AssemblyDir/Trinity.fasta  \
        	--est_method RSEM  --aln_method bowtie \
        	--trinity_mode  --include_rsem_bam --thread_count 16  --prep_reference \
    	 	  --output_dir $outDIR/$readname 
       	

done
