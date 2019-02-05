#!/bin/sh
#
#

gitp1=myopenwrtpackages

cwd=$(pwd)

cd /srv/git
if [ ! -d $gitp1.git ]; then
	echo "Create dir $gitp1.git ..."
	sudo  -u gitdaemon mkdir -p -v $gitp1.git
fi

cd $cwd
pwd
cd ..

echo "Git clone bare ..."
rm -rdf $gitp1.git/*
git clone --bare $gitp1 

echo "Copy to local server ..."
sudo  -u gitdaemon cp -rf $gitp1.git/* /srv/git/$gitp1.git

cd $cwd
rm -rdf $gitp1.git/*

