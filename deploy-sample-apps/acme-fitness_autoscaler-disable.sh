#!/bin/bash
ASDs=`kubectl get asd -o name -n acme`

# Apply ASDs for app with autoscaler off.
printf "Patching all ASDs in ACME Fitness. Setting spec.scaleRule.enabled: false\n"
for asd in $ASDs; do
    kubectl patch -n acme $asd --type=merge --patch '{"spec":{"scaleRule":{"enabled":false}}}'
done
