# Use the official Node.js image.
FROM node:18

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
COPY package*.json ./

# Install production dependencies.
RUN npm install --only=production --legacy-peer-deps

# Copy the rest of the application code.
COPY . .

# Install pm2 to manage processes
RUN npm install -g pm2

# Start both frontend and backend
CMD ["pm2-runtime", "start", "ecosystem.config.js"]

# Expose the port the app runs on
EXPOSE 8080 