# Stage 1: Build the Angular app
FROM node:20-alpine AS builder

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build -- --prod

# Stage 2: Run the app with a Node server
FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app/dist/apps/app1 /app/browser
COPY --from=builder /app/dist/apps/app1-server /app

RUN npm install

CMD ["node", "server.js"]
