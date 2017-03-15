---
title : Présentation avec Reveal.js en mode container Docker
date : 12/05/2016
categories : Web tools
tags : [js, docker, reveal]
---

Dans le cadre d'une présentation de Docker, j'ai décidé d'utiliser [Reveal.js](http://lab.hakim.se/reveal-js/#/).


Pour ceux qui ne connaissent pas __*reveal.js*__ est un framework Javascript qui permet de transformer du contenu texte fourni par exemple en [Markdown](https://daringfireball.net/projects/markdown/) en HTML.

Il permet de customiser le contenu de la présentation, les backgrounds, animations, etc.


Pour fonctionner, il y a 2 modes :

1. Le mode "basic" avec du contenu directement intégré dans une page HTML qui s'occupe également de charger le javascript. Cette page affichée depuis un navigateur charge la librairie __*reveal*__ qui transforme des balises ```sections``` en contenu formaté via HTML
2. Le mode "externalisé" où l'on peut charger un fichier Markdown externe par exemple. C'est bien pratique, cela permet de découpler du contenu structuré du rendu final (ce qui est souvent un effet recherché et permet de ne pas enfermer le discours utile dans la techno de présentation - à bon PowerPointeur, salut !)

J'ai donc choisi de privilégier ce second mode. Petite problématique : le fonctionnement de __*reveal*__ impose que les fichiers "externes" soit exposé telle une ressource web. Cela nécessite donc de la présenter sur un serveur Web.


Pas de soucis, __*reveal*__ propose de s'installer via l'outillage Node qui va bien : un npm install et un npm start et nous disposons d'un serveur qui expose toutes les ressources du répertoire courant (statiques de __*reveal*__ y compris).


Oui mais du coup, à chaque fois que je vais vouloir exécuter ma présentation reveal sur un nouvel environnement, je vais devoir télécharger toutes les dépendances JS, réaliser les tâches automatique de configuration/installation: ce qui va me prendre du temps, beaucoup de temps...


### La solution...  Docker !

Après tout ma présentation est sur docker: quel meilleur démonstrateur que ma présentation elle-même?

Après avoir cherché sur [Docker Hub](https://hub.docker.com/), je ne suis pas le seul à avoir eu l'idée... c'est toujours bon signe ;) Mais les images que j'ai trouvées ne répondaient pas à mes exigences  :

* Construire facilement une image de container avec une nouvelle version de __*reveal*__ (je souhaite que la maintenance et les évolutions futures soient la plus simple possible. J'imagine même mettre en place un "listener" sur le dépôt git de __*reveal*__)
* Je souhaite pouvoir réutiliser facilement mon image pour exécuter différentes présentations donc fournir du contenu depuis l'extérieur du container à l'exécution. Solution: Passer par un volume Docker...

Bref, j'ai buildé, pushé ma première image Docker : [rguillom/reveal](https://hub.docker.com/r/rguillom/reveal/) !


Et le dépôt GitHub qui va bien : [https://github.com/rguillome/docker-revealjs-img](https://github.com/rguillome/docker-revealjs-img)
