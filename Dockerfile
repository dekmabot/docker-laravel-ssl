FROM dekmabot/docker-laravel:latest
MAINTAINER dekmabot@gmail.com

ADD default /etc/nginx/sites-enabled/

WORKDIR /var/www/laravel
 
EXPOSE 22 80 443
 
CMD ["/usr/bin/supervisord"]
