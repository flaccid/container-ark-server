FROM debian:11
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
ENV STEAM_APP_ID=376030
ENV STEAM_INSTALL_DIR=/home/steam
RUN apt-get -y update && \
    apt-get -y install locales locales-all software-properties-common && \
    add-apt-repository non-free && \
    dpkg --add-architecture i386 && \
    apt-get -y update && \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections && \
    apt-get -y install steamcmd bash libsdl2-2.0-0:i386 && \
    rm -rf /var/lib/apt/lists/* && \
    adduser --gecos "" --disabled-password steam && \
    locale-gen en_US en_US.UTF-8 && \
    dpkg-reconfigure locales
USER steam
RUN touch /home/steam/.steam && \
    /usr/games/steamcmd +quit && \
    /usr/games/steamcmd +login anonymous +force_install_dir $STEAM_INSTALL_DIR +app_update "$STEAM_APP_ID" +quit && \
    echo "STDERR ERRORS: $(cat /home/steam/Steam/logs/stderr.txt)" && \
    rm /home/steam/Steam/logs/stderr.txt
VOLUME /home/steam/.steam
EXPOSE 7777/udp \
       7778/udp \
       27015/udp \
       27020/tcp
WORKDIR /home/steam
ENTRYPOINT ./ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?SessionName=ark?ServerPassword=ark?ServerAdminPassword=ark -server -log
