#!/usr/bin/env sh
grep ikos /etc/passwd
if [ $? -ne 0 ]; then
  groupadd -g $INITIALGID ikos && \
  useradd -r -u $INITIALUID -g $INITIALGID -s /bin/bash ikos && \
  echo "ikos ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
fi

su ikos
