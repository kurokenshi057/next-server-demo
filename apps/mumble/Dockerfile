# Utiliser une image Ubuntu 20.04 comme base
FROM ubuntu:20.04

# Définir le mainteneur
LABEL maintainer="votre.email@example.com"

# Mettre à jour les paquets et installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    lsb-release \
    software-properties-common \
    && apt-get clean

# Ajouter le dépôt Mumble officiel et installer le serveur Murmur
RUN add-apt-repository ppa:mumble/release \
    && apt-get update \
    && apt-get install -y mumble-server \
    && apt-get clean

# Configurer le serveur Murmur
RUN sed -i 's/^#allowhtml=.*/allowhtml=true/' /etc/mumble-server.ini \
    && sed -i 's/^#port=.*/port=64738/' /etc/mumble-server.ini \
    && sed -i 's/^#serverpassword=.*/serverpassword=/' /etc/mumble-server.ini \
    && sed -i 's/^#bandwidth=.*/bandwidth=72000/' /etc/mumble-server.ini \
    && sed -i 's/^#users=.*/users=100/' /etc/mumble-server.ini

# Exposer le port 64738 pour Murmur
EXPOSE 64738/tcp 64738/udp

# Définir la commande par défaut pour démarrer Murmur
CMD ["murmurd", "-fg", "-ini", "/etc/mumble-server.ini"]



