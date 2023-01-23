#FROM node:lts-alpine
FROM node:14

#WORKDIR /app

RUN mkdir -p /usr/src/frontend
RUN mkdir -p /usr/src/backend

# copy frontend and backend apps files
COPY frontend/ /usr/src/frontend
COPY backend/ /usr/src/backend

WORKDIR /usr/src/backend


# install dependencies
RUN npm install && npm ci

WORKDIR /usr/src/frontend

RUN npm install && npm ci && npm run build


WORKDIR /usr/src/backend

# start backend
#CMD cd /usr/src/backend && npm start &
CMD ["npm", "start", "&"]
 
 WORKDIR /usr/src/frontend
# start frontend
# CMD cd /usr/src/frontend && npm start
CMD ["npm", "start"]
