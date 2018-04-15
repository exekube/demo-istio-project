# ↓ Module metadata

terragrunt = {
  terraform {
    source = "/project/modules//istio"
  }

  dependencies {
    paths = [
      "../../kube-system/cluster-admin",
      "../../kube-system/_helm",
    ]
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Module configuration (empty means all default)

load_balancer_ip = "35.187.107.8"
