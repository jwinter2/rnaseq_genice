# rnaseq_genice

[rnaseq-pipeline.pptx](https://github.com/user-attachments/files/26190391/rnaseq-pipeline.pptx)

**Quality Control**
Reads were trimmed using Trimmomatic with TruSeq3-PE adapters, a 4-base sliding window cut when average quality drops below 20, and removing leading and trailing bases with quality scores below 3.

**Assembly**
Reads are being assembled using rnaSPAdes, as single assemblies and the same grouping of co-assemblies as the metagenomes. Once both are run, they will be compared to determine the best method for assembly.

Reads will also go through another pipeline starting at this step for eukaryotes. This will result in two versions of the metatranscriptomes, one using a standard pipeline and one designed for maximizing eukaryotic data.
