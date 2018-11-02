#!/bin/sh
set -e

# Maintainers: if there's a new version of TShock, just change this.
TSHOCK_TAG="4.3.25"

# Step 1: Install the program

apt-get update && \
apt-get install -y wget unzip && \
rm -rf /var/lib/apt/lists/* /tmp/* && \
apt-get clean;

mkdir -p  /opt/Terraria
cd /opt/Terraria && \
    wget "https://github.com/Pryaxis/TShock/releases/download/v$TSHOCK_TAG/tshock_$TSHOCK_TAG.zip" --quiet  && \
    unzip /opt/Terraria/tshock_$TSHOCK_TAG.zip -d /opt/Terraria/tshock;
    chmod -R 755 /opt/Terraria/tshock/TerrariaServer.exe;
    rm -rf /opt/Terraria/tshock_$TSHOCK_TAG.zip;

# Step 2 : add user
adduser --disabled-password --gecos '' terra && \
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user && \
chmod 0440 /etc/sudoers.d/user;
chown -R terra:terra /home/terra;
# Step 3: Add permissions
chmod g+rw /home &&  \
mkdir -p /opt/Terraria/logs && \
mkdir -p /opt/Terraria/tshock/ServerPlugins && \
mkdir -p /opt/Terraria/world && \
mkdir -p /opt/Terraria/config && \
chmod g+rw /opt/Terraria/ && \
chmod g+rw /opt/Terraria/* && \
chmod g+rw /opt/Terraria/*/* && \
chmod g+rw /opt/Terraria/tshock/* && \
chown -R terra:terra /opt/Terraria/ && chown -R terra:terra /opt/Terraria/* && chown -R terra:terra /opt/Terraria/tshock/*.*;
chgrp -R 0 /home/terra && \
chmod a+x /home/terra/entrypoint && \
chmod a+x /home/terra/exec && \
chmod -R g=u /home/terra && \
chmod g=u /etc/passwd;
