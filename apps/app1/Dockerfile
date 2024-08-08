# Stage 1: Build the application
FROM node:20-alpine AS builder

WORKDIR /org

COPY package*.json ./
RUN npm install
COPY . .

RUN npx nx build app1 --prod

# Debugging command to list all files and directories under /org
# RUN echo "Listing all files under /org:" && ls -R /org

# Add this step to debug the output directory
# RUN echo "Listing contents of /org/dist/apps/app1:" && ls -R /org/dist/apps/app1 || echo "Directory /org/dist/apps/app1 does not exist"

# Stage 2: Serve the app
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Correct path for COPY command
COPY --from=builder /org/dist/apps/app1 /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
