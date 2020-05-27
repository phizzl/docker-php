FROM phizzl/ansible:ubuntu-xenial
LABEL maintainer "Phizzl <the@phizzl.de>"

ADD playbook.yml /tmp/playbook.yml

RUN ansible-playbook -vv /tmp/playbook.yml
