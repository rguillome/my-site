---
title : DevFest Nantes 2014
date : 18/11/2014
categories : Conference
tags : [java, google, nantes, gdg]
---

<style type="text/css">
  img[alt=DockerWhale] {
  	width: 20%;
    float:right;
    clear:right;
  }

  img[alt=GoogleCloudPlatform] {
    width: 30%;
    float:right;
    clear:right;
  }

  img[alt=Kubernetes] {
    width: 20%;
    float:right;
    clear:right;
  }
</style>

![LogoDevFest]({{urls.media}}/retour_devfest_2014/gdg_logo.png)
Retour sur le __DevFest 2014__ qui a eu lieu à la cité des congrès de Nantes  le 07/11/2014.

![Hall Devfest 2014]({{urls.media}}/retour_devfest_2014/GOPR4459.JPG)

En terme de chiffre cette 3e édition s'est illustrée par :

* environ 500 participants,
* 28 conférences

Les moments de pause entre les conférences étaient animés par des stands de sponsors (ESN : [Zenika](http://www.zenika.fr/), [Netapsys](http://www.netapsys.fr/), [SQLI](http://www.sqli.com/), ... Éditeurs : [MyScript](http://www.myscript.com/?lang=fr), ...) ainsi que par le [GDG Nantes](http://www.gdgnantes.com/) bien sûr !


Des stands ludiques :

* Question pour un champion avec une application mobile développée par le [GDG Nantes](http://www.gdgnantes.com/)
* Des tests d'Oculus Rift
* Un robot Lego Mindstorms© contrôlé par un bracelet Myo
* Une application permettant de naviguer dans la programmation des conférences avec un Leap motion

Voici la liste des conférences auxquelles j'ai participé et qui sont résumées ici :

* Keynote
* Lucy in the sky with Docker
* Launching and growing a startup on the Google Cloud Platform
* Scaling clusters declaratively with Kubernetes and Docker

 ... Une matinée pure Cloud Computing !

#Keynote

Après une introduction et un lancement de l'évènement par [Jean-François Garreau](https://plus.google.com/+jeanfrancoisgarreau/posts), cette keynote a été animée par une session de [Rossi Oddet](https://plus.google.com/+RossiODDET/posts) (consultant chez SQLi) : la méthode GTD (Getting Things Done)

![GTD Rossi Oddet]({{urls.media}}/retour_devfest_2014/rossi_oddet_devfest14.jpeg)

A mi-chemin entre présentation et *one-man show*, Rossi Oddet part d'une analyse : le stress et la souffrance au travail peuvent être une conséquence d'une mauvaise gestion de l'organisation. Ne pas en tenir compte, conduit à des situations humaines préoccupantes. Et la frontière entre vie professionnelle et vie personnelle toujours plus mince, ne permet plus de limiter ces dégâts à un seul domaine.

Ne pas traiter ou repousser les actions à plus tard à une conséquence directe : le cerveau est de plus en plus encombré par ce qu'il reste à faire. Plutôt que d'agir, on y pense en continue. Mais pour cela, on dépense quand même de l'énergie et on accapare sa mémoire avec une multitude de petits rappels...

Solution proposée par la GTD : Tout noter. Et adopter un processus de traitement en fonction de l'importance, de l'échéance et de la durée de chaque tâche à effectuer :

* Une réponse attendue pour un email qui prend moins de 2 minutes : on traite tout de suite et on n'y pense plus,
    Des tâches plus longues à effectuer : créer une nouvelle note dans [Evernote](https://evernote.com/intl/fr/)
    Du temps libre pour traiter de nouvelles tâches : On dépile, on traite, on délègue, on réorganise avec [Zendone](https://www.zendone.com/). La boite mail aussi peut devenir un outil à organiser (Tags, Labels, ...)

Et c'est valable pour tous les domaines : privés comme professionnels.


Pour les supports, ils sont disponibles ici : http://fr.slideshare.net/RossiOddet/devfest-nantes-2014-keynote-gtdgettingthingsdone


[Vidéo de la keynote](https://www.youtube.com/watch?v=NZ9DwaAbMcg&index=2&list=PLuZ_sYdawLiVbxgDCmrckrzJBcMfW_ycO)


# Lucky in the sky with Docker

![DockerWhale]({{urls.media}}/retour_devfest_2014/docker.png)

*[David Gageot](https://twitter.com/dgageot) est un développeur indépendant, Java Champion, Google Developer Expert, ancien directeur technique chez [Valtech](http://www.valtech.fr/fr), développeur chez [SonarSource](http://www.sonarsource.com/).*

[Docker](https://www.docker.com/) est un des sujets phare du moment. David le démystifie, nous emmenant rapidement dans les entrailles de cet outil, système de conteneur permettant de créer des environnements d'exécution isolés sur plateforme Linux. Attention, il ne s'agit pas de VM à l'instar de [Vagrant](https://www.vagrantup.com/) car la gestion du réseau et du système de fichier s'appuie sur les services du système depuis lequel docker s'exécute. Aujourd'hui, et c'est son plus gros inconvénient, docker ne peut s'exécuter que sous Linux car il repose sur l'[API LXC](https://linuxcontainers.org/) de Linux qui n'a pas forcément son équivalent sur les autres OS. David, sous MacOS X, lance donc ses démos dans une VM Linux.


Docker c'est d'abord quelques commandes très puissantes :

* construire une image nommée "first_container"

    ```docker build -t first_container .```

* démarrer une image

    ```docker run first_container```

* arrêter une image

    ```docker stop first_container```

La liste des commandes est détaillée dans la documentation officielle : http://docs.docker.com/reference/commandline/cli/.

Puis David, nous présente le contenu des fichiers de configuration [DockerFile](https://docs.docker.com/reference/builder/) : la syntaxe assez simple pour intégrer des nouvelles actions lors de la construction, les conteneurs existants, etc.

La suite de la présentation rentre dans les spécificités et les atouts de docker :

* Le cache qui permet à docker de ne pas ré-exécuter une série d'actions qui ont déjà été  effectuées dans un ordre donné,
* L'héritage des configurations d'autres images. Des images sont déjà pré-configurées en ligne (image d'Ubuntu, Debian, par exemple). Il est donc possible de construire des environnements modulaires,
* Le partage entre le système de fichier virtuel dans l'image et celui de l'OS qui exécute Docker,
* La possibilité de modifier des ports au démarrage du conteneur : pas besoin de modifier la configuration interne de ses serveurs d'application si l'on a des conflits entre plusieurs conteneurs

Pour finir, David propose une démo et en quelque sorte une introduction à la présentation de Brian Dorsey : l'automatisation et la supervision de conteneurs docker dans un cluster et notamment sur [Google Compute Engine](https://cloud.google.com/compute).

En aparté, je trouve le tutoriel de Docker très bien fait, donc si vous voulez en voir plus :  [Try it](https://www.docker.com/tryit/) !


[Vidéo de Lucy in the sky with Docker](https://www.youtube.com/watch?v=wEghVJygoOw&index=21&list=PLuZ_sYdawLiVbxgDCmrckrzJBcMfW_ycO)


# Launching and growing a startup on the Google Cloud Platform

![GoogleCloudPlatform]({{urls.media}}/retour_devfest_2014/gcp-logo.png)


*[Jérôme Mouton](https://plus.google.com/+JeromeMouton/posts) est un Google Developer Expert, co-fondateur de [SnapEngage](https://snapengage.com/) où il est directeur technique. Également à la tête du GDG de Berlin, il n'en est pas à son coup d'essai, puisqu'il avait déjà présenté un sujet sur AppEngine lors du précédent DevFest de Nantes.*


Jérôme présente tout d'abord l'intérêt de l'orientation [Paas](https://en.wikipedia.org/wiki/Platform_as_a_service). A ses débuts en tant qu’entrepreneur dans le monde du Web, il créait des publicités qui s'adaptaient au contenu visualisé lors de la navigation des internautes. Les campagnes de publicité sont souvent ponctuelles mais peuvent générer beaucoup de trafic car s'affichent systématiquement sur différents sites intégrant les outils des régies.

L'utilisation d'[AppEngine](https://cloud.google.com/appengine/#features), permet de répondre à ce besoin important de flexibilité et permet de ne payer réellement que pour les ressources nécessaires.


Aujourd'hui les besoins se sont élargis. Google Cloud Platform propose avec [Compute Engine](https://cloud.google.com/compute/) des fonctionnalités [Iaas](https://fr.wikipedia.org/wiki/Infrastructure_as_a_service).


Les différents outils qui composent l'offre ciblent aussi bien le développement que l'exploitation et la supervision des applicatifs :

* En plus d'AppEngine et Compute Engine, [Container Engine](https://cloud.google.com/container-engine/) (en version Alpha), propose de donner accès à la puissance et la simplicité de conteneurs Docker,
* Côté gestion de données:
    * on notera [Cloud SQL](https://cloud.google.com/sql/) qui donne accès à un SGBD MySQL
    * [Cloud Storage](https://cloud.google.com/storage/) permet lui de stocker des objets et de profiter de la gestion des caches locaux (les temps d'accès entre la nouvelle Zélande et les États-Unis par exemple sont parfois très lents tandis que des caches peuvent exister en Australie)
    * Et si on préfère les base NoSQL, pas de soucis : [Cloud Datastore](https://cloud.google.com/datastore/) répondra présent !
* Côté [réseau](https://cloud.google.com/networking/) : du load balancing HTTP ou même TCP/UDP, des enregistrements DNS
* Dans le domaine du Big Data : [BigQuery](https://cloud.google.com/bigquery/) permettra d'exécuter des requêtes SQL sur des volumes de données de plusieurs Téraoctets

En bref, Google Cloud Platform répond à beaucoup de besoins techniques de la vie d'une startup : de la version initiale qui n'est pas ou peu sollicitée à la version évoluée et plébiscitée d'un produit, les contraintes de scalabilité ne sont plus un frein et peuvent être abordées plus sereinement afin de ce concentrer sur son cœur de métier et le développement de nouvelles fonctionnalités.

[Vidéo de Launching and growing a startup on the Google Cloud Platform](https://www.youtube.com/watch?v=U9oM7dEJCvk&index=12&list=PLuZ_sYdawLiVbxgDCmrckrzJBcMfW_ycO)


# Scaling clusters declaratively with Kubernetes and Docker

![Kubernetes]({{urls.media}}/retour_devfest_2014/kubernetes.png)

*[Brian Dorsey](http://briandorsey.info/) est développeur chez Google. Il travaille au sein de l'équipe Google Developer Relations. Il évangélise ainsi les nouveaux produits Google et permet d'orienter ou au moins de conseiller les développeurs du monde entier quant à l'utilisation des nombreuses API Google. Il se concentre notamment sur la partie produit Google Cloud Plateforme.*


Brian est venu nous parler de la gestion des clusters chez Google et comment ils sont arrivés à l'élaboration d'un outil permettant d'administrer et de superviser l'état d'un cluster de container Docker: [Kubernetes](http://kubernetes.io/) (en Open Source au passage)


Tout d'abord, il introduit deux concepts d'organisation :

* Des containers Docker sont regroupés au sein de __[Pods](https://github.com/GoogleCloudPlatform/kubernetes/blob/master/DESIGN.md#pods)__. Ces pods sont donc un ensemble de containers très liés entre eux par les services qu'il rendent. Ces containers vont partager des volumes et la même IP (ce qui va faciliter la communication via localhost notamment) car sont localisé sur le même hôte logique. Dans l'exemple illustrant cette session, le pod utilisé contient une application web, une base de données et un système de cache

* Des __[Labels](https://github.com/GoogleCloudPlatform/kubernetes/blob/master/DESIGN.md#labels)__ permettent d'associer des pods (moins couplés que les containers au sein d'un pod) qui coopèrent entre eux. Ils définissent par exemple le rôle ou les but des pods. Ces clés sont souvent utilisées pour identifié l'environnement pour laquelle le pod est destiné (dev, qa, etc.) ou encore son emplacement dans une architecture n-tiers (frontend, backend).


Kubernetes introduit ensuite la notion de __Replication controllers__ utilisés pour gérer les pods et leur instanciation. Grâce à une syntaxe JSON qui leur sert de template, les replication controllers s'assurent qu'à tout moment, le nombre d'instance de chaque Pod est bien présente sur le système cible, dans l'état configuré.

Voici un exemple d'un fichier de template disponible sur le github de Kubernetes :

``` json
{
  "id": "redisSlaveController",
  "kind": "ReplicationController",
  "apiVersion": "v1beta1",
  "desiredState": {
    "replicas": 2,
    "replicaSelector": {"name": "redisslave"},
    "podTemplate": {
      "desiredState": {
         "manifest": {
           "version": "v1beta1",
           "id": "redisSlaveController",
           "containers": [{
             "name": "slave",
             "image": "brendanburns/redis-slave",
             "cpu": 200,
             "ports": [{"containerPort": 6379, "hostPort": 6380}]
           }]
         }
       },
       "labels": {
         "name": "redisslave",
         "uses": "redis-master",
       }
      }},
  "labels": {"name": "redisslave"}
}
```

Enfin un dernier composant fait son apparition : les __services__. Il permettent de pointer vers les différents pods et jouent donc le rôle de proxies permettant d'orienté les requêtes en fonction de contraintes configurées. Il permettent ainsi de répartir les demandes au sein des replicas de pods.


En terme de démo, le rendu est très convaincant: Brian configure Kubernetes pour qu'il compose l'environnement de 2 instances d'un pod et en quelques secondes l'état "Démarré" de ces instances est visible dans une application qui les monitore.

Un changement du nombre de replicas plus tard (5 au lieu de 2) et en à peine plus de temps, les 5 instances sont visibles.

L'exercice se complique lorsque Brian publie une modification du pod qui pointe maintenant vers d'autres containers Docker (donc l'un contient notamment une autre application web). Kubernetes révèle là encore sa puissance : en moins d'une dizaine de secondes le rafraîchissement est effectué sur l'application de monitoring.

Pour le final, Brian tue un des process Docker dans un pod ce qui a pour conséquence de le rendre  indisponible; Kubernetes opère au bout de quelques secondes (paramétrables comme pour la mise à jour) et voilà à nouveau notre pod accessible.


Et quand cette magie sera-t-elle disponible? La réponse : Aujourd'hui en test et probablement demain pour certaines solutions car cette solution est désormais disponible dans [Google Container Engine](https://cloud.google.com/container-engine/) (disponible en version Alpha)

Le code de la solution est disponible sur le [github de Kubernetes](https://github.com/googlecloudplatform/kubernetes). Cela signifie que cette solution pourrait également voir son apparition au sein des clouds privés car il est vrai que c'est un vrai atout d'organisation, de supervision et de gestion de la haute disponibilité de nos environnements de production. Il permet d'oser rendre ses conteneurs modulaires en s'affranchissant de la complexité de surveillance et de maintenance d'un système dans un état sain.

*En aparté, Brian a développé un outil qui peut répondre à une problématique très courante dans le monde du développement et de l'intégration informatique: le suivi du cycle de vie d'un produit/logiciel sur une plateforme et surtout la gestion des versions et mises à jour. Il s'agit de [Partisci](https://briandorsey.github.io/partisci/). J'essayerai à l'avenir de faire un retour sur ce blog.*

[Vidéo de Scaling clusters declaratively with Kubernetes and Docker](https://www.youtube.com/watch?v=IR9UhW8k6Ag&index=5&list=PLuZ_sYdawLiVbxgDCmrckrzJBcMfW_ycO)
