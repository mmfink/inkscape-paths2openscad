#!/bin/bash
echo "Did you run 'make test' (Y/n)?"
read answer
test "$answer" = "n" && exit 1



echo "Determining Version:"
VERSION=$(sed -ne 's@^v\([a-z0-9\.]*\).*@\1@pi' ../paths2openscad.inx)
echo "Version is: \"$VERSION\""
name=inkscape-paths2openscad
if [ -d $name ]
then
	echo "Removing leftover files"
	rm -rf $name
fi
echo "Copying contents ..."
mkdir $name
cp ../README.md $name/README
cp ../LICENSE* $name/
cp -a ../make-includes $name/
cp ../*.py ../*.inx ../Makefile $name/


echo "****************************************************************"
echo "Ubuntu Version: For Building you must have checkinstall and dpkg"
echo "Build Ubuntu Version (Y/n)?"
read answer
if [ "$answer" != "n" ]
then
  mkdir -p deb/files
  cp -a $name/* deb/files
  (cd deb && sh ./dist.sh $name $VERSION)
fi


echo "Built packages are in distribute/out :"
ls -la out
echo "Cleaning up..."
rm -rf $name
echo "done."
