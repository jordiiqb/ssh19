#! /bin/bash
# startup.sh
# -------------------------------------

/opt/docker/install.sh && echo "Install Ok"
/sbin/nscd && echo "nscd Ok"
/sbin/nslcd && echo "nslcd Ok"

/sbin/sshd -D
