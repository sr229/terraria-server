FROM mono:5

COPY exec /home/terra/
COPY entrypoint /home/terra/
COPY compile.sh /tmp
RUN /tmp/compile.sh

EXPOSE 7777
USER 10001
WORKDIR /opt/Terraria/tshock
VOLUME ["/opt/Terraria/world", "/opt/Terraria/config", "/opt/Terraria/logs", "/opt/Terraria/tshock/ServerPlugins"]
ENTRYPOINT ["/home/terra/entrypoint"]
CMD ["/home/terra/exec"]
