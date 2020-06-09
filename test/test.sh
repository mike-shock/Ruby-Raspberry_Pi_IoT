#!/bin/bash
# if 
LIBRARY=gem
# then all the testing programs use the installed gem
# othewise they will use sources from the lib/.

LOG=./test.txt
rm $LOG

for f in test_*.rb; do
 echo "=== $f ===============================================" >> $LOG
 ./$f $LIBRARY >> $LOG
 echo "-----------------------------------------------------------------" >> $LOG
done
grep failure $LOG

