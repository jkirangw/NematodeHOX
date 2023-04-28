#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --error=./bitakora.err
#SBATCH --output=./bitakora.out
#SBATCH --mem=46GB
#SBATCH --time=300:00:00
#SBATCH --mail-user=jkirangw@uni-koeln.de
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --account=AG-Schiffer


module purge

module load openjdk/11.0.2

while read dir
do
  	cd ./${dir}
        cp ../runBITACORA_genome_mode.sh .
        ./runBITACORA_genome_mode.sh
        cd ../
done<dir_genomes_file



