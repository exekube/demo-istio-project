# demo-istio-project

A playground for Istio ⛵️

> :warning:
>
> This is a work in progress
>
> :warning:

If you are new to Exekube, follow the *Getting Started Tutorial* tutorial at https://exekube.github.io/exekube/in-practice/getting-started

## Project structure

### Project modules

```sh
modules/
├── bookinfo      # Istio Bookinfo sample application
├── cert-manager  # cert-manager for TLS certificates
├── cluster       # GKE cluster
├── cluster-admin # Common cluster administration tasks
├── istio         # Istio latest stable release (0.7.1)
└── istio-nightly # Istio nightly release (unstable)
```

Project-scoped Terraform modules can be found in the `modules` directory. These modules contain configuration that *is common* to all environments (dev, stg, prod) of the demo-istio-project.

All project modules can either be built from ground up (only containing Terraform `resource`s) or by using *global modules* such as those included with [Exekube](/) or those found in the [Module Registry](/).

### Project environments

```sh
live/
├── dev
├── stg
├── prod
├── ...
└── terraform.tfvars # Terraform remote state config et al.
```

In the `live` directory, we have a directory structure with *live modules* in leaf directires, each configured via a `terraform.tfvars` file. Each of the live modules uses Terragrunt to import a project-scoped (sometimes directly global-scoped) module and configure it for the specific environment.

Live modules are similar in scope to Terraform Enterprise [workspaces](/), namely because each will have some unique input variables and a unique Terraform state file (`default.tfstate`).
