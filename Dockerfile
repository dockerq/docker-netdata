FROM ubuntu:14.04
MAINTAINER adolphlwq kenan3015@gmail.com
# install denpendencies for netdata
RUN apt-get update && \
    apt-get install -yqq zlib1g-dev uuid-dev libmnl-dev gcc make git \
    autoconf autoconf-archive autogen automake pkg-config
WORKDIR /opt/netdata
RUN git clone https://github.com/firehol/netdata.git --depth=1 && \
    cd netdata && ./netdata-installer.sh --dont-wait --dont-start-it && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
EXPOSE 19999
ENTRYPOINT ["/usr/sbin/netdata"]
