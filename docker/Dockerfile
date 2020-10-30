FROM ubuntu:18.04

MAINTAINER YeZhengMao <yezhengmaolove@gmail.com>

COPY ./download /workspace

ENV PATH="/root/.pyenv/shims:/root/.pyenv/bin:$PATH" \
    PYENV_ROOT="/root/.pyenv" \
    LANG="en_US.UTF-8"

RUN sed -i "s@http://.*archive.ubuntu.com@http://mirrors.huaweicloud.com@g" /etc/apt/sources.list \
    && sed -i "s@http://.*security.ubuntu.com@http://mirrors.huaweicloud.com@g" /etc/apt/sources.list \
    && apt-get update \
    && DEBIAN_FRONTEND="noninteractive" TZ="Asia/Shanghai" \
        apt-get install -y --no-install-recommends \ 
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        wget \
        curl \
        llvm \
        libncurses5-dev \
        libncursesw5-dev \
        xz-utils \
        tk-dev \
        libffi-dev \
        liblzma-dev \
        python-openssl \
        git \
	ca-certificates \
    && mkdir -p /root/.pyenv/cache \
    && mv /workspace/pyenv/* /root/.pyenv \
    && mv /workspace/Python-3.7.9.tar.xz /root/.pyenv/cache/Python-3.7.9.tar.xz \
    && pyenv install -v 3.7.9 \
    && pyenv global 3.7.9 \
    && yes | /workspace/fzf/install 
