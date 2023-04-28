#Rename focal_genomic_proteins_trimmed_idseqsclustered.fasta files  with species names
while read line
do
  	name=$(echo $line | cut -f1 -d "." | cut -f1,2 -d "_")
        cd $line
        cd focal/
        cat focal_genomic_proteins_trimmed_idseqsclustered.fasta | sed "s/>focal/>${name}_/" >${name}.fasta
        mv ${name}.fasta ./JAN2023_ALIGNMENT_ROUND2
        cd ../../
done<dir_genomes_file

