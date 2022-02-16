#!/bin/sh

#======================================
# version
version="0.0.1"

# author: huseyn ozdemir <huseyinozdemir1419@gmail.com>
#======================================



#======================================
# settings

# change here, folder that containts files (tr: vakit dosyalarının bulunduğu klasör)
folder="change_here"
# examples
# folder="/sdcard/data/salat_vakt/city"
# folder="/usr/local/share/salat_vakt/city #it works on android too

# change here, city name in ascii
city="change_here"
# examples
# city="kutahya"
#======================================



#======================================
# functions

main() {
  # learn todays date in type that we want
  date=$(date +%d-%m-%Y)

  file="$folder/*$city*"

  if [ ! -f $file ]; then
    # file location in android
    file="/sdcard/salat-vakt/*$city*"
  fi

  # show city name
  head -n 1 $file

  # show date manually
  echo "$(date '+%H.%M.%S %A %Y.%m.%d ')"

  i=1; while [ $(($i)) -le 18 ]; do
    # it should not show second line, so add 1
    i=$(($i + 1))
    
    # günün hangi vaktini istiyorsun onu değişkene ata. i=1 iken imsak, i=7 iken yatsı gibi
    # 
    vakt=`grep -i "gece" $file | cut -d, -f$i`
    
    # bugünün tarihi ile arama yaparak istediğim vaktin zamanını öğren
    # search with todays date
    time=`grep $date $file | cut -d, -f$i`
    
    # print
    echo $time $vakt
  done
}
#======================================



# run the program
main

