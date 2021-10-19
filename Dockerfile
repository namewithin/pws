FROM ubuntu:20.04

LABEL maintainer="Renoki Co. <alex@renoki.org>"

ENV PYTHONUNBUFFERED=1

COPY . /app

RUN apt-get update -y
RUN apt-get install  -y git python3
RUN cd /app
RUN apt-get install curl -y
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN cd /app
RUN npm install
RUN npm run build

EXPOSE 6001

WORKDIR /app

ENTRYPOINT ["node", "/app/bin/server.js", "start"]
