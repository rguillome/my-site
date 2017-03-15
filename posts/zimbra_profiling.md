---
title : Profiler une JVM de Zimbra Mailbox
date : 05/09/2014
categories : Web Tools
tags : [zimbra, debug, profiling]
---

__Simple envie...__

Sur une application actuellement en production, suite à une montée de version de Zimbra CS 7 à Zimbra CS 8, nous avons constaté des temps de traitement Batch plus longs sur un WebServices Zimbra appelé en boucle pour des grosses volumétries.
L'envie nous a donc pris de voir, comment le changement de version associé à une grosse volumétrie, impactait autant le temps de traitement du webservice Zimbra. Nous sommes partis sur un profiling de JVM.

__Comment ?__

* Utilisation de JProfiler6 (certes pas tout récent mais nous avions une licence dispo sous la main pour cette version)

    Pour utiliser JProfiler (comme d'autres outil de profilage), il faut mettre un agent au niveau de la JVM. Les explications complètes sont [ici](http://resources.ej-technologies.com/jprofiler/help/doc/indexRedirect.html?http&&&resources.ej-technologies.com/jprofiler/help/doc/sessions/remoteTable.html) mais en résumé, il faut récupérer les librairies de l'agent en fonction de l'environnement et ajouter l'option suivante à la commande Java :

    ```-agentpath:/path_to_jprofiler_agent_lib```

    *Les librairies sont contenues dans le répertoire bin d'une installation de JProfiler donc si vous souhaitez profiler un JVM s'exécutant sous Linux, depuis une GUI JProfiler sous Windows, alors il vous faudra une installation de JProfiler pour Linux (x86 ou x64) en plus de l'installation Windows.*

* Configuration de la JVM Mailbox

    Il existe une option mailboxd_java_options qui permet de passer des commandes supplémentaires au daemon Mailbox.

    * Modifier les options de JVM :
    ```zmlocalconfig -e mailboxd_java_options="...."```
    * Récupérer la valeur courante :
    ```zmlocalconfig -s mailboxd_java_options```
    * Pour ajouter l'option de profilage :
    ```zmlocalconfig -e mailboxd_java_options="`zmlocalconfig -s mailboxd_java_options` -agentpath:/path_to_jprofiler_agent_lib"```

__Oui mais...__

La commande pour gérer le daemon mailbox (mailboxd) est : ```zmmailboxdctl``` ou encore ```zmcontrol``` qui lance tous les services Zimbra. Cette commande fait appel à du code C pour générer la ligne de commande d'exécution du processus Java qui correspond au daemon Zimbra Mailbox.

En lançant la commande ```zmmailboxdctl start```, on obtient l'erreur suivante (dans /var/log/zimbra.log):
```shell
zmmailboxdmgr [31715]: JVM option: -agentpath=/appli/jprofiler6/bin/linux-x64/libjprofilerti.so=nowait: not allowed
```
Finalement, en regardant le code source C du programme zmmailboxdmgr, on comprend mieux...

```C
#ifndef UNRESTRICTED_JVM_ARGS
/* Mailbox server JVM starts as root and then drops priveleges to run
* as the zimbra Unix user. Zimbra Unix user is allowed to modify JVM
* options. We preclude the Zimbra Unix user from specifying certain
* options - code that runs when root must be from files owned by root.
*/

static const char *DisallowedJVMArgs[] = {
"-Djava.class.path",
"-Djava.endorsed.dirs",
"-Djava.ext.dirs"
"-Djava.library.path",
"-Dsun.boot.class.path",
"-Dsun.boot.library.path",
"-Xbootclasspath",
"-Xrun",
"-agentlib",
"-agentpath",
"-classpath",
"-javaagent",
};
```

Et c'est utilisé ici :

``` C
for (i = nextArg; i < argc; i++) {
   if (IsAllowedJVMArg(argv[i])) {
   AddArg(argv[i]);
} else {
   syslog(LOG_ERR, "JVM option: %s: not allowed\n", argv[i]);
   exit(1);
}
```

L'explication donnée dans le code me semble quelque peu discutable, tout du moins je n'ai pas trouvé de lien entre la diminution de privilèges et le fait de lancer un agent de profiling avec agentpath notamment... De là à s'imaginer que le staff technique ne souhaite pas que l'on puisse profiler le code Java Zimbra...

__Solution (Simple) :__
Après une recherche connexe sur la configuration Zimbra, il apparait que les indications suivantes (modification du code source et recompilation ne sont pas nécessaires). Une simple utilisation de la version "unrestricted" de la commande suffit :

*(as root)*

```shell

# cd /opt/zimbra/libexec

# mv zmmailboxdmgr zmmailboxdmgr.orig
# ln -s zmmailboxdmgr.unrestricted zmmailboxdmgr
```

__Solution (si ça ne passe pas) :__

* Cloner le repository GIT [suivant](https://github.com/Grynn/zimbra-mirror.git) ou voici un zip des sources. [SOURCES modifiées](https://docs.google.com/file/d/0BxS_NuLNuFQjb3JLUEl5XzRwWWhCbHVTaHlleDZ6YTRyR01z/edit?usp=docslist_api)

Modifications apportées :

1. Suppression du mot clef __agentpath__ dans la liste des mots interdits
2. Ajout d'une variable __OPTIONS__ non présente dans les sources mais qui semble nécessaire pour notre version de production (Zimbra 8.0.6_GA) pour éviter un ```ClassNotFournException``` sur une classe de jetty-suid

Dans zmmailboxdmgr.c :

```C
...
static const char *DisallowedJVMArgs[] = {
   "-Djava.class.path",
   "-Djava.endorsed.dirs",
   "-Djava.ext.dirs"
   "-Djava.library.path",
   "-Dsun.boot.class.path",
   "-Dsun.boot.library.path",
   "-Xbootclasspath",
   "-Xrun",
   "-agentlib",
   "-javaagent",
};
#endif
...
   AddArgFmt("-Djetty.home=%s", MAILBOXD_HOME);
   AddArgFmt("-DSTART=%s/etc/start.config", MAILBOXD_HOME);
   AddArg("-jar");
   AddArgFmt("%s/start.jar", MAILBOXD_HOME);
   AddArgFmt("%s/etc/jetty.properties", MAILBOXD_HOME);
   AddArgFmt("%s/etc/jetty-setuid.xml", MAILBOXD_HOME);
   AddArgFmt("%s/etc/jetty.xml", MAILBOXD_HOME);
   AddArgFmt("OPTIONS=%s", ZIMBRA_OPTIONS);

   if (Verbose) {
...
```

Dans Makefile.c :

```C
LAUNCHER_CFLAGS = \
-DJAVA_BINARY='"$(JAVA_BINARY)"' \
-DMAILBOXD_MANAGER_PIDFILE='"$(MAILBOXD_MANAGER_PIDFILE)"' \
-DMAILBOXD_MANAGER_DEPRECATED_PIDFILE='"$(MAILBOXD_MANAGER_DEPRECATED_PIDFILE)"' \
-DMAILBOXD_JAVA_PIDFILE='"$(MAILBOXD_JAVA_PIDFILE)"' \
-DMAILBOXD_CWD='"$(MAILBOXD_CWD)"' \
-DMAILBOXD_HOME='"$(MAILBOXD_HOME)"' \
-DMAILBOXD_OUTFILE='"$(MAILBOXD_OUTFILE)"' \
-DZIMBRA_LIB='"$(ZIMBRA_LIB)"' \
-DZIMBRA_USER='"$(ZIMBRA_USER)"' \
-DZIMBRA_OPTIONS='"$(ZIMBRA_OPTIONS)"' \
-DZIMBRA_CONFIG='"$(ZIMBRA_CONFIG)"'
```
* Compiler sur l'environnement cible les sources modifiées grâce à un simple make
* Remplacer les scripts zmmailboxdmgr et zmmailboxdmgr.unrestricted par les fichiers générés dans le répertoire build
* Relancer le daemon Zimbra : zmmailboxdctl stop puis zmmailboxdctl start

Il n'y a plus qu'à profiler sur le port indiqué (par défaut avec JProfiler : 8849)
