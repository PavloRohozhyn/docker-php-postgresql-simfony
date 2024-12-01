#!/bin/bash
set -e

cd /var/www

# clear cache
php bin/console cache:clear
sleep 5

# run migration for app database
php bin/console doctrine:migrations:migrate --no-interaction 
sleep 5

# run migration for app-test database
php bin/console doctrine:migrations:migrate --env=test --no-interaction
sleep 5

# run fixtures for app database
php bin/console doctrine:fixtures:load  --no-interaction 
sleep 5

exec "$@"
