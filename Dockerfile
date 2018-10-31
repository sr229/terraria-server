FROM mono

MAINTAINER Solus <solusoperandi@protonmail.ch>

EXPOSE 7777/tcp

ENV PUID=999
ENV PGID=999
ENV TSHOCK_TAG=4.3.25
ENV MONORUNTIME="/usr/bin/mono"
ENV MONOARGS="--server --gc=sgen -O=all"
ENV EXE="TerrariaServer.exe"
ENV EXEARGS="-worldpath /opt/Terraria/world -configpath /opt/Terraria/config -logpath /opt/Terraria/logs"

COPY init.sh /
RUN chmod +x /init.sh

RUN apt-get update && apt-get install unzip -yq && \
    mkdir -p /opt/Terraria/tshock

ADD https://github.com/Pryaxis/TShock/releases/download/v$TSHOCK_TAG/tshock_$TSHOCK_TAG.zip /opt/Terraria/

RUN unzip /opt/Terraria/tshock_$TSHOCK_TAG.zip -d /opt/Terraria/tshock && \
    rm /opt/Terraria/tshock_$TSHOCK_TAG.zip && \
    chmod +x /opt/Terraria/tshock/TerrariaServer.exe

VOLUME ["/opt/Terraria/world", "/opt/Terraria/config", "/opt/Terraria/logs", "/opt/Terraria/tshock/ServerPlugins"]

WORKDIR /opt/Terraria/tshock

ENTRYPOINT ["/init.sh"]
