FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y curl \
  gcc \
  vim \
  python3-dev \
  libkrb5-dev \
  python3-pip \
  python3-venv \
  openssh-client

RUN pip3 install ansible 

RUN ansible-galaxy collection install community.general
RUN ansible-galaxy collection install community.docker

WORKDIR /ansible
