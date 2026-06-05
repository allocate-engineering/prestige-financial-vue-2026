FROM node:20-alpine as build
WORKDIR /app

EXPOSE 3000

ARG DEBIAN_FRONTEND=noninteractive

# Dependencies
#RUN apt-get -qq update && apt-get -qq install -y wget

# Package installation
COPY package.json package-lock.json .

RUN npm ci

COPY . .

ENTRYPOINT ["./start.sh"]
