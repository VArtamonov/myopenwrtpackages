#!/bin/sh
#
#

gitp1=myopenwrtpackages

cwd=$(pwd)

cd /srv/git
echo "Create dir $gitp1.git ..."
sudo mkdir -p -v $gitp1.git

cd $cwd
pwd
cd ..

echo "Git clone bare ..."
rm -rdf $gitp1.git/*
git clone --bare $gitp1 

echo "Copy to local server ..."
sudo cp -rf $gitp1.git/* /srv/git/$gitp1.git
