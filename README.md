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
  ### Servicio de Base de Datos: MySQL
  ```Dockerfile
  FROM ubuntu:16.04
  MAINTAINER nicols.machadosaenz55@gmail.com
  
  ADD files/ /temp/
  
  RUN apt-get update -y --fix-missing
  RUN apt-get install apt-utils -y
  RUN apt-get install expect -y
  RUN apt-get install mysql-server -y
  
  WORKDIR /temp
  
  CMD chmod +x conf_sql.sh
  CMD ./conf_sql.sh
  
  EXPOSE 3306
  CMD service mysql start
  ```
  
  En el primer DF se instalan todos los paquetes asociados al servicio web con Apache2 y PHP, incluyendo php-
  mysql que permite conectarse a una BD en MySQL a partir de PHP. Así mismo, abre el puerto 80 TCP para hacer
  posible la conexión web, y copia del host al contenedor los archivos web. 
  El segundo archivo instala todas las utilidades asociadas al motor de base de datos, y ubica en una carpeta
  de archivos temporales un script bash ejecutable para hacer configuraciones de seguridad de mysql. De igual
  manera, deja activo el servicio escuchando en el puerto 3306.
  
  Para ejecutar estos DF simultáneamente, se ejecuta un archivo de Docker Compose. Podemos notar en web y db
  las líneas ```build```, esto implica que el DC ejecuta implícitamente los comandos
  
  ```bash
  docker build /web
  docker build /mysql
  ```
  ### docker-compose.yml
  ```yml
  version: '2'
  services:
  web:
    build: ./web
    ports:
     - "8080:8080"
  db:
    build: ./mysql
    ports:
     - "3306:3306"
  ```
  
  El comando debe ejecutarse en la carpeta donde se encuentren los folders <b>/web</b> y <b>/mysql</b>.
  En el terminal, debe aparecer algo como esto:
  ```bash
  distribuidos@Equipo-Lab-306C:~/Documents/talleres/sd-workshop3$ docker-compose up
  ```
  
  Y estas son las evidencias de funcionamiento.
  
  
