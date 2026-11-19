# 🐳 Docker: Containerization Fundamentals & Multi-Stage Builds

Welcome to the **Docker** section. Docker packages an application and all its dependencies into an immutable, portable container image that runs reliably across any environment.

---

## 🗺️ Directory Structure

```
docker/
├── 01-dockerfiles/
│   ├── Dockerfile.node        # Multi-stage Node.js build with caching and non-root user
│   ├── Dockerfile.golang      # Ultra-minimal scratch-based Go binary container
│   ├── Dockerfile.python      # Hardened multi-stage Python virtualenv image
│   └── .dockerignore          # Exclusion rules preventing bloated builds
└── 02-compose/
    ├── docker-compose.yml     # Multi-tier stack: Nginx proxy, Web app, Postgres, Redis
    └── .env.example           # Environment variable template
```

---

## 🧠 Why Multi-Stage Builds Matter

A standard single-stage Dockerfile bundles compilers, build SDKs, package managers, and development tools directly into the final image, causing:
1. **Bloated image size** (often 1GB+ vs 50MB)
2. **Larger attack surface** (unnecessary system packages vulnerable to CVEs)
3. **Slow deployment transfers** across networks

**Multi-Stage builds** solve this by using separate temporary stages for compiling source code and copying *only* the compiled binary or runtime artifacts into a slim, hardened final image.

---

## 🛠️ Essential Docker CLI Commands

```bash
# Build an image with a specific tag
docker build -t my-app:1.0.0 -f 01-dockerfiles/Dockerfile.node .

# Run a container with port mapping and environment variables
docker run -d --name my-running-app -p 8080:3000 -e APP_ENV=dev my-app:1.0.0

# View container logs
docker logs -f my-running-app

# Inspect running containers
docker ps

# Open interactive shell in running container
docker exec -it my-running-app /bin/sh

# Clean up dangling images, unused containers, and volumes
docker system prune -a --volumes
```

### Docker Compose Commands
```bash
# Start all services in the background
docker compose -f 02-compose/docker-compose.yml up -d

# Check status of composed services
docker compose -f 02-compose/docker-compose.yml ps

# View unified streaming logs
docker compose -f 02-compose/docker-compose.yml logs -f

# Tear down all containers, networks, and volumes
docker compose -f 02-compose/docker-compose.yml down -v
```

---

## 📑 File Links

- [Dockerfile.node](01-dockerfiles/Dockerfile.node)
- [Dockerfile.golang](01-dockerfiles/Dockerfile.golang)
- [Dockerfile.python](01-dockerfiles/Dockerfile.python)
- [.dockerignore](01-dockerfiles/.dockerignore)
- [docker-compose.yml](02-compose/docker-compose.yml)
- [.env.example](02-compose/.env.example)

---

## 🔗 Official Documentation
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Dockerfile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
