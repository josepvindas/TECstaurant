FROM postgres:latest

ENV POSTGRES_USER root
ENV POSTGRES_PASSWORD 123
ENV POSTGRES_DB services

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432