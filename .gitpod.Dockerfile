FROM gitpod/workspace-full

USER gitpod

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && \
#     sudo apt-get install -yq bastet && \
#     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/42_config_docker/

RUN (cd /tmp; curl -O https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh)
RUN bash /tmp/Anaconda3-2019.10-Linux-x86_64.sh -b
RUN eval "$(/home/gitpod/anaconda3/bin/conda shell.bash hook)"
# RUN conda init
