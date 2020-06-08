#!/bin/bash
LIBRARY=gem
LOG=./test.txt
rm $LOG

for f in test_*.rb; do
 echo "=== $f ===============================================" >> $LOG
 ./$f $LIBRARY >> $LOG
 echo "-----------------------------------------------------------------" >> $LOG
done
grep failure $LOG

