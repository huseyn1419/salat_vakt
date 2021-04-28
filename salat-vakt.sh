#!/bin/sh

city="kutahya"

red=""
green="\033[0;32m"
color_reset="\033[0;39m"

# learn todays date in type that we want
date=$(date +%d-%m-%Y)

cd /opt/salat-vakt/city/
file="*$city*"


if [ ! -f $file ]; then
  # file location in android
  file="/sdcard/salat-vakt/*$city*.csv"
fi



# show date manually
echo "$(date '+%H:%M:%S %A %Y%m%d ')"

i=1; while [ $(($i)) -le 18 ]; do
  
  # it should not show second line, so start counting from 1
  i=$(($i + 1))
  
  # Günün hangi vaktini istiyorsun onu değişkene ata. i=1 iken imsak, i=7 iken yatsı gibi
  # 
  vakt=`grep -i "gece" $file | cut -d, -f$i`
  
  # Bugünün tarihi ile arama yaparak istediğim vakitin zamanını öğren
  # search with todays date
  time=`grep "$date" $file | cut -d, -f$i`
  
  # print
  echo "$time $vakt"

done

