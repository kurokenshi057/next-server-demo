# Utiliser l'image de base Ubuntu
FROM ubuntu:latest

# Mainteneur de l'image
LABEL maintainer="votre_email@example.com"

# Mettre à jour les paquets et installer MariaDB
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean

# Configurer MariaDB pour qu'il écoute sur toutes les interfaces
RUN sed -i 's/bind-address\s*=.*$/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Exposer le port par défaut de MariaDB
EXPOSE 3306

# Copier le script d'initialisation dans l'image
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Définir le point d'entrée
ENTRYPOINT ["docker-entrypoint.sh"]

# Lancer MariaDB
CMD ["mysqld"]

