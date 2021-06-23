# Use the full Node image to perform package install
FROM node:12-alpine AS builder
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# Copy files required for package install
COPY package.json  .
RUN yarn install

# Copy the remaining assets and build the application
COPY . /usr/src/app
RUN yarn start
