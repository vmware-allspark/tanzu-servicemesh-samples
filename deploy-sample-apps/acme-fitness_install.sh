#!/bin/bash

echo ""
echo "#################################################################"
echo "# Creating acme fitness deployment with istio sidecar injection #"
echo "#################################################################"
echo ""

kubectl create namespace acme
kubectl label namespace acme istio-injection=enabled --overwrite=true

kubectl apply -n acme -f acme-fitness/kubernetes-manifests/secrets.yaml
kubectl apply -n acme -f acme-fitness/kubernetes-manifests/acme-fitness.yaml
kubectl apply -n acme -f acme-fitness/traffic-generator/loadgen.yaml

echo ""
echo "#################################################################"
echo "# Creating Istio Gateway and Destination Rules for acme fitness #"
echo "#################################################################"
echo ""

kubectl apply -n acme -f acme-fitness/istio-manifests/gateway.yaml

INGRESS=`kubectl get service istio-ingressgateway -n istio-system -o json | jq .status.loadBalancer.ingress[0].ip -r`

echo ""
echo "################################################################"
echo "# Access acme fitness at:  http://${INGRESS}/"
echo "################################################################"
echo ""
