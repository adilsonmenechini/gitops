.PHONY: install cluster delcluster

#https://github.com/rancher/k3d#get
k3d:
	wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

cluster:
	@k3d cluster create k8s \
	--servers 1 --agents 2 \
	--api-port 127.0.0.1:6443 -p 80:80@loadbalancer -p 443:443@loadbalancer \
	--k3s-arg "--disable=traefik@server:0" \
	--no-lb --memory 3G \
	--kubeconfig-switch-context

delcluster:
	@k3d cluster delete k8s