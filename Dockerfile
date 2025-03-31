# Use Node 18 (which meets Next.js requirements)
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies using npm with legacy peer dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of your application code
COPY . .

# Build the Next.js app
RUN npm run build

# Expose the port Cloud Run uses (typically 8080)
EXPOSE 8080

# Start the Next.js app on the Cloud Run port
CMD ["npm", "start"]
