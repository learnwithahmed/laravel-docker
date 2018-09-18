FROM ubuntu:18.04

LABEL maintainer="Ahmed Abdulrahman"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y gnupg tzdata \
  && echo "UTC" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update \
  && apt-get install -y curl zip unzip git supervisor sqlite3 \
  nginx php7.2-fpm php7.2-cli \
  php7.2-pgsql php7.2-sqlite3 php7.2-gd \
  php7.2-curl php7.2-memcached \
  php7.2-imap php7.2-mysql php7.2-mbstring \
  php7.2-xml php7.2-zip php7.2-bcmath php7.2-soap \
  php7.2-intl php7.2-readline php7.2-xdebug \
  php-msgpack php-igbinary \
  && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
  && php -r "unlink('composer-setup.php');" \
  && chsh -s /bin/bash www-data && mkdir -p /var/www/.composer && chown -R www-data:www-data /var/www \
  && su -c "composer global require hirak/prestissimo" -s /bin/sh www-data \
  && mkdir /run/php \
  && apt-get -y clean \
  && apt-get -y autoclean \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/* && rm -rf && rm -rf /var/lib/cache/* && rm -rf /var/lib/log/* && rm -rf /tmp/* \
  && echo "daemon off;" >> /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

ADD nginx/default /etc/nginx/sites-available/default
ADD nginx/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD php/php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf
ADD start.sh /usr/bin/start
RUN chmod +x /usr/bin/start

ENTRYPOINT ["start"]
