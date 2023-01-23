FROM node:14

COPY . /app

WORKDIR /app/backend

RUN npm install

EXPOSE 8080

CMD ["npm", "start"]
#####################################################################
WORKDIR /app/frontend
RUN npm install
EXPOSE 3000
CMD ["npm", "build"]
CMD ["npm", "start"]
