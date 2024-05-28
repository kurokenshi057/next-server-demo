# Utiliser une image Ubuntu comme base
FROM ubuntu:20.04

# Définir le mainteneur
LABEL maintainer="votre.email@example.com"

# Mettre à jour les paquets et installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    lsb-release \
    && apt-get clean

# Ajouter le dépôt PostgreSQL officiel
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Installer PostgreSQL
RUN apt-get update && apt-get install -y postgresql postgresql-contrib

# Configurer PostgreSQL pour accepter les connexions externes
RUN echo "listen_addresses='*'" >> /etc/postgresql/12/main/postgresql.conf \
    && echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/12/main/pg_hba.conf

# Définir l'utilisateur et la base de données par défaut
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin
ENV POSTGRES_DB=mydb

# Ajouter un script pour initialiser la base de données
COPY init-db.sh /docker-entrypoint-initdb.d/

# Exposer le port PostgreSQL
EXPOSE 5432

# Définir la commande par défaut pour démarrer PostgreSQL
CMD ["postgres"]

# Fin du Dockerfile

