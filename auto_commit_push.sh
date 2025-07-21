#!/usr/bin/env bash


REPO_DIR="/home/ivan/VScodeProjects/SevenChecker"


BRANCH="master"

cd "$REPO_DIR" || { echo "❌ Cannot cd to $REPO_DIR"; exit 1; }


git add -A


if git diff-index --quiet HEAD; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') — No changes to commit."
  exit 0
fi


git commit -m "New step in sevenchecker functionality : $(date '+%Y-%m-%d')"


git push origin "$BRANCH"
