#
# vim:set noexpandtab
# Makefile for the translation process
# See also: https://gitlab.com/inkscape/inkscape/blob/master/po/CMakeLists.txt
#
# Requires: apt-get install intltool 

NAME=paths2openscad

.PHONY: all
all: extract

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

.PHONY: clean
clean:
	rm -f *.pot
