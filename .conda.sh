#! /bin/bash

CONDA_ENV_FILE=".conda.yml"

if [ -f $CONDA_ENV_FILE ]; then
    echo "$CONDA_ENV_FILE found"
    # Parse the conda environment name from the specified env file
    GP_CONDA_ENV=$(head -n 1 $CONDA_ENV_FILE | cut -d':' -f2-)

    # Create new conda env from file (answer yes to confirmation prompt)
    echo 'y' | conda env create -f $CONDA_ENV_FILE
    conda activate $GP_CONDA_ENV

    # So that other bash terminals are also activated, add to .bashrc
    echo "conda activate $GP_CONDA_ENV" >> ~/.bashrc
else
    echo
    echo "--------------------------------------------------------------"
    echo "ERROR:   $CONDA_ENV_FILE NOT FOUND"
    echo "--------------------------------------------------------------"
    echo
    echo "Gitpod startup is attempting to recreate a Conda environment"
    echo "The env file is missing.  Create a new environment and file..."
    echo
    echo "       $ conda create -n NAME   # suggested name: jup"
    echo "       $ conda activiate NAME"
    echo "       $ conda env export > $CONDA_ENV_FILE"
    echo
    echo "--------------------------------------------------------------"
    echo
fi
#  - init: [ -f .conda.yml ] && { \
#      GP_CONDA_ENV=$(head -n 1 .conda.yml | cut -d':' -f2-); \
#      echo 'y' | conda env create -f .conda.yml; \
#      echo "conda activate $GP_CONDA_ENV" >> .bashrc; \
#      }