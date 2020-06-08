#!/bin/bash
LIBRARY=gem

for f in demo_*.rb; do
 ./$f $LIBRARY
done
