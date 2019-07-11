FROM ubuntu:18.04

RUN apt-get update && apt-get install -y python3 nodejs

WORKDIR /app
ADD fuse.py .
ADD memory.py .
ADD package.json .
ADD package-lock.json .
