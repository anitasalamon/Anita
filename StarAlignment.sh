DIRECTIRIES
/project/Owens_Rivanna/00.Raw.and.Aligned.Files/bulk-RNA-seq/2021.11.in.vitro.GC/01_allraw
/project/Owens_Rivanna/00.Raw.and.Aligned.Files/bulk-RNA-seq/2021.11.in.vitro.GC/02_filtr
project/Owens_Rivanna/00.Raw.and.Aligned.Files/bulk-RNA-seq/2021.11.in.vitro.GC/03_align

#create a file
touch /home/as3gd/bin/scripts/202111_align.sh
#modify a file
vi 202111_align

#!/bin/sh
#SBATCH --nodes=1
#SBATCH --ntasks=30
#SBATCH --mem=300gb
#SBATCH --time=7-00:00:00
#SBATCH -p standard
#SBATCH -A Owens_Rivanna

module load gparallel/20170822
module load gcc/9.2.0
module load star/2.5.3a

find /project/Owens_Rivanna/00.Raw.and.Aligned.Files/bulk-RNA-seq/2021.11.in.vitro.GC/02_filtr/*.fq.gz | awk -F"02_filtr/" '{print $NF}' | cut -f 1 -d "_" | sort -u | parallel -j 1 "STAR --readFilesCommand zcat --runThreadN 12 
--genomeDir /project/genomes/Mus_musculus/NCBI/GRCm38/Sequence/STAR2Index 
--readFilesIn /project/Owens_Rivanna/00.Raw.and.Aligned.Files/bulk-RNA-seq/2021.11.in.vitro.GC/02_filtr/{}_1.filt.fq.gz 
/project/Owens_Rivanna/00.Raw.and.Aligned.Files/bulk-RNA-seq/2021.11.in.vitro.GC/02_filtr/{}_2.filt.fq.gz 
--outFileNamePrefix project/Owens_Rivanna/00.Raw.and.Aligned.Files/bulk-RNA-seq/2021.11.in.vitro.GC/03_align/{}.star. 
--outSAMtype BAM SortedByCoordinate 
--limitBAMsortRAM 50000000000 
--outSAMstrandField intronMotif 
--outFilterType BySJout 
--outFilterMultimapNmax 20 
-- alignSJoverhangMin 8 
--alignSJDBoverhangMin 1 
--outFilterMismatchNmax 999 
--outFilterMismatchNoverLmax 0.04 
--alignIntronMin 20 
--alignIntronMax 1000000 
--alignMatesGapMax 1000000 
--twopassMode Basic 
--outWigType bedGraph"
