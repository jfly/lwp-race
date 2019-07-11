FROM ubuntu:18.04

RUN apt-get update && apt-get install -y python3 nodejs npm fuse

WORKDIR /app

ADD package.json .
ADD package-lock.json .
RUN npm install

ADD webpack.config.js .
ADD fuse.py .
ADD memory.py .
ADD fuse-and-build.sh .

CMD ["./fuse-and-build.sh"]
