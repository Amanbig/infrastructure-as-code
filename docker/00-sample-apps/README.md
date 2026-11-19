# Sample Apps

Three tiny "hello world" web apps so the Dockerfiles in `../01-dockerfiles/` actually build.
Each Dockerfile expects its app folder as the **build context**.

```bash
# from the repo root
docker build -t sample-node   -f docker/01-dockerfiles/Dockerfile.node   docker/00-sample-apps/node
docker build -t sample-go     -f docker/01-dockerfiles/Dockerfile.golang docker/00-sample-apps/go
docker build -t sample-python -f docker/01-dockerfiles/Dockerfile.python docker/00-sample-apps/python

docker run --rm -p 3000:3000 sample-node     # curl localhost:3000
docker run --rm -p 8080:8080 sample-go       # curl localhost:8080
docker run --rm -p 8000:8000 sample-python   # curl localhost:8000
```

Compare image sizes with `docker images` — the Go `scratch` image is just a few MB.
