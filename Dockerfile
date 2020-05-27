FROM phizzl/php:7.2-ubuntu-xenial
LABEL maintainer "Phizzl <the@phizzl.de>"

ENV APACHE_RUN_USER=docker
ENV APACHE_RUN_GROUP=docker

ADD playbook.yml /tmp/playbook.yml

RUN sudo ansible-playbook -vv /tmp/playbook.yml

RUN  sudo usermod -o -u $(id -u docker) www-data && \
     sudo groupmod -o -g $(id -g docker) www-data

ADD sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
ADD sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

EXPOSE 80 443

WORKDIR /var/www/html

VOLUME ["/var/www/html", "/etc/php/7.2/apache2/conf.d"]

CMD ["sudo", "apache2ctl", "-D", "FOREGROUND"]
