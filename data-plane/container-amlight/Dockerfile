# pull os base image
FROM amlight_kytos

# set work directory

WORKDIR /

RUN git clone https://github.com/atlanticwave-sdx/kytos-sdx-topology sdx_topology

RUN for repo in sdx_topology/app; do cd ${repo}; python3 setup.py develop; cd ..; done
