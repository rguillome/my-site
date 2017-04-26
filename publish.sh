#!/bin/sh
# Script to publish in a working directory of a github.io clone repository
# Because ruhoh compile make a rm on the target directory, it will use a tmp dir to keep the .git
# intact



if [ $# -lt 1 ]; then
    echo "usage : publish [TargetDir]";
    exit 1;
fi

CURRENT_DIR=$(pwd)
TARGET_DIR=$1
TMP_DIR='/tmp/rguillome-github-io'

find $TARGET_DIR -maxdepth 1 -mindepth 1 -not -name .git -exec rm -rf {} \;

bundle exec ruhoh compile $TMP_DIR;

cp -R $TMP_DIR/* $1;

cd $1;
git add .;
git commit -m "Publication le `date +%Y%M%d_%H%m%S`";
git push;

cd $CURRENT_DIR;