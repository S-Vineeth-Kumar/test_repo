# Use the official Node.js image as the base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app
RUN npm run build

# Install a simple server to serve the built React app
RUN npm install -g serve

# Expose the port the app runs on
EXPOSE 4000

# Command to run the application
CMD ["serve", "-s", "build", "-l", "4000"]
