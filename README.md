# Taller 3 Sistemas Distribuidos
### Autor: Nicolás Machado Sáenz
### Tema: Aprovisionamiento de Infraestructura y Servicios con Docker

Esta actividad tiene como objetivo desplegar servicios mediante contenedores usando la herramienta Docker. El
taller consta de estos elementos:
  * Dos contenedores Ubuntu Server 16.04 con Apache y PHP + MySQL.
  * Una imagen base de Ubuntu Server
  * Docker instalado en el host de trabajo
  
  El primer paso es implementar los Dockerfile para aprovisionar cada contenedor. Para lograrlo, es necesario
  contar primero con una estructura de directorio de modo que el Dockerfile (DF) por servicio se encuentre en
  una carpeta separada. Esto es, para el servicio web existe un DF en una carpeta web/ y para el servicio de
  base de datos hay otro en la carpeta mysql/. Cada DF se muestra a continuación.
  
  ### Servicio Web: Apache2 + PHP
  ```Dockerfile
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
  ```
