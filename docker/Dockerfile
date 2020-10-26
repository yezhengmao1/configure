FROM ubuntu:14.04
COPY ./download /workspace
ENV PYENV_ROOT=/root/.pyenv
ENV PATH=$PYENV_ROOT/bin:$PATH
RUN sudo sed -i "s@http://.*archive.ubuntu.com@http://mirrors.huaweicloud.com@g" /etc/apt/sources.list && \
    sudo sed -i "s@http://.*security.ubuntu.com@http://mirrors.huaweicloud.com@g" /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y build-essential \
    libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl git && \
    mv /workspace/pyenv /root/.pyenv && \
    mkdir /root/.pyenv/cache && \
    mv /workspace/Python-3.7.9.tar.xz /root/.pyenv/cache/Python-3.7.9.tar.xz && \
    pyenv install 3.7.9
