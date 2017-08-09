#! /bin/bash
# Make a debian/ubuntu distribution

name=$1
vers=$2
url=http://github.com/fablabnbg/inkscape-paths2openscad
requires="openscad, cura | bash"

tmp=../out

[ -d $tmp ] && rm -rf $tmp/*.deb
mkdir $tmp
cp description-pak files
cd files
fakeroot checkinstall --fstrans --reset-uid --type debian \
  --install=no -y --pkgname $name --pkgversion $vers --pkgrelease 2 --arch all \
  --pkglicense CC-BY-SA-3.0 --pkggroup other --pakdir ../$tmp --pkgsource $url \
  --pkgaltsource "http://fablab-nuernberg.de" \
  --maintainer "'Juergen Weigert (juergen@fabmail.org)'" \
  --requires "'$requires'" make install \
  -e PREFIX=/usr || { echo "error"; exit 1; }

test -f ../$tmp/*.deb && dpkg-deb -c ../$tmp/*.deb

