#!/bin/bash -e
IFS='_' read -r -a array <<< "$1"
branch="$1"
issue=${array[1]}
date=${array[2]}

if [[ (${#issue} = 4) && ${#date} = 8 ]]
then
    set -x

    current_branch=($(git rev-parse --abbrev-ref HEAD))
    if [ $current_branch != "$branch" ]
    then
        git checkout "$branch"
    fi
    git fetch --all
    git pull origin "$branch"
    git merge --ff-only origin/mec_master
    git push origin "$branch"

    git checkout mec_master

    git tag "$branch"_BEFORE_MERGE mec_master
    git push origin "$branch"_BEFORE_MERGE

    git merge --ff-only --no-edit origin/"$branch"
    git push origin mec_master

    git tag "$branch"_AFTER_MERGE mec_master
    git push origin "$branch"_AFTER_MERGE
else
    echo "Invalid branch format."
    exit 0
fi
