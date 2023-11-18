FROM alpine:3.16


RUN apk update && apk upgrade && apk add --no-cache \
        wget\
        php8\
        php8-session\
        php8-common\
        php8-gd\
        php8-iconv\
        php8-xml\
        php8-curl\
        php8-imap\
        php8-mysqli\
        php8-pdo\
        php8-cgi\
        php8-soap\
        php8-pdo_mysql \
        php8-gettext\
        php8-posix\
        php8-ctype\
        php8-ldap\
        php8-simplexml\
        php8-dom

WORKDIR /var/www


RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
mv adminer-4.8.1.php index.php && chown -R root:root /var/www/
EXPOSE 8080
CMD [ "php", "-S", "[::]:8080", "-t", "/var/www" ]