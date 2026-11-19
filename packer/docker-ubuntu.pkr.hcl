# Beginner-friendly Packer template: builds a Docker image, so it is FREE and needs no cloud account.
packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

variable "greeting" {
  type    = string
  default = "Hello from Packer"
}

# A "source" says WHAT to start from and WHAT KIND of artifact to produce.
source "docker" "ubuntu" {
  image  = "ubuntu:22.04"
  commit = true
}

# A "build" runs provisioners on the source, then post-processors on the result.
build {
  name    = "learn-packer"
  sources = ["source.docker.ubuntu"]

  provisioner "shell" {
    inline = [
      "apt-get update",
      "apt-get install -y --no-install-recommends nginx",
      "echo '${var.greeting}' > /var/www/html/index.html",
    ]
  }

  post-processor "docker-tag" {
    repository = "packer-nginx"
    tags       = ["1.0"]
  }
}
