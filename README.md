# demo-istio-project

This is a project you can use as a playground to preview Istio ⛵️

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [demo-istio-project](#demo-istio-project)
	- [Networking](#networking)
		- [Private apps](#private-apps)
		- [Apps on the public Internet](#apps-on-the-public-internet)
	- [Modules](#modules)
		- [Base modules](#base-modules)
		- [modules/istio](#modulesistio)
		- [modules/bookinfo](#modulesbookinfo)
		- [modules/forms-app](#modulesforms-app)

<!-- /TOC -->

## Networking

### Private apps

By default, this project ships with minimally configured networking for simplicity and ease of setup, though our services will be available only privately via `kubectl proxy` (from within the cluster). For this project, you can enable the proxy by typing in your shell

```sh
docker-compose up
```

Use can then access the applications using the "Private address" links below.

### Apps on the public Internet

If we want to expose our services (applications) on the public Internet, we will need to:

1. Create an [external static IP address](/) for `istio-ingress` service.
2. Enable `istio-ingress` (Kubernetes LoadBalancer type of service)
3. Create DNS records to point clients to this address
4. Use [cert-manager](https://github.com/jetstack/cert-manager) to enable TLS for the domains
5. Enable `Ingress` resources for our Helm releases.

Use [this pull request](/) as an example of how to set up production networking.

There is also a step-by-step tutorial: <https://docs.exekube.com/in-practice/production-networking>


## Modules

### Base modules

This project uses the Exekube [base-project](https://github.com/exekube/base-project) as boilerplate.

Modules from base-project:

- gke-network
- gke-cluster
- administration-tasks

### modules/istio

The `master` branch uses Istio 0.7.1 (the latest release on GitHub).

You can also follow [`istio-prelim`](https://github.com/exekube/demo-istio-project/tree/istio-prelim) branch to try Istio 0.8.0 which is still under development. Once 0.8.0 is released, it will be merged into master.

### modules/bookinfo

Bookinfo app, a sample app for Istio

- Private address: <http://localhost:8001/api/v1/namespaces/default/services/productpage:9080/proxy/productpage>
- Public address: [read instructions above](#apps-on-the-public-internet)

### modules/forms-app

A custom React app to test out Istio ingress and auto-injection

- Private address: <http://localhost:8001/api/v1/namespaces/default/services/forms-app-nginx-react:80/proxy>
- Public address: [read instructions above](#apps-on-the-public-internet)
