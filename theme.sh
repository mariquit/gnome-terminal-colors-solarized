#!/usr/bin/env bash

dir=`dirname $0`
PROFILE=${1:-Default}
SELECTION="light dark original"
select options in $SELECTION
do
  case $options in
    light|dark)
      echo Switching to $options theme
      cp $dir/dircolors.ansi-${options} ~/.dircolors
      eval `dircolors ~/.dircolors`
      $dir/install.sh -s $options -p $PROFILE
      break
      ;;
    original)
      echo Restoring original theme
      rm -f ~/.dircolors
      break
      ;;
    *)
      echo Aborting ...
      exit
      ;;
  esac
done
echo "Done."
