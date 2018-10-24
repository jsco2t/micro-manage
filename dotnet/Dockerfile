FROM microsoft/dotnet:2.1.403-sdk-stretch
#FROM ubuntu:18.04
LABEL maintainer="github.com/jsco2t"

# arguments
ARG KUBECTLURL="https://storage.googleapis.com/kubernetes-release/release/v1.11.3/bin/linux/amd64/kubectl"
ARG KOPSURL="https://github.com/kubernetes/kops/releases/download/1.10.0/kops-linux-amd64"
ARG AWSAUTHURL="https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/linux/amd64/aws-iam-authenticator"
ARG SAM2AWSURL="https://github.com/Versent/saml2aws/releases/download/v2.9.1/saml2aws_2.9.1_linux_amd64.tar.gz"
ARG NODEVERSION="node_8.x"
ARG MSPKGKEYURL="https://packages.microsoft.com/keys/microsoft.asc"
ARG MSDEBPKGURL="https://packages.microsoft.com/repos/microsoft-debian-stretch-prod"

# install required dependencies
RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y \
    apt-utils \
    apt-transport-https \
    apparmor \
    ca-certificates \
    gnupg \
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

# install aws tooling:
RUN pip install --upgrade \
    awscli \
    s3cmd

# install nodejs/npm:
# version with debian stretch was stale and was missing 'npm'
RUN DISTRO="$(lsb_release -s -c)" && \
    curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo "deb https://deb.nodesource.com/$NODEVERSION $DISTRO main" | tee /etc/apt/sources.list.d/nodesource.list && \
    #echo "deb-src https://deb.nodesource.com/$NODEVERSION $DISTRO main" | tee -a /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y nodejs

# install powershell core
# https://docs.microsoft.com/en-us/powershell/scripting/setup/installing-powershell-core-on-linux?view=powershell-6
RUN curl $MSPKGKEYURL | sudo apt-key add - && \
    echo "deb [arch=amd64] $MSDEBPKGURL stretch main" > /etc/apt/sources.list.d/microsoft.list && \
    apt-get update && \
    apt-get install -y powershell

# NOTE: It's **IMPORTANT** that the `k8s` version and the `kops` versions meet these requirements:
#   1. They must match the existing clusters (or be known as compatable)
#   2. They must be listed as compatable with eachother: https://github.com/kubernetes/kops#compatibility-matrix

# install k8s # https://storage.googleapis.com/kubernetes-release/release/stable.txt
RUN curl -LO $KUBECTLURL \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

# install kops # https://github.com/kubernetes/kops/releases
RUN curl -LO $KOPSURL \
    && chmod +x kops-linux-amd64 \
    && mv kops-linux-amd64 /usr/local/bin/kops

# install aws-iam-authenticator:
RUN curl -LO $AWSAUTHURL \
    && chmod +x aws-iam-authenticator \
    && mv aws-iam-authenticator /usr/local/bin/aws-iam-authenticator

# install saml2aws https://github.com/Versent/saml2aws
RUN curl -L -o saml2aws.tar.gz $SAM2AWSURL \
    && tar zxf saml2aws.tar.gz \
    && chmod +x saml2aws \
    && mv saml2aws /usr/local/bin/saml2aws \
    && rm saml2aws.tar.gz

# setup markdown formatting options
RUN pip install mdv && \
    npm install -g msee && \
    npm install -g markdown-cli

#
# since the following change often - do last
#

# setup environment
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV PATH="~/.local/bin:${PATH}"
# remove the need to auth for sudo
RUN echo "go ALL=NOPASSWD: ALL" >> /etc/sudoers

# copy local resources/scripts to image
RUN mkdir /resources
COPY /resources /resources

RUN mkdir /scripts
COPY /scripts /scripts
RUN chmod +x /scripts/*

RUN mkdir /documents
COPY /documents /documents

# setup oh-my-zsh
RUN cat /resources/oh-my-zsh-installer.sh | zsh || true

# re-configure zsh:
RUN cp /resources/.zshrc ~/.zshrc

# cleanup:
RUN apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# entrypoint
WORKDIR /root
CMD ["zsh"]

# building
#
#   PLEASE NOTE: Building this dockerfile must be done from the parent directory
#   so that the build context is correctly established.
#
#   docker build -t "micro-manage:N.NN-dotnet" -f ./dotnet/Dockerfile .
#   Example: docker build -t "micro-manage:0.01-dotnet" -f ./dotnet/Dockerfile .
#
# running
#   docker run -it --name micro-manage micro-manage:0.01-dotnet
# 
# cleanup:
#   docker rm micro-manage
#   docker rmi micro-manage:0.01-dotnet