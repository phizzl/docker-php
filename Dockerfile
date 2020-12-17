FROM phizzl/php:7.4-cli
LABEL maintainer "Phizzl <the@phizzl.it>"

CMD ["php-fpm"]
ENTRYPOINT ["docker-php-entrypoint"]
