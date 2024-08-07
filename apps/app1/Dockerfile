# Stage 1: Build the application
FROM node:20-alpine AS builder

WORKDIR /org

COPY package*.json ./
RUN npm install
COPY . .

RUN npx nx build app1 --prod

# Debugging command to list all files and directories
RUN echo "Listing all files:" && find /app
# Add this step to debug the output directory
RUN echo "Listing contents of /app/dist/apps/app1:" && ls -R /app/dist/apps/app1 || echo "Directory /app/dist/apps/app1 does not exist"

# Stage 2: Serve the app
FROM nginx:alpine

WORKDIR /org

COPY --from=builder /app/dist/apps/app1/browser /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
