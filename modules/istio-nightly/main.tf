terraform {
  backend "gcs" {}
}

variable "secrets_dir" {}
variable "load_balancer_ip" {}

module "istio_nightly" {
  source           = "/exekube-modules/helm-release"
  tiller_namespace = "kube-system"
  client_auth      = "${var.secrets_dir}/kube-system/helm-tls"

  release_name  = "istio"
  chart_repo    = "exekube"
  chart_name    = "istio"
  chart_version = "0.8.0"

  load_balancer_ip = "${var.load_balancer_ip}"
}
