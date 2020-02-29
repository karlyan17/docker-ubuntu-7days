FROM ubuntu
RUN apt update -y \
    && apt upgrade -y \
    && apt install -y wget lib32gcc1 python curl python-apt xterm zenity
RUN cd /root \
    && wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz \
    && tar xvzf steamcmd_linux.tar.gz
ADD 7DAYS.scmd /root/7DAYS.scmd
RUN cd /root \
    && ./steamcmd.sh +runscript 7DAYS.scmd
EXPOSE 26900/tcp
EXPOSE 8081/tcp
EXPOSE 26900/udp
EXPOSE 26901/udp
EXPOSE 26902/udp
VOLUME /root/.local/share/7DaysToDie
ADD entrypoint.sh /root/7daysded/entrypoint.sh
CMD ["/root/7daysded/entrypoint.sh","-configfile=/root/.local/share/7DaysToDie/serverconfig.xml"]
