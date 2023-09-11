FROM ubuntu

# Add a Non-Root user
RUN useradd -s /bin/bash -m ubuntu && \
    apt update && \
    apt install -y sudo && \
    echo "ubuntu ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER ubuntu
WORKDIR /home/ubuntu
SHELL ["/bin/bash", "-c"]
 
# AWS CLI
RUN sudo apt update && \
    sudo apt install -y curl unzip sudo && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install && \
    rm awscliv2.zip
 
# Azure CLI
RUN sudo apt update && \
    sudo apt install -y ca-certificates curl apt-transport-https lsb-release gnupg && \
    curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null && \
    AZ_REPO=$(lsb_release -cs) && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list && \
    sudo apt update && \
    sudo apt install -y azure-cli
 
# GCloud CLI
RUN echo deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
    sudo apt update -y && \
    sudo apt install google-cloud-sdk -y

# Powershell
RUN sudo apt update && \
    sudo apt install -y wget apt-transport-https software-properties-common && \
    wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb" && \
    sudo dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    sudo apt update && \
    sudo apt install -y powershell

# jq
RUN sudo apt update && \
    sudo apt install -y jq