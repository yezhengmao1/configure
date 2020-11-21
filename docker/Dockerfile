FROM ubuntu:18.04

MAINTAINER YeZhengMao <yezhengmaolove@gmail.com>

COPY ./download /workspace

ENV PATH="/usr/local/go/bin:/root/.pyenv/shims:/root/.pyenv/bin:$PATH" \
    PYENV_ROOT="/root/.pyenv" \
    LANG="en_US.UTF-8"

RUN useradd -rm -d /root -s /bin/bash -g root -G sudo -u 1000 ide \
    && sed -i "s@http://.*archive.ubuntu.com@http://mirrors.tools.huawei.com@g" /etc/apt/sources.list \
    && sed -i "s@http://.*security.ubuntu.com@http://mirrors.tools.huawei.com@g" /etc/apt/sources.list \
    && apt-get update \
    && DEBIAN_FRONTEND="noninteractive" TZ="Asia/Shanghai" \
        apt-get install -y --no-install-recommends \ 
        build-essential \
        cmake \
        ctags \
        gcc-8 \
        g++-8 \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        wget \
        curl \
        tmux \
        llvm-10 \
        libclang-10-dev \
        clang-10 \
        clang-tidy-10 \
        libncurses5-dev \
        libncursesw5-dev \
        ruby-dev \
        lua5.2 \
        liblua5.2-dev \
        libperl-dev \
        bison \
        libevent-dev \
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
    && PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install -v 3.7.9 \
    && pyenv global 3.7.9 \
    && cd /workspace/vim \
    && ./configure \
        --enable-gui=no \
        --enable-multibyte \
        --enable-rubyinterp=yes \
        --enable-python3interp=yes \
        --with-python3-config-dir=$(python3-config --configdir) \
        --enable-perlinterp=yes \
        --enable-luainterp=yes \
        --enable-cscope \
        --prefix=/usr/local \
    && make VIMRUNTIMEDIR=/usr/local/share/vim/vim82 -j4 \
    && make install \
    && tar -C /usr/local -xzf /workspace/go1.15.4.linux-amd64.tar.gz \
    && tar -C /usr/local/bin -xzf /workspace/fzf-0.24.3-linux_amd64.tar.gz \
    && mkdir -p /root/.vim/autoload /root/.vim/bundle /root/.vim/plugin \
    && mv /workspace/pathogen/autoload/pathogen.vim /root/.vim/autoload/ \
    && mv /workspace/youcompleteme /root/.vim/bundle/ \
    && mv /workspace/tagbar /root/.vim/bundle/ \
    && mv /workspace/signify /root/.vim/bundle/ \
    && mv /workspace/fzf /root/.vim/bundle/ \
    && mv /workspace/fzf.vim /root/.vim/bundle/ \
    && mv /workspace/rainbow /root/.vim/bundle/ \
    && mv /workspace/nerdtree /root/.vim/bundle/ \
    && mv /workspace/cursorword /root/.vim/bundle/ \
    && mv /workspace/interestingwords /root/.vim/bundle/ \
    && mv /workspace/vimrc /root/.vimrc \
    && mv /workspace/tmux.conf /root/.tmux.conf \
    && mv /workspace/p.vim /root/.vim/plugin/p.vim \
    && cd /root/.vim/bundle/youcompleteme \
    && CXX="/usr/bin/g++-8" ./install.py --system-libclang --clang-completer \
    && rm -rf /workspace
