#!/bin/bash
ASDs=`kubectl get asd -o name -n bookinfo`

# Apply ASDs for app with autoscaler off.
printf "Patching all ASDs in Bookinfo. Setting spec.scaleRule.enabled: false\n"
for asd in $ASDs; do
    kubectl patch -n bookinfo $asd --type=merge --patch '{"spec":{"scaleRule":{"enabled":false}}}'
done
