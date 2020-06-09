#!/bin/bash
# if 
LIBRARY=gem
# then all the demo programs use the installed gem
# othewise they will use sources from the lib/.

for f in demo_*.rb; do
 ./$f $LIBRARY
done
