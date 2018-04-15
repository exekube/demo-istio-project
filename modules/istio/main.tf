terraform {
  backend "gcs" {}
}

provider "local" {}

variable "load_balancer_ip" {}

resource "null_resource" "istio" {
  provisioner "local-exec" {
    command = "kubectl apply -f ${local_file.istio.filename}"
  }

  provisioner "local-exec" {
    when       = "destroy"
    on_failure = "continue"
    command    = "kubectl delete -f ${local_file.istio.filename}"
  }
}

data "template_file" "istio" {
  template = "${file("${format("%s/%s", path.module, "istio.yaml")}")}"

  vars {
    load_balancer_ip = "${var.load_balancer_ip}"
  }
}

resource "local_file" "istio" {
  filename = "${path.module}/istio-rendered.yaml"
  content  = "${data.template_file.istio.rendered}"
}
