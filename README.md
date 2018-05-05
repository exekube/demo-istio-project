# demo-istio-project

This is a project you can use as a playground to preview Istio ⛵️

## Modules

### Base modules

This project uses the Exekube [base-project](https://github.com/exekube/base-project) as its boilerplate:

### modules/istio

The `master` branch uses Istio 0.7.1 (the latest release on GitHub).

You can also follow [`istio-prelim`](https://github.com/exekube/demo-istio-project/tree/istio-prelim) branch to try Istio 0.8.0 which is still under development. Once 0.8.0 is released, it will be merged into master.

### modules/bookinfo

Bookinfo app, a sample app for Istio

- Local address (through `kubectl proxy`): <http://localhost:8001/api/v1/namespaces/default/services/productpage:9080/proxy/productpage>
- External address: n/a

### modules/forms-app

A custom React app to test out Istio ingress and auto-injection

- Local address: <http://localhost:8001/api/v1/namespaces/default/services/forms-app-nginx-react:80/proxy>
- External address: n/a

## ⚠️ Production networking

By default, this project ships with minimally configured networking for simplicity and ease of setup, though our services will be available only privately (from within the cluster).

In order to get our applications production-ready (available to end users), we will need to:

1. Create a static (unchanging) IP address for `istio-ingress`
2. Create DNS records to point clients to this address
3. Use [cert-manager](https://github.com/jetstack/cert-manager) to enable TLS for the domains

Follow the tutorial in this article: <https://docs.exekube.com/in-practice/production-networking>
