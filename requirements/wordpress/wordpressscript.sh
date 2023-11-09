#!/bin/bash

if [ -f "/var/www/wordpress/wp-config.php" ]; then
    echo "WordPress is already installed in this directory."
    exec "$@"
    exit 0
fi

if [ ! -d "/usr/local/bin/wp" ]; then
    cd /tmp
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

if [ ! -d "/var/www/wordpress" ]; then
    mkdir -p /var/www/wordpress
fi

chmod -R 755 /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress

cd /var/www/wordpress
rm -rf /var/www/wordpress/*

wp core download --allow-root

echo "Generating WordPress 'wp-config.php'..."
wp config create --allow-root --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost=mariadb:3306 --path='/var/www/wordpress'

echo "Installing WordPress deps..."
# Uncomment the following line if you want to automatically install WordPress
wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_EMAIL}

echo "Creating users..."
# Add more user creation commands as needed
wp user create ${WP_USER} ${WP_USER_EMAIL} --role=administrator --user_pass=${WP_USER_PASSWD} --path=/var/www/wordpress --allow-root

exec "$@"
