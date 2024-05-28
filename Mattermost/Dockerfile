FROM mattermost/mattermost-team-edition:latest

# Copier le fichier de configuration dans le conteneur
COPY config.json /mattermost/config.json

# Exposer le port Mattermost
EXPOSE 8065

# Définir la commande par défaut pour démarrer Mattermost
CMD ["mattermost"]

