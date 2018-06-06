#!/bin/bash
set -e

echo "Migrating database 'php artisan migrate --force'..."
php artisan migrate --force

export APP_ENV="${APP_ENV:-production}"
seederEnv="${APP_ENV^}"
seederFile="${seederEnv}Seeder"
seederFilePath="database/seeds/${seederFile}.php"

if [ -f "$seederFilePath" ]; then
    php artisan db:seed --class=${seederFile}
fi