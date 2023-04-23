#!/bin/ash

# Init php-fpm config
sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php81/php.ini;
sed -i "s/user = nobody/user = www-data/" /etc/php81/php-fpm.d/www.conf;
sed -i "s/group = nobody/group = www-data/" /etc/php81/php-fpm.d/www.conf;
sed -i "s/listen = 127.0.0.1:9000/listen = 9000/" /etc/php81/php-fpm.d/www.conf;

# Init wordpress
wp config create --dbname=wordpress --dbuser=$DB_WP_USER --dbpass=$DB_WP_PASSWD --dbhost=mariadb;
wp core install --url=http://lfrederi.42.fr:8080 --title=SUPERNOVA_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_USER@gmail.fr
wp user create $WP_USER_NAME $WP_USER_NAME@gmail.fr --user_pass=$WP_USER_PASSWORD

# Set wordpress linux user
adduser www-data -G www-data -D;
chown www-data:www-data -R /wordpress;

# Run php-fpm in foreground
php-fpm81 -F;
