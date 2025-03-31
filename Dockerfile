# Use an official Node.js runtime as the base image
FROM node:16

# Set the working directory
WORKDIR /app

# Copy package.json and lock files
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --legacy-peer-deps

# Copy the rest of your app
COPY . .

# Build the Next.js app
RUN yarn build

# Expose the port Cloud Run uses (typically 8080)
EXPOSE 8080

# Start the Next.js app on the Cloud Run port
CMD ["yarn", "start"]
