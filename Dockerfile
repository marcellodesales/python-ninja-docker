ARG BUILDER_PYTHON_VERSION
ARG BUILDER_NINJA_VERSION

FROM ubuntu

# https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai/1013396#1013396
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# RUN apt install software-properties-common
ARG BUILDER_PYTHON_VERSION
RUN echo ${BUILDER_PYTHON_VERSION} > python-version.txt
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python${BUILDER_PYTHON_VERSION} python3-pip python3-setuptools python3-dev \
    libglib2.0-0 libsm6 libxext6 libxrender1 libgl1-mesa-glx \
    g++ wget unzip && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/* && \
    apt-get autoremove -y && apt-get clean

# Just use python 3.8 as the installation
# https://tech.serhatteker.com/post/2019-12/upgrade-python38-on-ubuntu/
#   update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1 &&
#apt-get purge -y python3.6 && apt autoremove -y && \
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python${BUILDER_PYTHON_VERSION} 1 && \
    update-alternatives --config python3

ARG BUILDER_NINJA_VERSION
# Ninja
# https://www.marsja.se/pip-install-specific-version-of-python-package/
RUN pip3 install ninja==${BUILDER_NINJA_VERSION}

RUN pip3 install --upgrade pip
