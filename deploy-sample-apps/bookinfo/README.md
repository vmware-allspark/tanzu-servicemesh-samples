# Bookinfo Sample

See <https://istio.io/docs/examples/bookinfo/>

## Installation
Installing the bookinfo application requries applying both Kubernetes and Istio manfiests into a namespace that has `istio-injection` enabled:

```bash
kubectl create namespace bookinfo
kubectl label namespace bookinfo istio-injection=enabled --overwrite=true

kubectl apply -n bookinfo -f platform/kube/bookinfo-SRE-optimized.yaml
kubectl apply -n bookinfo -f networking/bookinfo-gateway.yaml
```

## Traffic generation
Two traffic generators have been provided:
- A low rate (1 rps) traffic generator to show service graph within Tanzu Service Mesh
  ```bash
  kubectl apply -f traffic-generator/product-page-probe.yaml
  ```
- A cyclical traffic generator which can exercise the Tanzu Service Mesh SLO and Autoscaling functionality:
  ```bash
  kubectl apply -f traffic-generator/bookinfo-locust-cyclical.yaml
  ```


