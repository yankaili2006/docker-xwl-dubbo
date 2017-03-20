#!/bin/bash

set -x

APP=xwl-dubbo
VERSION=1.0-SNAPSHOT
JAR=$APP-$VERSION-jar-with-dependencies.jar

JAR_PATH=$(curl "http://101.200.176.31:8082/nexus/service/local/artifact/maven/resolve?r=snapshots&g=com.xunwulian&a=$APP&v=$VERSION&c=jar-with-dependencies" | grep repositoryPath | sed 's/\s*<[^>]*>//g')

NEXUS="http://101.200.176.31:8082/nexus/content/repositories/snapshots/$JAR_PATH"

wget $NEXUS -O $JAR

mv $JAR app.jar

#java -jar $JAR | tee log.txt
