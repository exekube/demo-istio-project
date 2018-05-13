terraform {
  backend "gcs" {}
}

variable "load_balancer_ip" {}

module "istio" {
  source = "/exekube-modules/helm-template-release"

  release_name      = "istio"
  release_namespace = "istio-system"

  chart_name       = "istio/"
  load_balancer_ip = "${var.load_balancer_ip}"
}

resource "null_resource" "enable_injection" {
  depends_on = ["module.istio"]

  provisioner "local-exec" {
    command = <<EOF
./install/kubernetes/webhook-create-signed-cert.sh \
--service istio-sidecar-injector \
--namespace istio-system \
--secret sidecar-injector-certs
EOF
  }

  provisioner "local-exec" {
    command = "kubectl apply -f install/kubernetes/istio-sidecar-injector-configmap-release.yaml"
  }

  provisioner "local-exec" {
    command = <<EOF
cat install/kubernetes/istio-sidecar-injector.yaml | \
./install/kubernetes/webhook-patch-ca-bundle.sh > \
install/kubernetes/istio-sidecar-injector-with-ca-bundle.yaml
EOF
  }

  provisioner "local-exec" {
    command = "kubectl apply -f install/kubernetes/istio-sidecar-injector-with-ca-bundle.yaml"
  }

  # Enable injection for default namespace
  provisioner "local-exec" {
    command = "kubectl label namespace default istio-injection=enabled | true"
  }
}
