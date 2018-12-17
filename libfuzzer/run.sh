#!/usr/bin/env sh
grep libfuzzer /etc/passwd
if [ $? -ne 0 ]; then
  groupadd -g $INITIALGID libfuzzer && \
  useradd -r -u $INITIALUID -g $INITIALGID -s /bin/bash libfuzzer && \
  echo "libfuzzer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
fi

su libfuzzer
