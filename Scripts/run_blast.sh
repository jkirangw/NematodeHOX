
#create blastdb using output protein models from Augustus (Hox containg scaffolds/contigs)
makeblastdb -dbtype prot -in ${species}.faa

#Run blast
blastp -query ref_hoxes -db ${species}.faa -evalue 1e-10 -outfmt 6 -max_target_seqs 5 -num_threads 8 > ${species}.blast.out
