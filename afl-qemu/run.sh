#!/usr/bin/env sh
grep $INITIALUSER /etc/passwd
if [ $? -ne 0 ]; then
  groupadd -g $INITIALGID $INITIALUSER && \
  useradd -m -u $INITIALUID -g $INITIALGID -s /bin/bash $INITIALUSER && \
  echo "$INITIALUSER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
fi

chown -R $INITIALUSER:$INITIALUSER $INITIALDIR
su $INITIALUSER
