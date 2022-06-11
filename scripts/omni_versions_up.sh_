#!/bin/bash

args=("$@")
git fetch &&
git stash -q &&
git branch -d feature/up_versions &>/dev/null &&
git checkout -b feature/up_versions origin/release/10.1 &&
for ((i=0; i < $#; i=i+2))
{
   VERSION_NAME=${args[$i]}
   VERSION_VALUE=${args[$i+1]}
   commit_msg=$commit_msg'up '$VERSION_NAME' to '$VERSION_VALUE'. '
   find . -type f -name "*pom*" -exec sed -i 's/\(<'$VERSION_NAME'>\).*\(<\/'$VERSION_NAME'>\)/<'$VERSION_NAME'>'$VERSION_VALUE'<\/'$VERSION_NAME'>/g' {} +
}
mvn clean install &&
git ac "$commit_msg" &&
git pc
#curl -u a_dvortsov:psss +X GET 'http://192.168.10.77:3000/vtb-omnichannel/demo-app/compare/release/10.1...feature/up_versions_19-02-2021-20-43-10'