#!/bin/bash -e
branch=($(git rev-parse --abbrev-ref HEAD))
if [ $branch == "mec_master" ]
then
        echo "Please checkout to your branch."
	    exit 0
	fi

	set -x
	git fetch --all
	git pull origin "$branch"
	git merge origin/mec_master
	git push origin "$branch"

	git diff origin/mec_master...origin/"$branch" > mydiff
