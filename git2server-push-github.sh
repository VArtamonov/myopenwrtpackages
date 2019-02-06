#!/bin/sh
#
#
#

echo "Start ..."
pwd

echo "FEED update mypackages ..."

git add .
git commit -a -S -m 'Commit '
git push --force

echo "End ..."
