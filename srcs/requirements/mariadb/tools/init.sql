
-- Remove remote root connection
DELETE FROM mysql.global_priv WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

-- Set root password
UPDATE mysql.global_priv SET priv=json_set(priv, '$.plugin', 'mysql_native_password', '$.authentication_string', PASSWORD('DB_ROOT_PASSWD')) WHERE User='root';

-- Update privileges
FLUSH PRIVILEGES;

-- Wordpress database init
CREATE USER 'DB_WP_USER'@'wordpress.inception' IDENTIFIED BY 'DB_WP_PASSWD';
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'DB_WP_USER'@'wordpress.inception';

-- Update privileges
FLUSH PRIVILEGES;
