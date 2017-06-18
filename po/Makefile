#
# vim:set noexpandtab
# Makefile for the translation process
# See also: https://gitlab.com/inkscape/inkscape/blob/master/po/CMakeLists.txt
#
# Requires: apt-get install intltool 

NAME=paths2openscad

.PHONY: all
all: extract merge

Makevars:
	echo >  $@ 'DOMAIN = $(NAME)'
	echo >> $@ 'subdir = po'
	echo >> $@ 'top_builddir = ..'
	echo >> $@ 'XGETTEXT_OPTIONS = --keyword=_ --keyword=N_ --keyword=Q_ --keyword=C_:1c,2 --keyword=NC_:1c,2 --msgid-bugs-address=juergen@fabmail.org'
	echo >> $@ 'COPYRIGHT_HOLDER = Juergen Weigert <juergen@fabmail.org>'

POTFILES.in:
	echo >  $@ '# genterated by make POTFILES.in'
	echo >> $@ '[encoding: UTF-8]'
	echo >> $@ "$(NAME).py"
	echo >> $@ "[type: gettext/xml] $(NAME).inx"


.PHONY: extract
extract: POTFILES.in Makevars
	@echo "Expect a complaint about a 'filename containing newline' below:"
	intltool-update --pot --verbose

.PHONY: merge
merge: de.po
	mkdir -p merged; 
	cd merged; intltool-merge -x -m .. ../../$(NAME).inx inx
	# Postprocessing of localized inx files:
	# * the spacer comment gets stripped. It is essential for the spacer. put it back.
	# * the id needs to change, so that we have separate menu entries.
	cd merged; for lang in *; do sed -e 's|name="spacer"/>|name="spacer"><!-- --></param>|' -e "s|openscad</id>|openscad.$$lang</id>|" < $$lang/inx > ../../paths2openscad-$$lang.inx; done
	rm -rf merged

.PHONY: clean
clean:
	rm -rf *.pot merged
