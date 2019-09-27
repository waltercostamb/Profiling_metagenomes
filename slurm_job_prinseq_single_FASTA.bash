#!/bin/bash

    #Maria Beatriz Walter Costa

    #This script submits jobs to the slurm queueing system. It takes an array of IDs as input. You need to change the array @lista to include your IDs. You also need to change the directory (see marked warnings #########Warnings#########).
	
    #Usage: $bash SCRIPT

    #SBATCH --nodes=21 				#Numero de Nós
    #SBATCH --ntasks-per-node=1 		#Numero de tarefas por Nó
    #SBATCH --cpus-per-task=1 			#Numero de threads
    #SBATCH -p cpu
    #SBATCH -J limpeza_prinseq_SRR1283371 	#Nome job
    ##SBATCH --time=24:00:00	         	#Altera o tempo limite para 24 horas
 
    #Exibe os nós alocados para o Job
    echo $SLURM_JOB_NODELIST
    nodeset -e $SLURM_JOB_NODELIST
    cd $SCRATCH

    ####################################
    #                                  #
    #         Change directory         #
    #                                  #
    ####################################

    #Here you need to change the directory to your working directory
    cd $PATH

    #Commands below are only to test the script, if it correctly changed the directory
    #ls -lh
    #pwd

    module load prinseq/0.20.4
    module load perl/5.26

    #Array with the file IDs
    ####################################
    #                                  #
    #         Change array IDs         #
    #                                  #
    ####################################
    lista=(mgm4451759
mgm4451761
mgm4453297
mgm4529964
mgm4529965
mgm4536074
mgm4536100
mgm4536472
mgm4536473
mgm4536476
mgm4569549
mgm4569550
mgm4569551
mgm4569552
mgm4739174
mgm4739175
mgm4739176
mgm4739177
mgm4739178
mgm4739179
mgm4739180
mgm4739181
mgm4739182
mgm4739183
mgm4739184
mgm4739185
mgm4739186
mgm4739187
mgm4739188
mgm4739189)

for i in "${lista[@]}"
  do
	#This command submits jobs to the slurm queue
  	srun -N 21 -n 1 -c 1 $PATH/prinseq/0.20.4/bin/prinseq-lite.pl -verbose -fasta ${i}.3.299.1.fasta -min_len 80 -ns_max_p 2 -out_format 1

  done


