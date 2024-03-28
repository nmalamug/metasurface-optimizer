#!/bin/bash -l

#$ -N rotCross # Set the job name
#$ -m ea
#$ -j y
#$ -l h_rt=12:00:00
#$ -pe mpi_28_tasks_per_node 224
 
source /ad/eng/bin/engenv.sh
module load openmpi/3.1.4
module load lumerical/2021R1.4

PREFIX="Lx_"
MIDDLE="Ly_"
WIDTH="w_"
ROT="rot_"
SUFFIX=".fsp" 

for i in {1..17}
do
    for j in {1..17}
    do
        for k in {1..5}
        do
            for l in {1..9}
            do

                mpirun -np $NSLOTS -v fdtd-engine-ompi-lcl "$PREFIX$i$MIDDLE$j$WIDTH$k$ROT$l$SUFFIX"
            done
        done
    done
done