version: '3.8'

services:
  amlight:
    container_name: amlight
    image: amlight
    restart: always
    network:
      kytos_network:
        ipv4_address: 192.168.0.2
    ports:
      - 6653:6653
      - 8181:8181
  sax:
    container_name: sax
    image: sax
    restart: always
    network:
      kytos_network:
        ipv4_address: 192.168.0.3
    ports:
      - 6654:6654
      - 8282:8181
  tenet:
    container_name: tenet
    image: tenet
    restart: always
    network:
      kytos_network:
        ipv4_address: 192.168.0.4
    ports:
      - 6655:6655
      - 8383:8181
  mininet:
    container_name: mininet
    image: mininet
    privileged: true
    network_mode: "host"
    volumes:
      - /lib/modules:/lib/modules
    depends_on:
      - amlight
      - sax
      - tenet

