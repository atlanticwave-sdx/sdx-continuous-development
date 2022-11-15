# pull os base image
FROM debian_base

# set work directory

WORKDIR /

RUN git clone https://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@github.com/atlanticwave-sdx/kytos-sdx-topology sdx_topology

RUN for repo in sdx_topology/app; do cd ${repo}; python3 setup.py develop; cd ..; done

# add app
COPY ./container-sax/sax_kytos.sh .
#COPY ./patches /tmp/patches
#RUN chmod -R 755 /tmp
RUN chmod 755 sax_kytos.sh
ENTRYPOINT ["./sax_kytos.sh"]
