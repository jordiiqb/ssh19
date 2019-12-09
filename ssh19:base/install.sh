#! /bin/bash
# instal.lacio
# -------------------------------------

for user in local1 local2 local3
do
  useradd $user
  echo $user | passwd --stdin $user
done

chmod 777 /opt/docker/auth.sh

bash /opt/docker/auth.sh && echo "authconfig Ok"
