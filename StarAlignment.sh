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
