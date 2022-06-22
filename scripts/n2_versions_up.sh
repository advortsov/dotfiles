#!/bin/bash

function exists_in_list() {
    LIST=$1
    DELIMITER=$2
    VALUE=$3
    LIST_WHITESPACES=$(echo "$LIST" | tr "$DELIMITER" " ")
    for x in $LIST_WHITESPACES; do
        if [ "$x" = "$VALUE" ]; then
            return 0
        fi
    done
    return 1
}

altair_projects="user-profiles-service moonpay-top-up-service tx-metadata-service account-monitoring-service error-handler-module exchange-rates-service limits-service oxy-light-integration-service peer-discovery-service pending-txs-service solana-assisted-accounts-service solana-assisted-transactions-service solana-liveness-service solana-token-metadata-service solana-tx-delivery-service user-consents-service public-api-service template-service"

if ! exists_in_list "$altair_projects" " " "${PWD##*/}"; then
    echo "${PWD##*/} not in altair_projects list. Skip it."
    exit 0
fi

args=("$@")
git fetch &&
git stash -q &&
git checkout -B temp origin/main &&
git branch -D up_versions &>/dev/null || true &&
git branch -D origin/up_versions &>/dev/null || true &&
git checkout -b up_versions origin/main &&
git branch -D temp &>/dev/null || true &&
for ((i=0; i < $#; i=i+2))
{
   VERSION_NAME=${args[$i]}
   VERSION_VALUE=${args[$i+1]}
   commit_msg=$commit_msg'up '$VERSION_NAME' to '$VERSION_VALUE'. '
   echo "$commit_msg"
   find . -type f -name "*build\.gradle\.kts*" -exec sed  -i '' -e 's/\('"$VERSION_NAME"'\:\).*\(")\)/'"$VERSION_NAME"':'"$VERSION_VALUE"'\"\)/g' {} +
}
if ! [[ $(git status --porcelain) ]]; then
  echo 'Nothing was updated'
  exit 0
fi
# gradle build &&
git ac "$commit_msg" &&
git push -f origin up_versions

# example:
#for d in */ ; do
#    cd "$d" && ~/dotfiles/scripts/n2_versions_up.sh error-handler-starter 0.0.16 ; cd ..
#done

#curl -u a_dvortsov:psss +X GET 'http://192.168.10.77:3000/vtb-omnichannel/demo-app/compare/release/10.1...feature/up_versions_19-02-2021-20-43-10'

#error-handler-starter:0.0.13")

# find . -type f -name "*build\.gradle\.kts*" -exec sed -i 's/\(error-handler-starter\:\).*\(")\)/error-handler-starter:0.0.13\"\)/g' {} +