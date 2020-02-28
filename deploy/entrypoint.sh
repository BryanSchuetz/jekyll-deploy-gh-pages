#!/bin/sh

set -e

cd build
remote_repo="https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
remote_branch="gh-pages"
git init
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
echo -n 'Files to Commit:' && ls -l | wc -l
git commit -m'action build' > /dev/null
git push --force $remote_repo master:$remote_branch > /dev/null
rm -fr .git
cd ../
echo '👍 GREAT SUCCESS!'
