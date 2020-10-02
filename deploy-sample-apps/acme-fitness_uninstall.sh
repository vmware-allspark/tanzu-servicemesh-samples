#!/bin/bash

echo ""
echo "#################################################################"
echo "# Removing Acme Fitness Application #"
echo "#################################################################"
echo ""

kubectl delete -n acme -f acme-fitness/istio-manifests/gateway.yaml
kubectl delete -n acme -f acme-fitness/kubernetes-manifests/acme-fitness.yaml
kubectl delete namespace acme
