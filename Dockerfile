FROM debian:11 AS downloader

RUN apt update && apt install -y wget bzip2

ARG TEAMSPEAK_VERSION=3.13.7

RUN wget https://files.teamspeak-services.com/releases/server/$TEAMSPEAK_VERSION/teamspeak3-server_linux_amd64-$TEAMSPEAK_VERSION.tar.bz2 -O ts3server.tar.bz2 && \
    mkdir -p /ts3server && tar xf ts3server.tar.bz2 --strip-components=1 -C /ts3server &&  rm ts3server.tar.bz2

FROM idk1703/box64:latest

RUN apt update && apt install -y ca-certificates locales && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

ENV BOX64_LOG=0
ENV LANG en_US.UTF-8

ENV TS3_VOICE_IP=0.0.0.0
ENV TS3_VOICE_PORT=9987
ENV TS3_QUERY_PORT=10011
ENV TS3_FILETRANSFER_PORT=30033
ENV TS3_LICENSE_ACCEPTED=0

WORKDIR /ts3server
COPY ts3server.sh /ts3server
COPY --from=downloader /ts3server /ts3server

ENTRYPOINT ["bash", "ts3server.sh"]