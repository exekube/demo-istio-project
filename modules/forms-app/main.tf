terraform {
  backend "gcs" {}
}

# variable "domain_name" {}
# variable "secrets_dir" {}
# 
#
# module "forms_app" {
#   source           = "/exekube-modules/helm-release"
#   tiller_namespace = "kube-system"
#   client_auth      = "${var.secrets_dir}/kube-system/helm-tls"
#
#   release_name      = "forms-app"
#   release_namespace = "default"
#   chart_repo        = "exekube"
#   chart_name        = "nginx-react"
#   chart_version     = "0.2.0"
#   domain_name       = "${var.domain_name}"
# }

