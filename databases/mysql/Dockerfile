FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD 123
ENV MYSQL_DATABASE services
ENV MYSQL_USER admin
ENV MYSQL_PASSWORD 1234
ADD tables.sql /docker-entrypoint-initdb.d

EXPOSE 3306