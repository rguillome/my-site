---
title : Lecture d'une stacktrace en Java
date : 08/01/2015
categories : Java Dev
tags : [java, stacktrace]
---

Cet article présente quelques informations intéressantes pour lire une stacktrace lors du log d'une exception par exemple.


Tout d'abord, un petit rappel sur la lecture d'une trace d'exception : il s'agit du cheminement d'exécution du programme jusqu'à l'erreur survenue. Une trace de pile (stack trace) et donc le dernier élément survenu est toujours le premier récupéré par les logs et on remonte la chronologie en lisant la trace par le bas.


Dans le cas où l'exception est la conséquence d'autres exceptions indiquées par le code en tant que cause, des cause by... permettront de retracer l'origine de l'erreur. Il faut donc dans ce cas, se focaliser sur ce point.


La trace, en plus d'indiquer le type d'exception survenue, complètera par des informations sur la signature de la méthode dans laquelle l'erreur est survenue: Le nom canonique de la classe et le nom de la méthode ainsi que les paramètres d'appel et le paramètre de retour.


On aura donc une trace de la forme :
```[package].[className].[methodName]([parametersIn])[parameterOut]```

Par exemple :

```java
org.springframework.cache.annotation.CacheAnnotationParser.
                  parseCacheAnnotations(Ljava/lang/reflect/AnnotatedElement;)Ljava/util/Collection;
```


Les arguments ont une notation particulière comme on peut le voir dans l'exemple.


Chaque argument est donc présenté de cette forme :
```[Type][(optional)[package].[className]];```

Où Type sera :

* L dans le cas d'une classe ou une interface  
* Z pour pour un boolean
* B pour un byte
* C pour un char 
* D pour un double
* F pour un float
* I pour un int
* J pour un long
* S pour un short