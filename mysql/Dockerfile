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
