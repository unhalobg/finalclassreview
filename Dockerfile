#FROM node:lts-alpine
FROM node:14

#WORKDIR /app

RUN mkdir -p /usr/src/frontend
RUN mkdir -p /usr/src/backend

# copy frontend and backend apps files
COPY frontend/ /usr/src/frontend
COPY backend/ /usr/src/backend

# install dependencies
RUN cd /usr/src/backend && npm install && npm ci
RUN cd /usr.src/frontend && npm install && npm ci && npm run build

# start backend
CMD cd /usr/src/backend && npm start &
#CMD ['sh', "cd /app/backend && npm start &"]

# start frontend
CMD cd /usr/src/frontend && npm start
#CMD ['sh', "cd /app/frontend && npm start"]
