#!/bin/bash

args=("$@")
git fetch https &&
git stash -q &&
git checkout -B https/main &&
git branch -d up_versions &>/dev/null || true &&
git branch -d https/up_versions &>/dev/null || true &&
git checkout -b up_versions https/main &&
for ((i=0; i < $#; i=i+2))
{
   VERSION_NAME=${args[$i]}
   VERSION_VALUE=${args[$i+1]}
   commit_msg=$commit_msg'up '$VERSION_NAME' to '$VERSION_VALUE'. '
   echo "$commit_msg"
   find . -type f -name "*build\.gradle\.kts*" -exec sed -i 's/\('$VERSION_NAME'\:\).*\(")\)/'$VERSION_NAME':'$VERSION_VALUE'\"\)/g' {} +
}
# gradle build &&
git ac "$commit_msg" &&
git push -f https up_versions


#curl -u a_dvortsov:psss +X GET 'http://192.168.10.77:3000/vtb-omnichannel/demo-app/compare/release/10.1...feature/up_versions_19-02-2021-20-43-10'

#error-handler-starter:0.0.13")

# find . -type f -name "*build\.gradle\.kts*" -exec sed -i 's/\(error-handler-starter\:\).*\(")\)/error-handler-starter:0.0.13\"\)/g' {} +