#!/bin/bash

echo "### Starting services via docker compose ###"
docker compose up -d

maxWait=180
echo "### Waiting until services are ready (max wait $maxWait seconds)..."
while [ $maxWait -gt 0 ]; do
	if [ $(docker logs amlight 2>/dev/null | grep "HANDSHAKE COMPLETE" | wc -l) -ge 3 ] && [ $(docker logs tenet 2>/dev/null | grep "HANDSHAKE COMPLETE" | wc -l) -ge 3 ] && [ $(docker logs sax 2>/dev/null | grep "HANDSHAKE COMPLETE" | wc -l) -ge 2 ]; then
		break
	fi
	let maxWait--
	sleep 1
	if [ $(($maxWait % 10)) -eq 0 ]; then
		echo "-->" $(date +%F,%X) still waiting...
	fi
done

if [ $maxWait -eq 0 ]; then
	echo ""
	echo "==> ERROR: Timeout waiting for containers to boot and switches connect. Please check manually"
	exit 1
fi

echo "### enable all switches, interfaces, links ###"
./curl/enable_all.sh

echo "### create circuits ###"
echo "---> no vlan translation"
./curl/create_evcs_inter_domain.sh
echo "---> with vlan translation"
./curl/create_evcs_inter_domain_vlan_translation.sh

echo "### setup hosts and run data-plate test (ping) ###"
./curl/config_hosts_and_test.sh
