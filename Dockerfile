FROM node:16.6.2-buster-slim

RUN apt-get update -qq \
        && apt-get upgrade -qq \
        && apt-get install -y --no-install-recommends \
              vim \
        && rm -rf /var/lib/apt/lists/* \
        && apt-get purge -y --auto-remove

RUN mkdir /myapp
WORKDIR /myapp

COPY package*.json /myapp
RUN npm install -g npm-check-updates depcheck gatsby-cli \
        && npm cache verify \
        && npm ci
