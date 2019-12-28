FROM gitpod/workspace-full

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && \
#     sudo apt-get install -yq bastet && \
#     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/42_config_docker/

# Do things here as root
USER root

RUN sudo apt-get -q update


# Switch to the user to configure environment settings
# Environment settings in the YAML need the dockerfile to end as gitpod
USER gitpod
