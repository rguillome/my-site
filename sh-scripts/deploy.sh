#!/bin/sh
# Script to deploy a ruhoh built site into a cloned githubio directory
# Because ruhoh compile make a rm on the target directory, it will use a tmp dir to keep the .git
# intact



if [ $# -lt 2 ]; then
    echo "usage : deploy [BUILD_DIR] [TARGET_DIR]";
    exit 1;
fi

BUILD_DIR=$1
TARGET_DIR=$2

find $TARGET_DIR -maxdepth 1 -mindepth 1 -not -name .git -not -name CNAME -exec rm -rf {} \;

cp -R $BUILD_DIR/* $TARGET_DIR;

cd $1;
git add .;
git commit -m "Publication `date +%Y%M%d_%H%m%S`";
git push;

