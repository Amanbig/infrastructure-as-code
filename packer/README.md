# 📦 HashiCorp Packer: Build Machine Images as Code

Packer builds **identical, pre-configured images** (Docker images, AWS AMIs, VM images) from one template.
Instead of booting a blank server and configuring it every time, you bake the image once and launch it many times
(immutable infrastructure). Typical flow: **Packer builds the image -> Terraform launches servers from it**.

## Files
- [docker-ubuntu.pkr.hcl](docker-ubuntu.pkr.hcl) - free, local: builds a Docker image with nginx.
- [aws-ubuntu.pkr.hcl](aws-ubuntu.pkr.hcl) - builds an AWS AMI (**costs money**).

## Hands-on (free)
```bash
# Install: https://developer.hashicorp.com/packer/install
cd packer
packer init docker-ubuntu.pkr.hcl
packer fmt .
packer validate docker-ubuntu.pkr.hcl
packer build docker-ubuntu.pkr.hcl
docker run --rm -p 8080:80 packer-nginx:1.0 nginx -g 'daemon off;'   # then: curl localhost:8080
docker rmi packer-nginx:1.0                                           # cleanup
```

## Key concepts
| Block | Purpose |
| :--- | :--- |
| `source` | Base image and builder type (docker, amazon-ebs, ...). |
| `build` | Ties sources to provisioners. |
| `provisioner` | Installs/configures software (shell, Ansible, file). |
| `post-processor` | Acts on the result (tag, push, compress). |

Packer pairs well with Ansible: use the `ansible` provisioner to configure the image with the playbooks in [`../ansible`](../ansible).
