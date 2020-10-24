FROM ubuntu:14.04
COPY ./download /workspace
ENV PYENV_ROOT=/root/.pyenv
ENV PATH=$PYENV_ROOT/bin:$PATH
RUN mv /workspace/pyenv /root/.pyenv && \
    mkdir /root/.pyenv/cache && \
    mv /workspace/Python-3.7.9.tgz /root/.pyenv/cache && \
    pyenv install 3.7.9
