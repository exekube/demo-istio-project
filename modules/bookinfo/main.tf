terraform {
  backend "gcs" {}
}

variable "secrets_dir" {}

module "bookinfo" {
  source           = "/exekube-modules/helm-release"
  tiller_namespace = "kube-system"
  client_auth      = "${var.secrets_dir}/kube-system/helm-tls"

  release_name      = "bookinfo"
  release_namespace = "default"
  chart_name        = "bookinfo/"
}
