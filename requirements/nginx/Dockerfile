FROM alpine:latest

RUN apk update && apk add nginx openssl


RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/ssl/nginx.pem \
        -keyout /etc/ssl/nginx.key \
        -subj "/C=IT/ST=Med/L=Med/O=1337 School/OU=med/CN=med/"

COPY nginx.conf /etc/nginx/http.d/default.conf
# COPY nginx.conf /etc/nginx/nginx.conf
# RUN mkdir -p /var/www/html
# RUN chmod 755 /var/www/wordpress
# RUN chown -R www-data:www-data /var/www/html
COPY index.html /var/www/


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]