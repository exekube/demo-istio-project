terraform {
  backend "gcs" {}
}

variable "secrets_dir" {}

# cert-manager Helm release
module "cert_manager" {
  source           = "/exekube-modules/helm-release-v2"
  tiller_namespace = "kube-system"
  client_auth      = "${var.secrets_dir}/kube-system/_helm"

  release_name  = "cert-manager"
  chart_repo    = "stable"
  chart_name    = "cert-manager"
  chart_version = "0.2.8"
}

# cert-manager issuers
resource "null_resource" "issuers" {
  depends_on = ["module.istio_nightly"]

  provisioner "local-exec" {
    command = "kubectl apply -f ${path.module}/resources/issuers.yaml"
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "kubectl delete -f ${path.module}/resources/issuers.yaml"
  }
}

# cert-manager certificates
resource "null_resource" "certs" {
  depends_on = ["null_resource.issuers"]

  provisioner "local-exec" {
    command = "kubectl apply -f ${path.module}/resources/certs.yaml"
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "kubectl delete -f ${path.module}/resources/certs.yaml"
  }
}
