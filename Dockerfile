FROM nginx:alpine

ENV NGINX_VERSION nginx-1.18.0

EXPOSE 80
EXPOSE 443

RUN apk add --update-cache nginx

COPY default.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]
