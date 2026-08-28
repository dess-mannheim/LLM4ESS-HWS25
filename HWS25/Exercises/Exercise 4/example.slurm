#!/bin/bash
#SBATCH --job-name=EXAMPLE1
#SBATCH --partition=gpu_h100  # choose your partition (you can check which ones are available with sinfo_t_idle)
#SBATCH --time=06:00:00  	# computing time, after this, your job will be terminated
#SBATCH --nodes=1  		# compute nodes, for most jobs one is enough
#SBATCH --ntasks=1  		# number of tasks across all nodes
#SBATCH --gres=gpu:1
#SBATCH --output="logs/EXAMPLE1" # writes the outputs of your job to a file "EXAMPLE1" in the logs folder
#SBATCH --mail-type=begin       # send email when job begins
#SBATCH --mail-type=end         # send email when job ends
#SBATCH --mail-type=fail        # send email when job fails
#SBATCH --mail-user=USERNAME@mail.uni-mannheim.de

module load devel/miniforge # For using a conda environment
module load devel/cuda # For using the GPU

source ~/.bashrc

conda activate LLM4ESS # Activate the conda environment

python run_model.py # Here you run your code!

conda deactivate # Deactivate the conda environment after use
