#FROM microsoft/dotnet:2.1.402-sdk-stretch
FROM ubuntu:18.04
LABEL maintainer="github.com/jsco2t"

# install required dependencies
RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y \
    apt-utils \
    apt-transport-https \
    apparmor \
    ca-certificates \
    gnupg2 \
    curl \
    build-essential \
    software-properties-common \
    nano \
    wget \
    libyaml-dev \
    libpython2.7-dev \
    python-pip \
    jq \
    xsltproc \
    zip \
    sudo \
    zsh \
    git \
    locales

RUN pip install --upgrade \
    awscli \
    s3cmd

# NOTE: It's **IMPORTANT** that the `k8s` version and the `kops` versions meet these requirements:
#   1. They must match the existing clusters (or be known as compatable)
#   2. They must be listed as compatable with eachother: https://github.com/kubernetes/kops#compatibility-matrix

# install k8s # https://storage.googleapis.com/kubernetes-release/release/stable.txt
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.11.3/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

# install kops # https://github.com/kubernetes/kops/releases
RUN curl -LO https://github.com/kubernetes/kops/releases/download/1.10.0/kops-linux-amd64 \
    && chmod +x kops-linux-amd64 \
    && mv kops-linux-amd64 /usr/local/bin/kops

ENV PATH="~/.local/bin:${PATH}"

# install docker
RUN echo "go ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add - \
    && sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable"

RUN apt-get update \
    && sudo apt-get install -y docker-ce

# install powershell core
RUN curl -LO https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
    && sudo dpkg -i packages-microsoft-prod.deb \
    && sudo apt-get update \
    && sudo apt-get install -y powershell \
    && rm packages-microsoft-prod.deb

# copy local resources/scripts to image
RUN mkdir /resources
COPY /resources /resources

# configure locales <--- some zsh styles need to know locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

# setup oh-my-zsh
RUN cat /resources/oh-my-szh-installer.sh | zsh || true

# re-configure zsh:
RUN cp /resources/.zshrc ~/.zshrc

# cleanup:
RUN  rm -rf /var/lib/apt/lists/*

# entrypoint
CMD ["zsh"]

# building
#   docker build -t "micro-manage:N.NN" .
#   Example: docker build -t "micro-manage:0.01" .
#   Example: docker build -t "micro-manage:0.01" ./ubuntu/
#
# running (for debug)
# note: you have to map in the host docker.sock for docker-in-docker to work: -v /var/run/docker.sock:/var/run/docker.sock
#   docker run -it --name micro-manage --entrypoint /bin/bash -v /var/run/docker.sock:/var/run/docker.sock micro-manage:N.NN
#   Example: docker run -it --name micro-manage --entrypoint /bin/bash -v /var/run/docker.sock:/var/run/docker.sock micro-manage:0.01
#