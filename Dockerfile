FROM alpine:3.8
LABEL maintainer="github.com/jsco2t"

# arguments
ARG KUBECTLURL="https://storage.googleapis.com/kubernetes-release/release/v1.11.3/bin/linux/amd64/kubectl"
ARG KOPSURL="https://github.com/kubernetes/kops/releases/download/1.10.0/kops-linux-amd64"
ARG AWSAUTHURL="https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/linux/amd64/aws-iam-authenticator"
ARG SAM2AWSURL="https://github.com/Versent/saml2aws/releases/download/v2.9.1/saml2aws_2.9.1_linux_amd64.tar.gz"

# install required dependencies
RUN apk update && apk upgrade && apk add --no-cache \
    bash \
    bind-tools \
    ca-certificates \
    coreutils \
    curl \
    docker \
    git \
    iputils \
    jq \
    less \
    nano \
    python \
    py-pip \
    htop \
    lsof \
    redis \
    stunnel \
    zip \
    zsh

# install the aws tools using python
RUN pip install --upgrade \
    awscli \
    s3cmd

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

# # install powershell core

# setup markdown formatter: mdv (current version available via pip has a bug - manually installing)
RUN mkdir /resources \
    && pip install setuptools \
    && git clone https://github.com/axiros/terminal_markdown_viewer.git /resources/terminal_markdown_viewer \
    && /resources/terminal_markdown_viewer/setup.py install 

# this is a bit of a "hack" the above install isn't working correctly from the context of the 
# docker build process - a work around is to ask pip to do the install - but it complains about _other_
# stuff - so we pipe it's errors and then return a 0 exit code.
RUN pip install /resources/terminal_markdown_viewer &> /dev/null ; exit 0

#
# since the following change often - do last
#

# setup environment
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV PATH="~/.local/bin:${PATH}"
#ENV PYTHONPATH=${PYTHONPATH}:/usr/lib/python2.7/site-packages

# remove the need to auth for sudo
RUN echo "go ALL=NOPASSWD: ALL" >> /etc/sudoers

# copy local resources/scripts to image
# RUN mkdir /resources - created above
COPY /resources /resources

RUN mkdir /scripts
COPY /scripts /scripts
RUN chmod +x /scripts/*

RUN mkdir /documents
COPY /documents /documents

# setup oh-my-zsh
RUN cat /resources/oh-my-zsh-installer.sh | zsh || true

# re-configure shell:
RUN cp /resources/.zshrc ~/.zshrc \
    && cp /resources/dircolors.ansi-universal ~/.dircolors \
    && cp /resources/js-oh-my.zsh-theme ~/.oh-my-zsh/themes/js-oh-my.zsh-theme

# cleanup:

# entrypoint
WORKDIR /root
CMD ["zsh"]

# building
#   docker build -t "micro-manage:N.NN" .
#   Example: docker build -t "micro-manage:0.01" .
#
# running
#   docker run -it --name micro-manage micro-manage:0.01
# 
# cleanup:
#   docker rm micro-manage
#   docker rmi micro-manage:0.01