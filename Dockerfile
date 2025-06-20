FROM node:22  
WORKDIR /app
COPY package*.json ./
RUN npm install 
COPY . .
EXPOSE 3000
CMD ["npm", "start"]


# Optimized Dockerfile for Node.js application using alpine image. Done

FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install 
COPY . .
EXPOSE 3000
CMD ["npm", "start"]

# multi-stage build Dockerfile for Node.js Application.

FROM node:22-alpine AS builder
WORKDIR /app    
COPY package*.json ./
RUN npm install
COPY . .

FROM node:22-alpine
WORKDIR /app
COPY --from=builder /app ./
EXPOSE 3000
CMD ["node", "index.js"]

# using slim image for Node.js application.
FROM node:22-slim AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install 
COPY . .

FROM node:22-slim
WORKDIR /app
COPY --from=builder /app ./
EXPOSE 3000
CMD ["node", "index.js"]


# Dockerfile with environment variable for node.js application. 
FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

FROM node:22-alpine
WORKDIR /app
ENV NODE_ENV="production"
COPY --from=builder /app ./
EXPOSE 3000
CMD ["node", "index.js"]

# Dockerfile with build arguments for node.js application.

FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

FROM node:22-alpine
WORKDIR /app
ARG NODE_ENV
ENV NODE_ENV=${NODE_ENV}
COPY --from=builder /app ./
EXPOSE 3000
CMD ["node", "index.js"]

# command to build the Docker image with build arguments
# docker build --build-arg NODE_ENV=production -t my-node-app .
