FROM node:14-buster-slim

RUN apt-get update -qq && apt-get install -qq -y --no-install-recommends imagemagick && \
    rm -rf /var/lib/apt/lists/*

ENV NODE_ENV=production

USER 1000
RUN mkdir /home/node/app && chown node:node -R /home/node/app
WORKDIR /home/node/app

COPY --chown=node:node package*.json ./

RUN npm ci

COPY --chown=node:node . .
