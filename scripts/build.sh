#!/usr/bin/env bash
###
 # @Description:
 # @Version: 2.0
 # @Autor: mayako
 # @Date: 2020-05-29 14:27:16
 # @LastEditors: mayako
 # @LastEditTime: 2020-06-28 14:44:04
###

#cd path && install modules
install() {
  path=$1
  NV=$2
  cd $path
  nvm use $NV
  yarn
  echo "$path env installed"
}

DEFAULT="12.18.1"
SELECT="webpack-3"
if [ "$1" = "" ]
then
  SELECT='webpack-3'
else
  SELECT=$1
fi

echo $(pwd)
CURRENT_NODE=$(node --version)
nvm use $DEFAULT
yarn
node ./node_modules/husky/bin/install

cd env
CRTDIR=$(pwd)
for file in $(ls $CRTDIR); do
  if test -d $file; then
    NV="8.17.0"
    case $file in
    "webpack-1")
      NV="8.17.0"
      ;;
    "webpack-2")
      NV="8.17.0"
      ;;
    "webpack-3")
      NV="8.17.0"
      ;;
    "webpack-4")
      NV="12.18.1"
      ;;
    "webpack-5")
      NV="12.18.1"
      ;;
    *)
      NV="8.17.0"
      ;;
    esac
    install $file $NV
    cd ..
  fi
done

cd ..
node scripts/select-env "$SELECT"
nvm use "$CURRENT_NODE";

