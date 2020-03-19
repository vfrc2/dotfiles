#!/bin/bash

RCRC=./rcrc

: ${GITHUB_REF:=ref/snapshot}
VERSION=$(basename $GITHUB_REF)

DIRNAME=$(dirname $(readlink -f $0))
HOMEDIR=${HOME}

echo Version $VERSION
echo ': ${HOMEDIR:=$HOME}' > INSTALL.sh

RCRC=$DIRNAME/rcrc
rcup -g -B 0 -d $DIRNAME >> INSTALL.sh
sed -i "s#$DIRNAME#.#g" INSTALL.sh
sed -i "s#$HOMEDIR#\$HOMEDIR#g" INSTALL.sh
sed -i "s/handle_file_ln[^(]/handle_file_cp /g" INSTALL.sh

chmod a+x INSTALL.sh

rm -r build/ 
mkdir build/
cd build/

ARTIFACT=release-$VERSION.tar.gz

tar -czvf $ARTIFACT \
--exclude .git \
--exclude .gitignore \
--exclude .history \
--exclude .github  \
--exclude README.md --exclude BUILD.sh \
--exclude $ARTIFACT \
../



