FROM dekmabot/docker-laravel:latest
MAINTAINER dekmabot@gmail.com

ADD nginx-host.conf /etc/nginx/sites-enabled/

WORKDIR /var/www/laravel
 
EXPOSE 22 80 443
 
CMD ["/usr/bin/supervisord"]
