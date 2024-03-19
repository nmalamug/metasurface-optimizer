#!/bin/bash -l

#$ -N deg30SPP # Set the job name
#$ -m ea
#$ -j y
#$ -l h_rt=24:00:00
#$ -pe mpi_28_tasks_per_node 224
 
source /ad/eng/bin/engenv.sh
module load openmpi/3.1.4
module load lumerical/2021R1.4

PREFIX="surface30d"
SUFFIX="Deg.fsp" 

for i in {0..89}
do
    mpirun -np $NSLOTS -v fdtd-engine-ompi-lcl "$PREFIX$i$SUFFIX"
done
