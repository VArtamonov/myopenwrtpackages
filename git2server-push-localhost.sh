#!/bin/sh
#
#
#

echo "Start ..."
pwd

echo "FEED update mypackages ..."

# вывод времени
time_now=$(date  "+%Y.%m.%d %H:%M:%S")
echo $time_now
my_commit="Commit "
git add .
git commit -a -S -m 'Commit '
git push localserver

echo "End ..."
