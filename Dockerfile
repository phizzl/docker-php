FROM phizzl/php:7.2-ubuntu-xenial
LABEL maintainer "Phizzl <the@phizzl.de>"

ADD playbook.yml /tmp/playbook.yml

RUN ansible-playbook -vv /tmp/playbook.yml

ADD sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
ADD sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

EXPOSE 80 443

WORKDIR /var/www/html

VOLUME ["/var/www/html", "/etc/php/7.2/apache2/conf.d"]

CMD ["apache2ctl", "-D", "FOREGROUND"]
