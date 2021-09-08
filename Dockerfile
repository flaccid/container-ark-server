FROM steamcmd/steamcmd
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
ENV STEAM_APP_ID=376030
ENV STEAM_INTALL_DIR=/home/steam
RUN apt-get -y update && \
    apt-get -y install bash libsdl2-dev && \
    rm -rf /var/lib/apt/lists/* && \
    adduser --gecos "" --disabled-password steam
RUN su - steam -c "steamcmd +login anonymous +force_install_dir $STEAM_INSTALL_DIR +app_update $STEAM_APP_ID +quit"
USER steam
VOLUME /home/steam
EXPOSE 7777/udp \
       7778/udp \
       27015/udp \
       27020/tcp
WORKDIR /home/steam
ENTRYPOINT ./ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?SessionName=ark?ServerPassword=ark?ServerAdminPassword=ark -server -log
