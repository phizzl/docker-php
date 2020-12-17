FROM phizzl/ansible:2.10
LABEL maintainer "Phizzl <the@phizzl.it>"

ADD playbook.yml /tmp/playbook.yml

RUN ansible-playbook -vv /tmp/playbook.yml
