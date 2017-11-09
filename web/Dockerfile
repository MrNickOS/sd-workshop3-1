FROM ubuntu:16.04
MAINTAINER nicols.machadosaenz55@gmail.com

RUN apt-get update -y --fix-missing
RUN apt-get install apt-utils -y
RUN apt-get install apache2 -y
RUN apt-get install php libapache2-mod-php php-common -y
RUN apt-get install php-mysql -y

EXPOSE 80

ADD html/index.html /var/www/html/index.html
ADD html/info.php /var/www/html/info.php
ADD html/select.php /var/www/html/select.php

CMD service apache2 start && tail -f /var/log/apache2/access.log
CMD tail -f /var/log/apache2/error.log
