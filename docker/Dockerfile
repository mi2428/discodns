FROM golang:1.8
MAINTAINER mi2428 <tmiya@protonmail.ch>

ARG repository="https://github.com/mi2428/discodns"
ARG branch="master"
ARG workdir="/opt/discodns"

RUN git clone --depth 1 --branch ${branch} ${repository} ${workdir}

WORKDIR ${workdir}
RUN make
RUN ln -s ${workdir}/build/bin/discodns /go/bin/discodns

ADD entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

EXPOSE 53/tcp
EXPOSE 53/udp

ENTRYPOINT ["/sbin/entrypoint.sh"]
