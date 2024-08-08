# Stage 1: Build the Angular application
FROM node:20.16.0 as build

WORKDIR /org

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci --legacy-peer-deps

# Copy the rest of the application code
COPY . .

# Build the Angular application
RUN npx nx build app2 --prod

# Debugging command to list all files and directories under /org
RUN echo "Listing all files under /org:" && ls -R /org

# Add this step to debug the output directory
RUN echo "Listing contents of /org/dist/apps/app2:" && ls -R /org/dist/apps/app2 || echo "Directory /org/dist/apps/app2 does not exist"


# Stage 2: Serve the application with Nginx
FROM nginx:1.21-alpine

# Copy the built application from the previous stage
COPY --from=build /org/dist/apps/app2 /usr/share/nginx/html

# Copy Nginx configuration file
COPY apps/app2/nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
