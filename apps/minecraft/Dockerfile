# Utiliser une image Ubuntu comme base
FROM ubuntu:latest

# Définir le mainteneur
LABEL maintainer="votre.email@example.com"

# Mettre à jour les paquets et installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    openjdk-21-jre-headless \
    wget \
    screen \
    && apt-get clean

# Définir le répertoire de travail
WORKDIR /minecraft

# Télécharger le fichier minecraft-server.jar depuis l'URL fournie
RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/145ff0858209bcfc164859ba735d4199aafa1eea/server.jar

# Accepter automatiquement l'EULA de Minecraft
RUN echo "eula=true" > eula.txt

# Créer le fichier server.properties et définir online-mode à false
RUN echo "online-mode=false" > server.properties

# Exposer le port 25565 pour Minecraft
EXPOSE 25565

# Définir la commande pour exécuter le serveur Minecraft
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]

# Fin du Dockerfile

