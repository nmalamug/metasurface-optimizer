#!/bin/bash -l

#$ -N deg30_1 # Set the job name
#$ -m ea
#$ -j y
#$ -l h_rt=12:00:00
#$ -pe mpi_28_tasks_per_node 224
 
source /ad/eng/bin/engenv.sh
module load openmpi/3.1.4
module load lumerical/2021R1.4

PREFIX="Lx_"
MIDDLE="Ly_"
SUFFIX=".fsp" 

for i in {1..41}
do
    for j in {1..21}
    do
        mpirun -np $NSLOTS -v fdtd-engine-ompi-lcl "$PREFIX$i$MIDDLE$j$SUFFIX"
    done
done