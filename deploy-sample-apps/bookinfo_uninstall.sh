#!/bin/bash

echo ""
echo "#############################################################"
echo "# Removing Bookinfo Application #"
echo "#############################################################"
echo ""

echo bookinfo | bookinfo/platform/kube/cleanup.sh
