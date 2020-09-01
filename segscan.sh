#!/bin/bash



if [ ! -f "targets.txt" ]; then
  echo "targets.txt doesnt exist, please create a targets.txt file with the targets of the scan"
fi

if [ ! -f "ports.conf" ]; then
  echo "ports.conf doesnt exist, please create a ports.conf file with the masscan configuration"
fi

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
echo "" >> $OutFile

echo "Masscan config file is:"
cat ports.conf >> $OutFile
echo "" >> $OutFile

echo "Targets Scanned are:"
cat targets.txt >> $OutFile
echo "" >> $OutFile

echo "Any scan output is below:" >> $OutFile
masscan -c ports.conf -iL targets.txt --rate=450 >> $OutFile

echo "" >> $OutFile
echo "Scan finished at:" >> $OutFile
date >> $OutFile
fi
