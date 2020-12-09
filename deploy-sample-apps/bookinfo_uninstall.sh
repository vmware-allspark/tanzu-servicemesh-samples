#!/bin/bash

echo ""
echo "#################################"
echo "# Removing Bookinfo Application #"
echo "#################################"
echo ""

echo bookinfo | bookinfo/platform/kube/cleanup.sh

kubectl delete -n loadgen -f bookinfo/traffic-generator/product-page-probe.yaml
kubectl delete -n loadgen -f bookinfo/traffic-generator/bookinfo-locust-cyclical.yaml
