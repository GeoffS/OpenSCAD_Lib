# Geoff's OpenSCAD Library (OpenSCAD_Lib)

## Overview
This is a library I've developed to support my idiosyncratic OpenSCAD development 
style. It's required to build most of my other OpenSCAD projects.

## Build Tools
`makeStls.py`

## `include` Files

### MakeInclude.scad
This file contains:
* Definitions needed by `MakeInclude_template.scad`.
* Varrious misc. common items (ex. `mm = 25.4`).
* The definitions needed to use the `makeStls.py` script.
### chamferedCylinders.scad
### torus.scad
### threads.scad
    Dan Kirshner's threads library version 2.3

### Hardware.scad