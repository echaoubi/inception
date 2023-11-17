FROM alpine:latest

RUN apk update && apk add nginx openssl


RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/ssl/nginx.pem \
        -keyout /etc/ssl/nginx.key \
        -subj "/C=MA/ST=Med/L=Med/O=1337 School/OU=med/CN=med/"

COPY nginx.conf /etc/nginx/http.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]