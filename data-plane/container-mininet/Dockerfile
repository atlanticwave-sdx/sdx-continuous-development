FROM italovalcy/mininet:2.3.0d6

USER root
WORKDIR /root

COPY ./container-mininet/start_mininet.sh /
COPY ./container-mininet/link-hosts.py /
COPY ./scripts/curl/ /curl
RUN chmod +x /start_mininet.sh
RUN chmod 775 /link-hosts.py

ENTRYPOINT ["/start_mininet.sh"]
