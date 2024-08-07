# Stage 1: Build the application
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

RUN npm run build -- --prod

# Stage 2: Serve the app
FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app/dist/apps/app1 /app/dist/apps/app1
COPY --from=builder /app/apps/app1/server.ts /app/server.ts

RUN npm install --only=production

CMD ["node", "server.ts"]
