#!/bin/bash
set -e

echo "Migrating database with 'php artisan migrate --force'..."
php artisan migrate --force

export APP_ENV="${APP_ENV:-production}"
seederEnv="${APP_ENV^}"
seederFile="${seederEnv}Seeder"
seederFilePath="database/seeds/${seederFile}.php"

if [ -f "$seederFilePath" ]; then
    echo "Seeding database with 'php artisan db:seed ${seederFilePath}'"
    php artisan db:seed --class=${seederFile}
fi