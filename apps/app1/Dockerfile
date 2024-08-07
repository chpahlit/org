# Stage 1: Build the application
FROM node:20-alpine AS builder

WORKDIR /org

COPY package*.json ./
RUN npm install
COPY . .

RUN npx nx build app1 --prod

# Stage 2: Serve the app
FROM nginx:alpine

WORKDIR /org

COPY --from=builder /app/dist/apps/app1/browser /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
