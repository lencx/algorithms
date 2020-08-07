#!/bin/sh

####### Generate Files #######
# @author: lencx            #
# @create_at: Aug 07, 2020  #
#############################

ROOT_DIR=src
FILES_EXT=(".md" ".js" ".go" ".rs" ".c")
CREATE_AT=$( LANG=en_us_88591; date '+%b %d, %Y' )

args1=$1

ca1_1=${args1:0:2}
ca1_2=${args1:3}

# help
usage(){
  echo "USAGE: ./bin/new.sh [-ahl] directory_name
  -h:   help
  -a:   default all languages(main.js, main.rs) and README.md
  -l:   single language and README.md(if 'README.md' does not exist).
        example: ./bin/new.sh -l=js testName"
  exit 1
}

if [ ! $1 ];then
  usage
elif [ $ca1_1 == "-h" ];then
  usage
elif [ $ca1_1 == "-a" ];then
  dirName=$ROOT_DIR/$2
elif [ $ca1_1 == "-l" ];then
  dirName=$ROOT_DIR/$2
else
  dirName=$ROOT_DIR/$1
fi

mkdir -p $dirName

if [ $ca1_2 ];then
  echo "" >> $dirName/main.$ca1_2
  exit 0
fi

for i in ${FILES_EXT[@]}
do
  # Check if the file exists, exit if it exists
  if [ -f $dirName/main$i ];then
    echo "❗️exists: $dirName/main$i"
    continue
  fi

  # create 'README.md' file
  if [[(! -f $dirName/README$i) && ($i == ".md")]];then
    echo "# $1" >> $dirName/README$i
  fi

  # create 'main.js' file
  if [ $i == ".js" ];then
    echo "/*
 * @author: lencx
 * @create_at: $CREATE_AT
 */
" >> $dirName/main$i
  fi

  # create 'main.rs' file
  if [ $i == ".rs" ];then
    echo "// @author: lencx
// @create_at: $CREATE_AT
" >> $dirName/main$i
  fi
done

echo "✨Done!"
