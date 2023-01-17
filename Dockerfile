ENV NODE_OPTIONS="--openssl-legacy-provider"

FROM node:14-alpine

WORKDIR /app

# Copy built frontend application
COPY tmp/frontend ./frontend

# Copy built backend application
COPY tmp/backend ./backend

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install backend dependencies
RUN cd backend && npm install

# Expose port for the backend
EXPOSE 8080

# Start the backend
CMD ["npm", "ci"]
CMD ["node", "backend/index.js"]

#set the working directory 
WORKDIR /app/frontend

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install the app dependencies
RUN yarn install

# Copy the rest of the application code
COPY . .

# Build the app
RUN yarn build

# Expose the port
EXPOSE 3000

# Start the application
CMD ["npm", "ci"]
CMD [ "npm", "start" ]
