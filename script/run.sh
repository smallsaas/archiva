#!/usr/bin/env bash
## Java JDK 8 +U131 Solution
#  -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
# JAVA_OPTIONS="Xms300m"

webapps=/webapps

cd $webapps

if [ ! -d ./apache-archiva ];then
    cp -r /usr/tmp/apache-archiva ./apache-archiva
fi

cd apache-archiva
./bin/archiva console
