#!/bin/bash

NUMBER_OF_FILES=`ls -1 sum_*_Linux_x86_64_*.tar.gz 2> /dev/null | wc -l`

if [ "$NUMBER_OF_FILES" == "0" ]
then
	echo "There are no Supermicro Update Manager packages in this directory."
	echo "Please go to https://www.supermicro.com/solutions/SMS_SUM.cfm to download the _x64_ .tar.gz file and try again."
	exit
fi


if [ "$NUMBER_OF_FILES" != "1" ]
then
	echo "There are multiple Supermicro Update Manager packages in this directory."
	echo "Please remove old .tar.gz files and try again."
	exit
fi

VERSION=`ls sum_*_Linux_x86_64_*.tar.gz | sed -r 's/sum_(.*)_Linux_x86_64_(.*)\.tar\.gz/\1.\2/'`

cp debian/changelog.dist debian/changelog

dch -v $VERSION-1 -m "New upstream version" -D stable
