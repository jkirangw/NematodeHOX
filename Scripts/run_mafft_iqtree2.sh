#!/bin/bash -i

#SBATCH --nodes=1
#SBATCH --ntasks=12
#SBATCH --error=./run.err
#SBATCH --output=./run.out
#SBATCH --mem=48GB
#SBATCH --time=400:00:00
#SBATCH --account=UniKoeln
#SBATCH --mail-user=jkirangw@uni-koeln.de
#SBATCH --mail-type=BEGIN,END,FAIL

module purge

#Activate the hmm env
conda activate hmm 

#Run mafft
mafft --auto Nematode_Hox_complements.faa > Nematode_Hox_complements_aligned.out


#Run IQTree2 
iqtree -s extracted_HOM_Nematode_Hox_complements_aligned -st AA -m TEST -bb 1000 -alrt 1000
