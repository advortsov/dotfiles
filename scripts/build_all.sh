#!/bin/bash

for d in */ ; do
    cd "$d"
    mvn clean install
    cd ..
done

