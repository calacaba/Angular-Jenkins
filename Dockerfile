FROM node:slim AS angular
WORKDIR /app
COPY package.json /app/package.json
COPY . /app
RUN npm install 
RUN npm install -g @angular/cli
RUN ng build



FROM nginx:1.17.1-alpine
COPY /dist/suma /usr/share/nginx/html
