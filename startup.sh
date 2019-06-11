#!/bin/sh
set -e

# Wait for the database
while ! mysqladmin ping --host=${DB_HOST} --port=${DB_PORT} --user=${DB_USERNAME} --password=${DB_PASSWORD} --silent; do

    echo "MariaDB container might not be ready yet... sleeping..."
    sleep 10
done

php /var/www/seat/artisan horizon
