#!/bin/bash 

#SBATCH -p batch
#SBATCH -n 16
#SBATCH --time=1-00:00
#SBATCH --mem=50GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

module load SAMtools/1.3.1-foss-2016b
module load Bowtie2/2.2.9-foss-2016b
##module load RSEM/1.2.30-foss-2017a
module load RSEM/1.2.25-foss-2015b
module load GCC/6.3.0-2.27

plot=/apps/software/RSEM/1.2.25-foss-2015b/rsem-plot-model 

DIR=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/Transcript_quantification/RSEM_analysis/With_bam

cd ${DIR} 

FILES=$(ls *_L003)


for f in ${FILES} ;
do 

	FILENAME=${f%_LOO3}
	$plot  ${DIR}/${FILENAME}_L003/RSEM ${FILENAME}.pdf


done
