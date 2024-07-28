FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kathmandu

RUN apt-get update && apt-get install -y apache2 php php-mysql wget

WORKDIR /tmp
RUN wget https://wordpress.org/latest.tar.gz && tar -xvzf latest.tar.gz && cp -R wordpress/* /var/www/html && rm -f /var/www/html/index.html

WORKDIR /var/www/html
COPY ./wp-config.php /var/www/html

RUN chown -R www-data:www-data * && chmod -R 755 *

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
