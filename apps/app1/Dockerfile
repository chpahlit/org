# Stage 1: Build the Angular application and server
FROM node:20-alpine AS builder

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source files
COPY . .

# Build the Angular application and server
RUN npm run build -- --prod
RUN npm run build:ssr

# Stage 2: Serve the Angular application with Node.js
FROM node:20-alpine

WORKDIR /app

# Copy the build artifacts from the builder stage
COPY --from=builder /app/dist/apps/app1 /app/dist/apps/app1
COPY --from=builder /app/dist/server /app/dist/server
COPY package*.json ./
RUN npm install --only=production

# Copy server entry point
COPY ./server.ts /app

# Run the server
EXPOSE 4000
CMD ["node", "dist/server"]
