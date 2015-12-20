#!/bin/bash

if [[ -f $HOME/.profile ]]; then
	source "$HOME/.profile"
fi

if ! mkdir /var/tmp/romana-demo-setup; then
	# This has probably been done already. We can skip it
	exit
fi

# Suppress output
exec > /dev/null

# Create tenants and segments
# TODO: Remove the id:0 bits once master branch has fixed its JSON handling
#  -- admin
curl -X POST -H 'Content-Type: application/json' --data "$(printf '{"id": 0, "name": "%s"}' $(openstack project show -f value -c id admin))" http://{{ devstack_controller }}:9602/tenants
curl -X POST -H "Content-Type: application/json" --data '{"id": 0, "name": "default"}' http://{{ devstack_controller }}:9602/tenants/1/segments
#  -- demo
curl -X POST -H "Content-Type: application/json" --data "$(printf '{"id": 0, "name": "%s"}' $(openstack project show -f value -c id demo))" http://{{ devstack_controller }}:9602/tenants
curl -X POST -H "Content-Type: application/json" --data '{"id": 0, "name": "default"}' http://{{ devstack_controller }}:9602/tenants/2/segments

# Create romana network and subnet
if ! neutron net-show romana 2>/dev/null; then
	neutron net-create --shared --provider:network_type local romana
fi
if ! neutron subnet-show romana-sub 2>/dev/null; then
	neutron subnet-create --ip-version 4 --name romana-sub romana 10.0.0.0/8
fi

# Create keypair
if ! nova keypair-show shared-key 2>/dev/null; then
	nova keypair-add --pub-key ~/.ssh/id_rsa.pub shared-key
fi

# Boot inst1 using romana's network
# - nova boot --flavor m1.micro --image cirros-0.3.4-x86_64-uec --key-name shared-key --nic net-id=$(neutron net-show romana -Fid -f value) inst1

