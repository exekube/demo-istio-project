# ↓ Module metadata

terragrunt = {
  terraform {
    source = "/project/modules//istio"
  }

  dependencies {
    paths = [
      "../../kube-system/administration-tasks",
    ]
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Module configuration (empty means all default)

load_balancer_ip = "35.205.26.156"

# load_balancer_ip = "130.211.160.207"

