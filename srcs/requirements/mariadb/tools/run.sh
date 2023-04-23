#!bin/ash

# Set database
sed -i "s/DB_ROOT_PASSWD/$DB_ROOT_PASSWD/g" init.sql && \
sed -i "s/DB_WP_USER/$DB_WP_USER/g" init.sql && \
sed -i "s/DB_WP_PASSWD/$DB_WP_PASSWD/g" init.sql && \

# Run database
exec mariadbd-safe --init_file=/init.sql
