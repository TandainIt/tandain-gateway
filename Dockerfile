# We use multi-stage builds, those are: base, development, local.
# The base stage has commonalities in both development and local.

FROM node:16-alpine as base

# Create app directory
WORKDIR /usr/app

# Install app dependencies
COPY package.json ./
COPY yarn.lock ./
RUN yarn install

# Set ownership and permissions
# USER node

EXPOSE 4000

## DEVELOPMENT

FROM base as development

# Bundle app source
COPY . .
CMD ["yarn", "run", "dev"]

## LOCAL

FROM base as local

RUN apk --no-cache add curl
RUN apk add --no-cache bash

# Bundle app source
COPY . .
CMD ["yarn", "run", "dev"]

