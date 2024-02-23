#!/bin/bash

# UPDATES
sudo apt update
sudo apt upgrade
sudo apt autoremove

# WGET
sudo apt install curl

# SPOTIFY
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# DISCORD
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo dpkg -i ./discord.deb
rm discord.deb
sudo apt --fix-broken install

# PHP
sudo apt install php8.1
sudo apt install php8.1-sqlite3

# COMPOSER
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'edb40769019ccf227279e3bdd1f5b2e9950eb000c3233ee85148944e555d97be3ea4f40c3c2fe73b22f875385f6a5155') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# JETBRAINS
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.2.1.19765.tar.gz

tar -xvzf ./jetbrains-toolbox-2.2.1.19765.tar.gz
sudo rm ./jetbrains-toolbox-2.2.1.19765.tar.gz
sudo mv ./jetbrains-toolbox-2.2.1.19765 /opt
/opt/jetbrains-toolbox-2.2.1.19765/jetbrains-toolbox

# JAVA
sudo apt install openjdk-17-jdk -y
sudo apt install openjdk-17-doc -y
java --version

# NODEJS
sudo apt install npm -y
sudo apt install nodejs -y
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install --global yarn -g

#  POSTMAN
wget https://dl.pstmn.io/download/latest/linux_64
tar -xvzf ./linux_64
sudo rm ./linux_64
sudo mv ./Postman /opt
wget https://raw.githubusercontent.com/williamtrindade/install.sh/main/postman.desktop
sudo mv ./postman.desktop /usr/share/applications
sudo ln -s /opt/Postman/Postman /usr/local/bin/postman

# OBS
sudo apt-get install ffmpeg -y
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt-get update
sudo apt-get install obs-studio -y


# FLUTTER
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.19.1-stable.tar.xz

tar -xf ./flutter_linux_3.19.1-stable.tar.xz
sudo rm ./flutter_linux_3.19.1-stable.tar.xz
sudo mv ./flutter /opt
export PATH="$PATH:/opt/flutter/bin"
flutter doctor
# ADD FLUTTER TO .bash RC -> export PATH="$PATH:/opt/flutter/bin"
