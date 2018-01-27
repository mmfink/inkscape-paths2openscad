#!/bin/bash


echo "Determining Version:"
VERSION=$(sed -ne 's@^v\([a-z0-9\.]*\).*@\1@pi' ../paths2openscad.inx)
echo "Version is: \"$VERSION\""
name=inkscape-paths2openscad

inx_basenames="paths2openscad"                  # we pack all inx_basenames in each locale
inx_locales=".inx -de.inx"                      # we generate one package per inx_locale

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



echo "Did you run 'make test' (Y/n)?"
read answer
test "$answer" = "n" && exit 1
echo "****************************************************************"
echo "Ubuntu Version: For Building you must have checkinstall and dpkg"
echo "Build Ubuntu Version (Y/n)?"
read answer
if [ "$answer" != "n" ]
then
  rm -f out/*.deb
  mkdir -p deb/files
  cp -a $name/* deb/files
  for inx in $inx_locales; do
    rm -f deb/files/*.inx
    for base in $inx_basenames; do
      cp $name/$base$inx deb/files
    done
    pkgname=$(basename $name$inx .inx)
    (cd deb && sh ./dist.sh $pkgname $VERSION)
  done
fi


echo "Built packages are in distribute/out :"
ls -la out
echo "Cleaning up..."
rm -rf $name
echo "done."
