FROM dekmabot/docker-laravel
MAINTAINER dekmabot@gmail.com

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:certbot/certbot
RUN apt-get update
RUN apt-get -y install python-certbot-nginx

ADD nginx-host.conf /etc/nginx/sites-enabled/default

ADD certbot.sh /var/www/admin/certbot.sh

WORKDIR /var/www/laravel
 
EXPOSE 22 80 443
 
CMD ["/usr/bin/supervisord"]

