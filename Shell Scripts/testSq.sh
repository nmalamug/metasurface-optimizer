#!/bin/bash -l

#$ -N cross_circ # Set the job name
#$ -m ea
#$ -j y
#$ -l h_rt=24:00:00
#$ -pe mpi_28_tasks_per_node 224
 
source /ad/eng/bin/engenv.sh
module load openmpi/3.1.4
module load lumerical/2021R1.4

LX="Lx_"
LY="Ly_"
IX="w_" 
IY="r_"
SUFFIX=".fsp"

for i in {1..41}
do
    for j in {1..21}
    do
        for k in {1..4}
        do
            for l in {1..21}
            do
                if [ -e "$LX$i$LY$j$IX$k$IY$l$SUFFIX" ]
                then
                    mpirun -np $NSLOTS -v fdtd-engine-ompi-lcl "$LX$i$LY$j$IX$k$IY$l$SUFFIX"
                fi
            done
        done
    done
done
