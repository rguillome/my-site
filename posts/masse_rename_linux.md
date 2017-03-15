---
title : Renommer en masse des fichiers (Linux)
date : 03/04/2015
categories : Web tools
tags : [linux, file]
---
Dans les projets auxquels je participe, j'ai souvent besoin de renommer des fichiers en masse; en remplaçant une sous-chaine fixe du nom de fichier par une autre et ce sur plusieurs fichiers d'un répertoire à la fois.

Voici un script shell qui me permet d'effectuer ces opérations:

``` shell
#!/bin/sh
# RSLOF : Replace Substring in List of FileNames
#
# @author : @RGuillome
# @args :
#  - 1 : substring to replace
#   - 2 : replace by...

if [ $# -le 2 ];
 then echo "Usage : rslof [SUBSTRING_TO_REPLACE] [SUBSTRING_REPLACEMENT]"
fi

substring_to_replace=$1
substring_replacement=$2


echo "Replacement of $1 by $2"

for i in `ls *$substring_to_replace*`
do
 new_name=$(echo "${i/$substring_to_replace/$substring_replacement}")
 echo "$i name will be replaced by $new_name"
 mv $i $new_name
done
```
