FROM fedora
RUN dnf install libjpeg libmicrohttpd -y
WORKDIR /opt/textsynth
COPY download-and-start-textsynth.sh ts_server.cfg /
CMD ["/download-and-start-textsynth.sh"]
STOPSIGNAL INT
EXPOSE 8020
