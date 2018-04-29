# demo-istio-project

This is a project you can use as a playground to preview Istio ⛵️

# Modules

## Base modules

This project uses the Exekube [base-project](https://github.com/exekube/base-project) as its boilerplate.

## istio / istio-nightly

:warning: Install only one of:
- `istio`: "stable" (0.7.1) version of Istio (latest release on GitHub) or
- `istio-nightly`: nightly version (a recent version of master branch on github.com/istio/istio)

Configure which module to use: https://github.com/exekube/demo-istio-project/blob/85fd322c9f1f5f1c43b4bd3c49853ab1fb7def5d/live/dev/k8s/istio-system/istio/terraform.tfvars#L5

## istio-bookinfo

Bookinfo app, a sample app for Istio

- Local address (through `kubectl proxy`): <http://localhost:8001/api/v1/namespaces/default/services/productpage:9080/proxy/productpage>
- External address: `https://<ISTIO-INGRESS-IP>/productpage`

## forms-app

A custom React app to test out Istio ingress and auto-injection

Local address: N/A (fails due to http->https redirect)

External address: (disabled by default)
