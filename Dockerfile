FROM phizzl/php:7.4-ubuntu-xenial
LABEL maintainer "Phizzl <the@phizzl.de>"

ENV APACHE_RUN_USER=docker
ENV APACHE_RUN_GROUP=docker

ADD playbook.yml /tmp/playbook.yml

RUN sudo ansible-playbook -vv /tmp/playbook.yml

EXPOSE 80 443

WORKDIR /var/www/html

VOLUME /var/www/html

CMD ["sudo", "apachectl", "-D", "FOREGROUND"]
