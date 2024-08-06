# Use a base image with Node.js and Angular CLI
FROM node:20.16.0

# Set a build-time argument for the app name
ARG APP_NAME

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the application code
COPY . .

# Build the specific app
RUN npm run build -- --project=$APP_NAME

# Expose the port (adjust to your app’s needs)
EXPOSE 4200

# Serve the app
CMD ["npx", "nx", "serve", "$APP_NAME"]