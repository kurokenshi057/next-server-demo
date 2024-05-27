# Utiliser une image officielle de Python comme base
FROM python:3.9-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers nécessaires dans le conteneur
COPY app.py /app

# Installer Flask
RUN pip install flask

# Exposer le port sur lequel l'application Flask fonctionnera
EXPOSE 81

# Définir la commande par défaut pour exécuter l'application
CMD ["python", "app.py"]
