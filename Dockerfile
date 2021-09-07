FROM steamcmd/steamcmd
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
ENV STEAM_APP_ID=376030
RUN apt-get -y update && \
    apt-get -y install bash libsdl2-dev && \
    rm -rf /var/lib/apt/lists/* && \
    adduser --gecos "" --disabled-password steam
RUN su - steam -c "steamcmd +login anonymous +force_install_dir /home/steam +app_update $STEAM_APP_ID +quit"
EXPOSE 7777/udp \
       7778/udp \
       27015/udp \
       27020/tcp
USER steam
VOLUME /home/steam
WORKDIR /home/steam
ENTRYPOINT ./ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?SessionName=ark?ServerPassword=ark?ServerAdminPassword=ark -server -log
