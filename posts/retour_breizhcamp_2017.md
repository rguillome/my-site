---
title : Breizhcamp 2017
date : 25/04/2017
categories : Conference
tags : [development, breizhcamp, rennes]
---

<style type="text/css">
  img[alt=AfficheBzc2017] {
    display: block;
    margin-left: auto;
    margin-right: auto
  }

</style>

Voici un petit retour sur 2 jours passés au Breizhcamp 2017. Cette année le thème était la série [Breaking Bad](http://www.allocine.fr/series/ficheserie_gen_cserie=3517.html). Et une chose est sûre, les organisateurs ainsi que les sponsors ont vraiment jouer le jeu à fond :

![AfficheBzc2017]({{urls.media}}/retour_breizhcamp_2017/breakingcamp.png)


Plutôt que de résumer les conférences auxquelles j'ai assisté, j'ai décidé de ne présenter qu'une seule idée de chaque session. Ca permettra une lecture rapide et un équilibre de feedback entre toutes les conférences :

__Les problèmes que l’on rencontre en microservice : configuration, authentification et autre joyeusetés__ - [Quentin Adam](https://twitter.com/waxzce)

> Pour l'authentification de vos services mangez des [Macaroons](http://hackingdistributed.com/2014/05/16/macaroons-are-better-than-cookies/) c'est bien meilleurs que des cookies

__Retour d'expérience: le déploiement continu chez Expedia__ - [Guillaume Scheibel](https://twitter.com/g_scheibel)
    
> Utiliser le SHA1 des commit GIT dans ses logs pour tracer la version d'une feature. (_Utile pour de l'AB testing par exemple_)

__Construire et automatiser l'ecosystème de son SaaS grâce à une spécification Swagger__ - [Francois-Guillaume Ribreau](https://twitter.com/FGRibreau)
    
> Générer toutes ses librairies clientes dans tous les langages pour vos API avec Swagger, ok : mais prévoir du rewrite manuel sur celles qui ciblent vos utilisateurs récurrents

__Premiers pas en Deep Learning avec Keras__ - [Manuel Verriez](https://twitter.com/mverriez)
   
> Si Tensor Flow est un peu trop bas niveau au début, utilisez Keras qui propose une API efficace et bien structurée pour entrainer et exécuter vos algorithmes de Deep Learning

__Je vois avec mes yeux__ - [Jeff Abrahamson](https://twitter.com/Jeff_Abrahamson)

> Même avec des copies d'écrans au 1/1000ième couplées à une reconnaissance de texte sur le nom de ses fenêtres de travail, on peut analyser et anticiper son comportement de travail. Imaginez ce que la NSA fait avec nos données perso :)

__Comment ça marche systemd déjà__ ? - [Quentin Adam](https://twitter.com/waxzce)

> Initd est un gestionnaire de service dont le code repose uniquement sur des scripts Bash qui contiennent notamment les conventions de la CLI. Systemd utilise, lui, des fichiers de configuration bien documentés et structurés qui n'empêchent en rien d'y ajouter des scripts pour les extensions ponctuelles ...

__Le test d’intrusion Red Team : digne successeur de l’audit de sécurité ?__ - [Clément Michel](@clement_michel)

> ReadTeam : Une équipe de choc en mode hidden qui tente de pénétrer votre réseau pendant 6 mois à 1 an, ça permet d'efficacement colmater les brèches mais cela n'évitera pas un audit traditionnel pour définir la stratégie long terme de votre politique SSI

__Keynote "Qui veut gagner une carrière de développeur"__ - [Jean-François Garreau](@jefbinomed) [Thomas Gx](@ThomasGX)

> Les développeurs sont mal payés et infine c'est toujours le CTO qui décide. 

> _Désolé ça fait 2 idées mais je n'arrivais vraiment pas à choisir (ndlr)_ 

__Keynote "Comment les logiciels pourrissent ma vie et pourraient la faciliter"__ - [Antonin Le Mée](@antoninlemee)

> Ne jamais croire que son expérience personnelle, ses connaissances et ses a priori permettent de comprendre et de définir la diversité du monde qui nous entoure. De là, ajouter des contraintes dans son dev si ce n'est pas impératif, c'est littéralement... comment ils disent déjà ? overkill !

__Smartphone et blockchain, armes de révolution massive__ - [Guillaume Nicolas](@GuiillaumeN) et [Damien Lecan](@dlecan)

> Ne rajoutez pas d'intermédiaire entre vous et la blockchain : seul un noeud de blockchain embarqué dans un téléphone mobile est digne de confiance car c'est le vôtre !

__Sinon, quoi de neuf côté Apache Groovy__ ? - [Guillaume Laforge](@glaforge) et [Cédric Champeau](@CedricChampeau)

> Grâce aux macros vous pouvez désormais écrire plus facile des instructions de compilation pour AST sans avoir à utiliser le modèle objet de l'arbre syntaxique

__Quand Internet sera gouvernée par les \|chats> de Shrödinger__ - [Nicolas De Loof](@ndeloof)

> `$ |\Psi(t)> $` ... et puis il y avait 42 chats mais on ne savait jamais précisément où ils étaient ou n'étaient pas ...

__Introduction à Unikernel__ - [Tomas Rodriguez](@rstomasalberto) et [Jean-Baptiste Claramonte](@jbclaramonte)

> Unikernel sera peut-être le futur des conteneurs : avantages d'isolation d'une VM avec la légèreté et le "just what I need" d'un conteneur

__Ici le commandant de bord, on passe en mode avion !__ - [Olivier Leplus](@olivierleplus) et [Wassim Chegham](@manekinekko)

> L'API sync permet de contrôler ce qui peut être fait lorsque l'on récupère la connexion, complétée par une local database, c'est l'outil privilégié pour une expérience offline sans avoir besoin de sauter en vol !

__Automatiser la gestion de vos environnements avec Ansible__ - [Fabien PAITRY](@FabienPaitry)

> Ansible est plus simple à prendre en main que Puppet et fonctionne sans agent ce qui simplifie son intégration dans les infrastructures actuelles 

Je complèterai par une idée majeure qui est valable pour le BreizhCamp mais aussi pour d'autres évènements de développeurs auxquels j'ai pu participer tels que le DevFest. Il s'agit de la __bienveillance générale__ qui reigne dans ces confs : chacun peut échanger, essayer, proposer, se tromper, réussir et tout ça toujours dans une bonne ambiance et avec un soutien général des participants, speakers et organisateurs.
Et si un conflit survient, il se transforme par la suite en une belle leçon de savoir-vivre, d'humilité et d'humanité. Il faut apprendre à évoluer avec les autres.


                                    
<div align="center">Merci et bravo Breizhcamp !</div>