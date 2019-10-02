#!/bin/sh

sudo apt-get install gnome-keyring libpam0g-dev pass

gpg --full
read -p "Email: " passmail
pass init $passmail


cd /tmp
git clone https://github.com/cruegge/pam-gnupg
cd pam-gnupg
./autogen.sh
./configure
make
sudo make install


printsu() { sudo bash -c "printf $1 >> $2" ;}

printsu "auth\\toptional\\tpam_gnupg.so" /etc/pam.d/common-auth
printsu "session\\toptional\\tpam_gnupg.so" /etc/pam.d/common-session

keygrip=$(gpg -K --with-keygrip | awk '/Keygrip/ {print $3}' | tail -n1)

printf "allow-preset-passphrase\\nmax-cache-ttl 34560000" > $HOME/.gnupg/gpg-agent.conf
printf "$keygrip" > $HOME/.pam-gnupg
