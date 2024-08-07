# Stage 1: Build the application
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

RUN npm run build -- --prod

# Stage 2: Serve the app
FROM node:20-alpine

WORKDIR /org

COPY --from=builder /org/dist/apps/app1 /org/dist/apps/app1
COPY --from=builder /org/apps/app1/server.ts /org/apps/app1/server.ts

RUN npm install --only=production

CMD ["node", "server.ts"]
