#!/bin/bash

echo ""
echo "#############################################################"
echo "# Creating bookinfo deployment with istio sidecar injection #"
echo "#############################################################"
echo ""

kubectl create namespace bookinfo
kubectl label namespace bookinfo istio-injection=enabled --overwrite=true

kubectl apply -n bookinfo -f bookinfo/platform/kube/bookinfo-SRE-optimized.yaml

echo ""
echo "#############################################################"
echo "# Creating Istio Gateway for bookinfo #"
echo "#############################################################"
echo ""

kubectl apply -n bookinfo -f bookinfo/networking/bookinfo-gateway.yaml
