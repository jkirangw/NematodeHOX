conda activate augustus 

#step 1 create alignment profile for augustus
mafft --auto ref_hoxes > fam.aln 

#AUGUSTUS-PPX: PREDICTIONS USING PROTEIN PROFILES
perl ./Augustus/scripts/msa2prfl.pl fam.aln > fam.prfl

#Run augustus in complete mode
augustus --UTR=off --species=caenorhabditis --proteinprofile=ref_hoxes.prfl --genemodel=complete caenorhabditis_Hox_cluster.fasta >caenorhabditis_Hox_cluster.gff

#Generate predicted gene models output file
perl ./Augustus/scripts/getAnnoFasta.pl caenorhabditis_Hox_cluster.gff
