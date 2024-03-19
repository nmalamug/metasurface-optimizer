#!/bin/bash -l

#$ -N deg30_1 # Set the job name
#$ -m ea
#$ -j y
#$ -l h_rt=24:00:00
#$ -pe mpi_28_tasks_per_node 112
 
source /ad/eng/bin/engenv.sh
module load openmpi/3.1.4
module load lumerical/2021R1.4

LX="Lx_"
LY="Ly_"
IX="ix_" 
IY="iy_"
SUFFIX=".fsp"

for i in {1..3}
do
    for j in{1..3}
    do
        for k in {1..3}
        do
            for l in {1..3}
            do
                mpirun -np $NSLOTS -v fdtd-engine-ompi-lcl "$LX$i$LY$j$IX$k$IY$l$SUFFIX"
            done
        done
    done
    
done
