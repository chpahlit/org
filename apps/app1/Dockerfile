# Use a base image with Node.js and Angular CLI
FROM node:20.16.0

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY ../../package.json ../../package-lock.json ./
RUN npm install

# Copy the app1 code
COPY . .

# Build the app
RUN npm run build -- --project=app1

# Expose the port (adjust to your app’s needs)
EXPOSE 4200

# Serve the app
CMD ["npx", "nx", "serve", "app1"]