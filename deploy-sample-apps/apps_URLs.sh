#!/bin/bash
# Get the Istio Ingress IP Address using kubectl and the jq tool.

INGRESSES=`kubectl get service istio-ingressgateway -n istio-system -o json | jq '.status.loadBalancer.ingress' -r`

HOST=$( echo $INGRESSES | jq '.[0].host' -r)
IP=$( echo $INGRESSES | jq '.[0].ip' -r)

if [ $HOST != "null" ]; then
    INGRESS=$HOST
elif [ $IP != "null" ]; then
    INGRESS=$IP
else
    printf "\nUnable to determine ingress address. Exiting.\n"
    exit 1
fi

echo "ACME Fitness: http://${INGRESS}/"
echo "Bookinfo: http://${INGRESS}/productpage"
