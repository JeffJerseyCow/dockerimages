#!/usr/bin/env sh
if [ -f /in/build.sh ]; then
  cp -r /in/* /fuzz/
  chmod +rx build.sh
  ./build.sh
  ./fuzz.me -artifact_prefix=/artifacts/ /corpus
else
  echo "- Please mount a volume containing a 'build.sh' file"
fi
