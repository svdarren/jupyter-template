FROM gitpod/workspace-full

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && \
#     sudo apt-get install -yq bastet && \
#     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/42_config_docker/



# Install conda from apt-get:  https://docs.conda.io/projects/conda/en/latest/user-guide/install/rpm-debian.html
USER root
# Install our public gpg key to trusted store
RUN curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | gpg --dearmor > conda.gpg && \
    install -o root -g root -m 644 conda.gpg /usr/share/keyrings/conda-archive-keyring.gpg && \
    gpg --keyring /usr/share/keyrings/conda-archive-keyring.gpg --no-default-keyring \
        --fingerprint 34161F5BF5EB1D4BFBBB8F0A8AEB4F8B29D82806 && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] \
         https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" > /etc/apt/sources.list.d/conda.list

RUN apt-get -q update && \
    apt-get install -yq conda && \
    /opt/conda/bin/conda update -n base -c defaults conda -y && \
    ls -la /home/gitpod > /home/gitpod/perms1.log



# Switch to the user to configure environment settings
USER gitpod
# Put the Conda config script, which configures the path, into the bash startup script
# Also initialize the user shell for conda
RUN { echo; \
      echo 'source /opt/conda/etc/profile.d/conda.sh'; } >> .bashrc && \
      ls -la /home/gitpod > /home/gitpod/perms2.log && \
    /opt/conda/bin/conda init -q && \
    ls -la /home/gitpod > /home/gitpod/perms3.log
