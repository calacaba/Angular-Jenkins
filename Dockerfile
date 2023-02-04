
FROM node:latest

WORKDIR /app

COPY . ./

RUN npm install
RUN npm run build

FROM nginx:1.17.1-alpine
COPY /dist/suma /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]