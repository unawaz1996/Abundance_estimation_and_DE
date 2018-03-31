#!/bin/bash

#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=01:20:00
#SBATCH --mem=50GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au



module load Trinity/2.5.1-foss-2016b
module load Perl/5.24.0-foss-2017a
module load kallisto/0.43.1-foss-2017a
module load R/3.4.2-foss-2016b

RsemDIR=//fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/Transcript_quantification/RSEM_analysis

//apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/util/abundance_estimates_to_matrix.pl \
    --gene_trans_map //fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir/Trinity.fasta.gene_trans_map \
     --est_method RSEM  --out_prefix Trinity \
    --name_sample_by_basedir \
    ${RsemDIR}/embryo_1B/RSEM.isoforms.results \
    ${RsemDIR}/embryo_4b/RSEM.isoforms.results \
    ${RsemDIR}/kidney240/RSEM.isoforms.results \
    ${RsemDIR}/kidney242/RSEM.isoforms.results
