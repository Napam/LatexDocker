FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    texlive-full \
    && apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

WORKDIR /project
ENV HOME=/project

ARG user=kanyewest
ARG uid=1000
ARG gid=1000

RUN groupadd -g $gid $user && \
    useradd --shell /bin/bash -u $uid -g $gid $user && \
    usermod -a -G sudo $user && \
    usermod -a -G root $user && \
    passwd -d $user

CMD ["/bin/bash"]
