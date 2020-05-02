FROM phizzl/ansible:latest
LABEL maintainer "Phizzl <the@phizzl.de>"

ADD playbook.yml /tmp/playbook.yml

RUN sudo ansible-playbook -vv /tmp/playbook.yml
