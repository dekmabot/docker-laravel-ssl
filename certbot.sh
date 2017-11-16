#!/bin/bash

COLOR='\033[92m'
NOCOLOR='\033[0m'

echo "\nEnter your email address:"
read email

echo "\nEnter domain name (space separated):"
read domains

set -- $domains
first_domain=$1

command="certbot certonly --agree-tos --no-eff-email -m $email --webroot -w /var/www/laravel/public/"
for domain in $domains
do
    command="$command -d $domain"
done

echo $command

$command

cp /etc/letsencrypt/live/$first_domain/fullchain.pem /var/www/laravel/config/ssl/certs/chained.pem
cp /etc/letsencrypt/live/$first_domain/privkey.pem /var/www/laravel/config/ssl/private/domain.key

service nginx reload

echo ""
echo "> ${COLOR}Don\`t forget to restart frontend Nginx server!${NOCOLOR}"
echo ""

