# Utiliser l'image de base Ubuntu
FROM ubuntu:latest

# Définir les informations du mainteneur
LABEL maintainer="your-email@example.com"

# Mettre à jour le système et installer MariaDB
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    apt-get clean

# Ajouter le fichier de configuration MariaDB
COPY my.cnf /etc/mysql/my.cnf

# Exposer le port par défaut de MariaDB
EXPOSE 3306

# Copier le script de démarrage pour MariaDB
COPY docker-entrypoint.sh /usr/local/bin/

# Définir les permissions pour le script de démarrage
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Utiliser le script de démarrage comme point d'entrée
ENTRYPOINT ["docker-entrypoint.sh"]

# Commande pour démarrer MariaDB
CMD ["mysqld"]

# Volume pour les données de MariaDB
VOLUME ["/var/lib/mysql"]

