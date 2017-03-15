---
title : Réinstaller automatiquement des applications Android via APK sous Linux
date : 25/02/2017
categories : Mobility
tags : [android, apk, linux]
---

J'ai été confronté à une problématique : réinstaller une liste d'applications Android à partir d'APKs en contournant les problématiques de conflits de version, downgrade etc.

Les étapes, pour chaque application que l'on souhaite réinstaller, sont successivement :

1. Désinstallation via AAPT
2. Installation à partir de l'APK via ADB


Le tout nécessite :

* Linux
* Android Asset Packaging Tool ([aapt](http://www.elinux.org/Android_aapt))
* Android Device Bridge ([adb](https://developer.android.com/studio/command-line/adb.html))
* Un répertoire qui contient toutes les APKs

La contrainte principale :

* Pour la désintallation, il est nécessaire de connaître le nom de l'application installée dans le device. Pour cela, on va utiliser le "package name" du manifest AndroidManifest.xml. Il faut donc que dans l'APK à réinstaller, le nom soit identique, sinon le device contiendra toujours l'ancienne version de l'application


Le script, à exécuter à partir du répertoire contenant tous les APKs, est donc :

``` shell
#!/bin/sh
# @author : @RGuillome

for i in `ls *.apk`
do

    PACKAGE_NAME=`aapt dump badging $i | grep package:\ name | awk -F'[/=]' '{print $2}' | awk '{print $1}' | sed  "s/'//g"`;
    echo "Uninstall package : $PACKAGE_NAME";
    adb uninstall $PACKAGE_NAME;

    echo "Installation de $i";
    adb install -r -d $i;
done
```
