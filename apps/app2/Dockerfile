# Stage 1: Build the Angular application
FROM node:20.16.0 as build

WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci --legacy-peer-deps

# Copy the rest of the application code
COPY . .

# Build the Angular application
RUN npm run build --prod

# Stage 2: Serve the application with Nginx
FROM nginx:1.21-alpine

# Copy the built application from the previous stage
COPY --from=build /usr/src/app/dist/app2 /usr/share/nginx/html

# Copy Nginx configuration file
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
