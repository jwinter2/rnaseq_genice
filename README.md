# rnaseq_genice

![transcript_pipeline](https://github.com/user-attachments/assets/23cbf92e-6214-4a52-9163-fbd70da840d5)

**Quality Control**
Reads were trimmed using Trimmomatic with TruSeq3-PE adapters, a 4-base sliding window cut when average quality drops below 20, and removing leading and trailing bases with quality scores below 3.

**Error Correction**
Reads were error corrected using the default settings in rCorrector, a kmer-based method for correcting Illumina RNA-Seq reads.

**Assembly**
Reads are being assembled using rnaSPAdes, as single assemblies and the same grouping of co-assemblies as the metagenomes. Once both are run, they will be compared to determine the best method for assembly.

Reads will also go through another pipeline starting at this step for eukaryotes. This will result in two versions of the metatranscriptomes, one using a standard pipeline and one designed for maximizing eukaryotic data.
