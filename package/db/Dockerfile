FROM mysql:5.7.24
MAINTAINER Simon NG <007lock@gmail.com>

RUN chown -R mysql:root /var/lib/mysql/

ADD mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf
ADD my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]