# pull os base image
FROM debian_base

# set work directory

WORKDIR /

RUN git clone https://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@github.com/atlanticwave-sdx/kytos-sdx-topology sdx_topology

RUN for repo in sdx_topology/app; do cd ${repo}; python3 setup.py develop; cd ..; done

RUN echo "192.168.0.6 mongo1t" >> /etc/hosts
RUN echo "192.168.0.7 mongo1t" >> /etc/hosts
RUN echo "192.168.0.8 mongo1t" >> /etc/hosts

# add app
#COPY ./sdx_containers/amlight/amlight_kytos.sh .
#COPY ./patches /tmp/patches
#RUN chmod -R 755 /tmp
#RUN chmod 755 amlight_kytos.sh
#ENTRYPOINT ["./amlight_kytos.sh"]
