# demo-istio-project

This is a project you can use as a playground to preview Istio ⛵️

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [demo-istio-project](#demo-istio-project)
	- [Networking](#networking)
		- [Privately expose your applications](#privately-expose-your-applications)
		- [Publicly expose your applications](#publicly-expose-your-applications)
	- [Modules](#modules)
		- [Base modules](#base-modules)
		- [modules/istio](#modulesistio)
		- [modules/bookinfo](#modulesbookinfo)
		- [modules/forms-app](#modulesforms-app)

<!-- /TOC -->

## Networking

### Privately expose your applications

By default, this project ships with minimally configured networking for simplicity and ease of setup, though our services will be available only privately from within the cluster or via `kubectl proxy`.

For this project, you can enable the proxy on `localhost:8001` by typing in your shell:

```sh
docker-compose up
```

Use can then access the applications using the "Private address" links below.

### Publicly expose your applications

[Read this tutorial](https://docs.exekube.com/in-practice/production-networking) to learn how to expose your application on the public Internet, including:

- Setting a permanent external IP address
- Creating DNS records
- Enabling a cluster ingress controller
- Adding HTTPS via Let's Encrypt TLS certificates

## Modules

### Base modules

This project uses the Exekube [base-project](https://github.com/exekube/base-project) as boilerplate.

Modules from base-project:

- gke-network
- gke-cluster
- administration-tasks

### modules/istio

The `master` branch uses Istio 0.7.1 (the latest release on GitHub).

You can also follow [`istio-preliminary`](https://github.com/exekube/demo-istio-project/tree/istio-preliminary) branch to try Istio 0.8.0 which is still under development. Once 0.8.0 is released, it will be merged into master.

### modules/bookinfo

Bookinfo app, a sample app for Istio

- Private address: <http://localhost:8001/api/v1/namespaces/default/services/productpage:9080/proxy/productpage>
- Public address: [read instructions above](#publicly-expose-your-applications)

### modules/forms-app

A custom React app to test out Istio ingress and auto-injection

- Private address: <http://localhost:8001/api/v1/namespaces/default/services/forms-app-nginx-react:80/proxy>
- Public address: [read instructions above](#publicly-expose-your-applications)
