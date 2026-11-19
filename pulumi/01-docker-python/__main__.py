"""Pulumi program: pull the nginx image and run it as a container.

Same idea as a Terraform `docker_container` resource, but written in plain Python.
"""
import pulumi
import pulumi_docker as docker

# Read optional settings: `pulumi config set port 9090`
config = pulumi.Config()
port = config.get_int("port") or 8082

# Resources are declared as objects. Pulumi works out the order from how they reference each other.
image = docker.RemoteImage("nginx-image", name="nginx:1.25-alpine")

container = docker.Container(
    "web",
    image=image.image_id,  # using image.image_id makes Pulumi create the image first
    ports=[docker.ContainerPortArgs(internal=80, external=port)],
)

# Outputs are printed after `pulumi up`
pulumi.export("url", f"http://localhost:{port}")
pulumi.export("container_name", container.name)
