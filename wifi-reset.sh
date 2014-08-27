#!/bin/bash
# Bring all wifi interfaces down.
# Identify wifi interfaces as rows from standard output of iwconfig (NOT standard
# error, those are non-wifi interfaces) which start without whitespace.
iwconfig 2> /dev/null | grep -o '^[[:alnum:]]\+' | while read x; do ifdown $x; done
# Bring all wifi interfaces up.
iwconfig 2> /dev/null | grep -o '^[[:alnum:]]\+' | while read x; do ifup $x; done
