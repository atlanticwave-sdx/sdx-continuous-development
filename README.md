  <div align="center">
    <h1><code>SDX-Continuous-Development</code></h1>
  </div>

Overview
========

The `sdx-continuous-development` repo incorporate a few scripts, configs and a docker compose file which helps instantiation of the core SDX environment. The user interface components are not covered by this repo (yet), such as Meican and SDX-Lib.

The main idea here is to run a few commands and get all core components up and running, so tests can be executed.

Getting started
===============

To execute the SDX core components using this repo, please follow the commands below.

1. Clone this repo and other related repositories (SDX-Controller, SDX-LC, Kytos SDX Napp), then build the correspondent Docker image:
```
git clone https://github.com/atlanticwave-sdx/sdx-continuous-development
cd sdx-continuous-development/data-plane
for repo in sdx-lc sdx-controller kytos-sdx; do git -C $repo pull || git clone https://github.com/atlanticwave-sdx/$repo; cd $repo/; docker build -t $repo .; cd ..; done
```

2. Next step will be to use the `template.env` file to be our actual `.env` file:
```
cp template.env .env
```

3. Now we can bring the environment UP, by running:
```
docker compose up -d
```

At this point all the components are booting up, which should take a few seconds. You can keep track of what is going on by running: `docker compose logs -t -f`

4. Wait a couple of secunds to make the OXPs boot up. You can use the following steps to make sure they are all UP. The steps below basically queries for the OXPs to make sure all the expected switches are connected:
```
EXP_SW=3; while true; do N_SW=$(curl -s http://0.0.0.0:8181/api/kytos/topology/v3/switches | jq -r '.switches[].id' | wc -l); echo "waiting switches $N_SW / $EXP_SW"; if [ $N_SW -eq $EXP_SW ]; then break; fi; sleep 1; done
EXP_SW=2; while true; do N_SW=$(curl -s http://0.0.0.0:8282/api/kytos/topology/v3/switches | jq -r '.switches[].id' | wc -l); echo "waiting switches $N_SW / $EXP_SW"; if [ $N_SW -eq $EXP_SW ]; then break; fi; sleep 1; done
EXP_SW=3; while true; do N_SW=$(curl -s http://0.0.0.0:8383/api/kytos/topology/v3/switches | jq -r '.switches[].id' | wc -l); echo "waiting switches $N_SW / $EXP_SW"; if [ $N_SW -eq $EXP_SW ]; then break; fi; sleep 1; done
```

5. Configure OXPs. Kytos requires some initial configs like approving switches and links that were just discovered. Run the following script to make the initial configs on all three OXPs:
```
./scripts/curl/2.enable_all.sh
```

6. At this point the SDX-LC will pull the topology from OXPO (Kytos-ng) periodically. You can force the OXPO to push the topology to SDX-LC by running the following command:
```
for oxp in 8181 8282 8383; do echo $oxp; curl -s -X POST http://127.0.0.1:$oxp/api/kytos/sdx/topology/2.0.0; done
```

7. To test if everything is working fine, you can start by checking if the topology is correctly identified by SDX-Controller:
```
curl -s http://0.0.0.0:8080/SDX-Controller/1.0.0/topology | jq -r '.nodes[] | (.ports[] | .id)'
curl -s http://0.0.0.0:8080/SDX-Controller/1.0.0/topology | jq -r '.links[] | .id + " " + .ports[0].id + " " + .ports[1].id'
```

8. Try to create a connection creation request to SDX-Controller which should span requests to all other OXPs
```
curl -s -X POST -H 'Content-type: application/json' http://0.0.0.0:8080/SDX-Controller/1.0.0/connection -d '{"name": "VLAN between AMPATH/300 and TENET/300", "endpoints": [{"port_id": "urn:sdx:port:ampath.net:Ampath3:50", "vlan": "300"}, {"port_id": "urn:sdx:port:tenet.ac.za:Tenet03:50", "vlan": "300"}]}'
```

9. Check if the connection was created on each OXP:
```
for oxp in 8181 8282 8383; do echo $oxp; curl -s http://127.0.0.1:$oxp/api/kytos/mef_eline/v2/evc | jq -r '.[] | .id + " " + .name + " " + (.enabled|tostring) + " " + (.active|tostring) + " " + (.uni_a|tostring) +  " " + (.uni_z|tostring)'; done
```

More information
================

Please refer to the following documentation for more information:

- https://github.com/atlanticwave-sdx/sdx-controller/blob/main/README.md
- https://github.com/atlanticwave-sdx/sdx-lc/blob/main/README.md
- https://github.com/atlanticwave-sdx/kytos-sdx/blob/main/README.rst
- https://sdx-docs.readthedocs.io/en/latest/sdx_deploy_single_server.html
- https://sdx-docs.readthedocs.io/en/latest/sdx_deploy_multi_server.html
