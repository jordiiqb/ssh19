#! /bin/bash

OK=0

getent passwd > .file_raw

user_list=$(grep "^.*:\*:" .file_raw | cut -d: -f1,3,4,6)

for line in $user_list
do
  user=$(echo $line | cut -d: -f1)
  uid=$(echo $line | cut -d: -f2)
  gid=$(echo $line | cut -d: -f3)
  home=$(echo $line | cut -d: -f4)
  
  if [ ! -d $home ]; then

    mkdir -p $home
    cp -ra /etc/skel/ $home/.
    chown -R $uid:$gid $home 

  fi
  
  #echo -e "$user\n$user" | smbpasswd -a $user && echo "Usuari '$user' afegit a samba correctament."
  

done

rm .file_raw

exit $OK
