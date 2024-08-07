# Stage 1: Build the application
FROM node:20-alpine AS builder

WORKDIR /org

COPY package*.json ./
RUN npm install
COPY . .

# Build the Angular Universal application (SSR)
RUN npm run build:ssr

# Debugging command to list all files and directories under /org
# RUN echo "Listing all files under /org:" && ls -R /org

# Add this step to debug the output directory
# RUN echo "Listing contents of /org/dist/apps/app1:" && ls -R /org/dist/apps/app1 || echo "Directory /org/dist/apps/app1 does not exist"

# Stage 2: Serve the app with Node.js
FROM node:20-alpine

WORKDIR /org

# Copy the built files from the builder stage
COPY --from=builder /org/dist/apps/app1 /org/dist/apps/app1

# Install production dependencies (if any)
RUN npm install --production

# Expose the port that the server will run on
EXPOSE 4000

# Command to start the Node.js server
CMD ["node", "dist/apps/app1/server/main.js"]