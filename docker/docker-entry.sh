#!/bin/bash

# docker actually runs this as a script after having copied it in as part of the "big initial copy" making the image...

set -e

OUTPUTDIR=/output

./cross_compile_ffmpeg.sh --build-ffmpeg-shared=y --build-ffmpeg-static=n --disable-nonfree=y --compiler-flavors=win64 --enable-gpl=y --ffmpeg-git-checkout-version=n6.1

mkdir -p $OUTPUTDIR/shared
cp -R -f ./sandbox/redist/*.7z $OUTPUTDIR/shared

if [[ -f /tmp/loop ]]; then
  echo 'sleeping forever so you can attach to this docker if desired' # without this if there's a build failure the docker exits and can't get in to tweak stuff??? :|
  sleep
fi
