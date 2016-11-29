FROM postgres:9.4

ADD ./uhm2016.sql /docker-entrypoint-initdb.d/001-db.sql
ENV POSTGRES_PASSWORD oijoij
ENV POSTGRES_USER ch
ENV POSTGRES_DB ch
