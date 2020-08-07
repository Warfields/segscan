#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied, need file name"
else

OutFile=$1

echo "Scan started at:" >> $OutFile
date >> $OutFile
echo "" >> $OutFile
echo "Network config:" >> $OutFile
ifconfig >> $OutFile

echo "" >> $OutFile
echo "Route info" >> $OutFile
route -n >> $OutFile

echo "Scan has started, see Masscan info below"
echo ""

echo "Any scan output is below:" >> $OutFile
masscan -c ports.conf -iL targets.txt --rate=450 >> $OutFile

echo "" >> $OutFile
echo "Scan finished at:" >> $OutFile
date >> $OutFile
fi
