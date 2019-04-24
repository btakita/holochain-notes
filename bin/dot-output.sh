#!/bin/sh
FILE=$1
DIR="$(dirname $FILE)"
NAME__FILE="$(basename $FILE)"
NAME__FILE__NOEXT="${NAME__FILE%.*}"
/usr/bin/dot -Tsvg $FILE -o"$DIR/$NAME__FILE__NOEXT.svg"
/usr/bin/dot -Tpng $FILE -o"$DIR/$NAME__FILE__NOEXT.png"