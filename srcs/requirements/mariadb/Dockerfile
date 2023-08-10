FROM debian:bullseye

ARG WP_DATABASE
ARG WP_MDB_USER
ARG WP_MDB_PASSWORD

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

COPY ./conf/my.cnf /etc/mysql/my.cnf

RUN service mariadb start && \
    mariadb -u root -e \
    "CREATE DATABASE IF NOT EXISTS $WP_DATABASE; \
    CREATE USER '$WP_MDB_USER'@'%' identified by '$WP_MDB_PASSWORD'; \
    GRANT ALL ON $WP_DATABASE.* TO '$WP_MDB_USER'@'%' IDENTIFIED BY '$WP_MDB_PASSWORD'; \
    FLUSH PRIVILEGES;" && \
    service mariadb stop

CMD ["mysqld_safe"]
