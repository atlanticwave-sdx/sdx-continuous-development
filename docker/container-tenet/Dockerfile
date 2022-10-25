# pull os base image
FROM debian_base

# set work directory
RUN mkdir /var/lib/kytos
RUN mkdir /var/run/kytos
RUN mkdir /var/tmp/kytos
RUN mkdir /etc/kytos

RUN mkdir -p /usr/src/kytos
WORKDIR /usr/src/kytos

RUN for repo in python-openflow kytos-utils kytos flow_manager mef_eline of_core of_lldp pathfinder storehouse topology; do git clone https://github.com/kytos-ng/${repo}; done

RUN git clone https://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@github.com/atlanticwave-sdx/kytos-sdx-topology sdx_topology

RUN for repo in python-openflow kytos-utils kytos flow_manager mef_eline of_core of_lldp pathfinder storehouse topology sdx_topology/app; do cd ${repo}; python3 setup.py develop; cd ..; done

# add app
COPY ./container-tenet/tenet_kytos.sh .
RUN chmod 755 /usr/src/kytos/tenet_kytos.sh
ENTRYPOINT ["./tenet_kytos.sh"]
