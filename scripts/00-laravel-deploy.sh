#!/usr/bin/env bash
echo "Running composer"
composer install --no-dev --working-dir=/var/www/html

echo "Creating SQLite database and setting permissions..."
mkdir -p /var/www/html/database
touch /var/www/html/database/database.sqlite
chmod -R 777 /var/www/html/database /var/www/html/storage /var/www/html/bootstrap/cache

echo "Clearing caches..."
php artisan optimize:clear

echo "Running migrations..."
php artisan migrate --force
