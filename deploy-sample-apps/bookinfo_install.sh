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
echo "#######################################"
echo "# Creating Istio Gateway for bookinfo #"
echo "#######################################"
echo ""

kubectl apply -n bookinfo -f bookinfo/networking/bookinfo-gateway.yaml

echo ""
echo "###########################################"
echo "# Creating traffic generator for bookinfo #"
echo "###########################################"
echo ""

LOADGEN_NAMESPACE_STATUS_PHASE=`kubectl -o json get namespace loadgen | jq  .status.phase -r`
if [ "$LOADGEN_NAMESPACE_STATUS_PHASE" != "Active" ]; then
    kubectl create namespace loadgen
fi

kubectl apply -n loadgen -f bookinfo/loadgen/product-page-probe.yaml
