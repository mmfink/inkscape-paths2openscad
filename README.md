paths2openscad
==============

[![Build Status](https://travis-ci.org/fablabnbg/inkscape-paths2openscad.svg?branch=master)](https://travis-ci.org/fablabnbg/inkscape-paths2openscad)

<img align="right" src="https://cloud.githubusercontent.com/assets/3838734/3856761/e55ecdf2-1efb-11e4-97f8-7c3195fc361d.png" width="200" />

Download and install from https://github.com/fablabnbg/inkscape-paths2openscad/releases


SVG paths to OpenSCAD converter. Copied from Thingiverse things [24808](http://www.thingiverse.com/thing:24808) and [25036](http://www.thingiverse.com/thing:25036), both copyright user [dnewman](http://www.thingiverse.com/dnewman) and released under GPL v2 or later.

See also: Thingiverse things [1065500](http://www.thingiverse.com/thing:1065500)  Inkscape to OpenSCAD converter v7 by Neon22.

Example for a scriptable call (untested)

inkscape --verb=EditSelectAll --verb=SelectionCombine --verb=EditDeselect --verb=command.extrude.openscad_auto.noprefs --verb=EditUndo --verb=EditUndo --verb=FileQuit /full/path/to/file.svg
