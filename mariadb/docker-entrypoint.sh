#!/bin/bash
set -e

# Initialiser la base de données s'il n'y a pas de données présentes
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo 'Initializing database'
    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
    echo 'Database initialized'

    mysqld --user=mysql --datadir=/var/lib/mysql --skip-networking &
    pid="$!"

    mysql=( mysql --protocol=socket -uroot )

    for i in {30..0}; do
        if echo 'SELECT 1' | "${mysql[@]}" &> /dev/null; then
            break
        fi
        echo 'MariaDB init process in progress...'
        sleep 1
    done

    if [ "$i" = 0 ]; then
        echo >&2 'MariaDB init process failed.'
        exit 1
    fi

    mysql_tzinfo_to_sql /usr/share/zoneinfo | "${mysql[@]}" mysql

    if [ ! -z "$MYSQL_ROOT_PASSWORD" ]; then
        "${mysql[@]}" <<-EOSQL
            SET @@SESSION.SQL_LOG_BIN=0;
            DELETE FROM mysql.user WHERE user != 'mysql.sys';
            GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;
            FLUSH PRIVILEGES;
EOSQL
    fi

    if [ ! -z "$MYSQL_DATABASE" ]; then
        echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\` ;" | "${mysql[@]}"
    fi

    if [ ! -z "$MYSQL_USER" ] && [ ! -z "$MYSQL_PASSWORD" ]; then
        echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;" | "${mysql[@]}"
        if [ ! -z "$MYSQL_DATABASE" ]; then
            echo "GRANT ALL ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%' ;" | "${mysql[@]}"
        fi
    fi

    if ! kill -s TERM "$pid" || ! wait "$pid"; then
        echo >&2 'MariaDB init process failed.'
        exit 1
    fi
fi

exec "$@"
