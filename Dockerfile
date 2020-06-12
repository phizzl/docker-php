FROM phizzl/ansible:ubuntu-focal
LABEL maintainer "Phizzl <the@phizzl.it>"

ADD playbook.yml /tmp/playbook.yml

RUN ansible-playbook -vv /tmp/playbook.yml
