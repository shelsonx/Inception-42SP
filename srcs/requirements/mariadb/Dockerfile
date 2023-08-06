FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

COPY ./conf/my.cnf /etc/mysql/my.cnf

RUN service mariadb start && \
    mariadb -u root -e \
    "CREATE DATABASE IF NOT EXISTS wordpress_db; \
    CREATE USER 'user42'@'%' identified by 'user42'; \
    GRANT ALL ON wordpress_db.* TO 'user42'@'%' IDENTIFIED BY 'user42'; \
    FLUSH PRIVILEGES;" && \
    service mariadb stop

CMD ["mysqld_safe"]
