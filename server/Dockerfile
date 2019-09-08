FROM ubuntu:18.04

LABEL maintainer="Ahmed Abdulrahman"

RUN useradd -ms /bin/bash -u 1337 laravel
WORKDIR /var/www/html

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN set -x \
  && apt-get update && apt-get install -y gnupg gosu \
  && gosu nobody true

RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main" > /etc/apt/sources.list.d/ppa_ondrej_php.list \
  && echo "deb http://ppa.launchpad.net/nginx/development/ubuntu bionic main" > /etc/apt/sources.list.d/ppa_nginx_mainline.list \
  && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E5267A6C \
  && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C300EE8C \
  && apt-get update \
  && apt-get install -y curl zip unzip git supervisor sqlite3 \
  nginx php7.3-fpm php7.3-cli \
  php7.3-pgsql php7.3-sqlite3 php7.3-gd \
  php7.3-curl php7.3-memcached \
  php7.3-imap php7.3-mysql php7.3-mbstring \
  php7.3-xml php7.3-zip php7.3-bcmath php7.3-soap \
  php7.3-intl php7.3-readline php7.3-xdebug \
  php7.3-msgpack php7.3-igbinary php7.3-ldap \
  && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
  && mkdir /run/php \
  && apt-get -y autoremove \
  && apt-get -y autoclean \
  && rm -rf /var/lib/apt/lists/* /var/lib/cache/* /var/lib/log/* /tmp/* /var/tmp/* \
  && echo "daemon off;" >> /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx/default /etc/nginx/sites-available/default
COPY nginx/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY php/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY php/xdebug.ini /etc/php/7.3/mods-available/xdebug.ini
COPY php/php.ini /etc/php/7.3/fpm/conf.d/99-php.ini

EXPOSE 80

ADD start.sh /usr/bin/start
RUN chmod +x /usr/bin/start

ENTRYPOINT ["start"]
