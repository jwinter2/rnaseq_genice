# rnaseq_genice

![transcript_pipeline](https://github.com/user-attachments/assets/ecbd333a-b735-4926-89e5-6cfdd716f690)

**Quality Control**
Reads were trimmed using Trimmomatic with TruSeq3-PE adapters, a 4-base sliding window cut when average quality drops below 20, and removing leading and trailing bases with quality scores below 3.

Total length of transcriptomes decreased by 0.2 Mb to 1.1 Mb. Total transcriptome size ranged from 8.6 Mb to 44.3 Mb. GC % ranged from 41% to 54%.

Reads were error corrected using the default settings in Rcorrector, a kmer-based method for correcting Illumina RNA-Seq reads. Phix and human contamination were removed with bbduk from bbmap. 

Reads were deduplicated with bbmap tools clumpify with the flag —optical=f and bbnorm using target=100, mindepth=2, and prefilter=2 options.

**Assembly**
Deduplicated reads are being assembled using rnaSPAdes, as single assemblies and the same grouping of co-assemblies as the metagenomes. Once both are run, they will be compared to determine the best method for assembly.

Reads will also go through another pipeline starting at this step for eukaryotes. This will result in two versions of the metatranscriptomes, one using a standard pipeline and one designed for maximizing eukaryotic data.

**Mapping**

Cleaned reads were mapped to both the single assemblies and co-assemblies using minimap2 for paired end reads. ~90% of reads mapped to the assemblies. Cleaned reads will also be mapped to the metagenome assemblies using the same mapping tool decided for the metatranscriptome assemblies.

Reads will also go through another pipeline starting at this step for eukaryotes. This will result in two versions of the metatranscriptomes, one using a standard pipeline and one designed for maximizing eukaryotic data.
