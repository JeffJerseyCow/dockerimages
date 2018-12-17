#!/usr/bin/env sh
grep debug /etc/passwd
if [ $? -ne 0 ]; then
  groupadd -g $INITIALGID debug && \
  useradd -r -u $INITIALUID -g $INITIALGID -s /bin/bash debug && \
  echo "debug ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
fi

su debug
