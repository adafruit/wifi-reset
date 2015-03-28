#!/bin/bash

# Identify wifi interfaces as rows from standard output of iwconfig (NOT standard
# error, those are non-wifi interfaces) which start without whitespace.

# Wait ~60 seconds until SOME interface exists; then timeout so as not to repeat indefinitely
while [ -z $(iwconfig 2> /dev/null | grep -o '^[[:alnum:]]\+') ]; do echo NO wireless interface yet defined; sleep 1; done

# Bring all wifi interfaces down.
iwconfig 2> /dev/null | grep -o '^[[:alnum:]]\+' | while read x; do ifdown $x; done

# Bring all wifi interfaces up.
iwconfig 2> /dev/null | grep -o '^[[:alnum:]]\+' | while read x; do ifup $x; done
