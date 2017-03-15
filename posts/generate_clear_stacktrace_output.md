---
title : Sortie lisible d'une stacktrace d'exception en Java
date : 25/06/2015
categories : Java Dev
tags : [java, stacktrace, stream, java8]
---

Java 8 apporte son lot de nouveautés notamment les Stream. Le but n'étant pas de fournir un cours ou une analyse sur les Stream, il en existe de très bons tel que [celui-ci](http://blog.ippon.fr/2014/03/17/api-stream-une-nouvelle-facon-de-gerer-les-collections-en-java-8/) sur le blog d'Ippon, mais de fournir des astuces sur des problèmes récurrents dans le développement d'application Java.


__Afficher une Stack d'exception sous forme lisible :__

``` Java
try{

...

} catch (MonException ex) {
    List<StackTraceElement> listStackLine = Arrays.asList(e.getStackTrace());
    String stack = listStackLine.stream().map(StackTraceElement::toString)
                    .collect(Collectors.joining("\n"));
    fail("Exception reçue : "+e.getMessage()+" avec la stack "+stack);
}

```

__Explications :__

1. Ligne  6 : récupération du tableau de String dans l'exception et transformation en String
2. Ligne 7 : utilisation d'une stream puis application d'une méthode de transformation pour ne garder que le résultat de la méthode "toString" de la classe StackTraceElement et utilisation d'une méthode de collecte qui joint les éléments de la liste par un retour chariot.


_Cela peut être utile pour l'inclure dans un log, un résultat de TU ou un fichier de rapport par exemple._
