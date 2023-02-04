
FROM nginx:1.17.1-alpine
COPY /dist/suma /usr/share/nginx/html
