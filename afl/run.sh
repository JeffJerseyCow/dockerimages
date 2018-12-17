#!/usr/bin/env sh
grep afl /etc/passwd
if [ $? -ne 0 ]; then
  groupadd -g $INITIALGID afl && \
  useradd -r -u $INITIALUID -g $INITIALGID -s /bin/bash afl && \
  echo "afl ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
fi

su afl
