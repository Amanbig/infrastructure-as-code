"""Tiny FastAPI app used to practice Dockerfile.python."""
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def root():
    return {"message": "Hello from the Python sample app!"}


@app.get("/healthz")
def healthz():
    return {"status": "ok"}
