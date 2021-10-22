#!/usr/bin/env bash
set -euo pipefail

branches=$(git branch --format "%(refname:lstrip=2)" | \
    grep -v ^master$ | grep -v ^main$ | \
    fzf --layout reverse --tac --no-sort --multi --cycle --border --marker='*' --preview="git show {} | bat --color=always --style=plain")


echo "The following branches will be deleted"
echo $branches

read -p "Continue (y/n)? " CONT
if [[ $CONT =~ ^[Yy]$ ]]
then
    git branch -D $branches
    echo done
else
    echo "Aborted"
fi
