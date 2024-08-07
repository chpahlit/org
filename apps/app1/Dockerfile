# Stage 1: Build the Angular app
FROM node:20-alpine AS builder

WORKDIR /app


# Install dependencies
COPY package*.json ./
RUN npm install

COPY . .

# Build the Angular application
RUN npx nx build app1 --prod

# Stage 2: Serve the application with a Node server (or use an alternative as needed)
FROM nginx:alpine

# Copy build artifacts from the previous stage
COPY --from=builder /app/dist/app1 /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]