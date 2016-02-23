#!/bin/bash

# Copyright (c) 2016 Pani Networks
# All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

if [[ -f $HOME/.profile ]]; then
	source "$HOME/.profile"
fi

# Suppress output
exec > /dev/null

# This script currently directly uses the REST API of the Romana Topology and Tenant services
# to configure the hosts/owners/tiers used in a simple setup.

# Create hosts
romana add-host ip-{{ stack_nodes.Controller.mgmt_ip | replace('.', '-') }} {{ stack_nodes.Controller.mgmt_ip }} {{ stack_nodes.Controller.gateway | ipaddr(0) }} 9604
{% for node in stack_nodes.ComputeNodes[:compute_nodes] %}
romana add-host ip-{{ stack_nodes[node].mgmt_ip | replace('.', '-') }} {{ stack_nodes[node].mgmt_ip }} {{ stack_nodes[node].gateway | ipaddr(0) }} 9604
{% endfor %}

# Create owners and tiers
romana create-owner t1
romana add-tier t1 default
romana add-tier t1 backend
romana add-tier t1 frontend
romana create-owner t2
romana add-tier t2 default

# Configure kubectl
kubectl config set-cluster romana-cni-cluster --server=http://192.168.99.10:8080
kubectl config set-context romana-cni-context --cluster=romana-cni-cluster
kubectl config use-context romana-cni-context
