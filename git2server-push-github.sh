#!/bin/sh
#
#
#

echo "Start ..."
pwd

echo "FEED update mypackages ..."

# вывод времени
time_now=$(date  "+%Y.%m.%d %H:%M:%S")
my_commit="Commit at "
commit1=$my_commit$time_now
echo $commit1

git add .
git commit -a -S -m "$commit1"

git push --force

echo "End ..."
