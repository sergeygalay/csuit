FROM ubuntu:20.04
RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -y mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386
RUN apt install -y libsdl2-2.0-0:i386
RUN apt-get update
RUN apt-get install -y gdb
WORKDIR /app
COPY REHLDS .
COPY hlds_run .
EXPOSE 27015/udp
RUN mkdir -p /root/.steam/sdk32/
RUN cp ./steamclient.so /root/.steam/sdk32/steamclient.so
RUN chmod +x ./hlds_run
RUN chmod +x ./hlds_linux
CMD ["./hlds_run","-nobreakpad","-game","cstrike","+port","27015","+maxplayers","32","+map","de_dust2"]