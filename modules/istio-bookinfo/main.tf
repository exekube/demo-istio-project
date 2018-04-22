provider "helm" {}

terraform {
  backend "gcs" {}
}

variable "secrets_dir" {}

module "bookinfo" {
  source = "/exekube-modules/helm-template-release"

  release_name      = "bookinfo"
  release_namespace = "default"
  istio_inject      = true

  chart_name = "bookinfo/"
}
