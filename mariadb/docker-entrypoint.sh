#!/bin/bash
set -e

# Démarrer le service MariaDB
service mysql start

# Créer un utilisateur root avec accès à distance
mysql -e "CREATE USER 'root'@'%' IDENTIFIED BY 'password';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

# Arrêter le service MariaDB pour que le conteneur puisse le démarrer avec mysqld
mysqladmin shutdown

# Exécuter la commande passée en argument (par défaut, "mysqld")
exec "$@"

