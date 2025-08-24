# Use official Node.js image as the base
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of the application code
COPY . .

# Build the Angular app
RUN npm run build -- --output-path=dist

# Expose port (default Angular port)
EXPOSE 4200

# Start the Angular app
CMD ["npx", "http-server", "dist", "-p", "4200", "-c-1"]
