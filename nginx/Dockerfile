# Utiliser une image Ubuntu comme base
FROM ubuntu:latest

# Définir le mainteneur
LABEL maintainer="votre.email@example.com"

# Mettre à jour les paquets et installer Nginx
RUN apt-get update && apt-get install -y nginx && apt-get clean

# Supprimer les fichiers temporaires pour réduire la taille de l'image
RUN rm -rf /var/lib/apt/lists/*

# Copier les fichiers de configuration personnalisés (si nécessaire)
# COPY ./my-custom-nginx.conf /etc/nginx/nginx.conf

# Exposer le port 80 pour le trafic HTTP
EXPOSE 80

# Définir la commande par défaut pour démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]