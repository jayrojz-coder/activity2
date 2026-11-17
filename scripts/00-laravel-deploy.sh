#!/usr/bin/env bash
echo "Running composer"
composer install --no-dev --working-dir=/var/www/html

echo "Setting up SQLite database..."
touch /var/www/html/database/database.sqlite

echo "Clearing caches..."
php artisan optimize:clear

echo "Running migrations..."
php artisan migrate --force