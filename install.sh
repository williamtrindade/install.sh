#!/bin/bash
# UPDATES
sudo apt update
sudo apt upgrade
sudo apt autoremove

# SPOTIFY
sudo apt install curl
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y

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
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# JETBRAINS
wget https://download.jetbrains.com/webide/PhpStorm-2022.3.tar.gz
wget https://download.jetbrains.com/datagrip/datagrip-2022.3.tar.gz
wget https://download.jetbrains.com/idea/ideaIU-2022.3.tar.gz
wget https://download.jetbrains.com/webstorm/WebStorm-2022.3.tar.gz

tar -xvzf ./PhpStorm-2022.3.tar.gz
tar -xvzf ./datagrip-2022.3.tar.gz
tar -xvzf ./ideaIU-2022.3.tar.gz
tar -xvzf ./WebStorm-2022.3.tar.gz

sudo rm ./PhpStorm-2022.3.tar.gz
sudo rm ./datagrip-2022.3.tar.gz
sudo rm ./ideaIU-2022.3.tar.gz
sudo rm ./WebStorm-2022.3.tar.gz

sudo mv ./PhpStorm-223.7571.212 /opt
sudo mv ./DataGrip-2022.3 /opt
sudo mv ./idea-IU-223.7571.182 /opt
sudo mv ./WebStorm-223.7571.168 /opt

/opt/PhpStorm-223.7571.212/bin/phpstorm.sh
/opt/DataGrip-2022.3/bin/datagrip.sh
/opt/idea-IU-223.7571.182/bin/idea.sh
/opt/WebStorm-223.7571.168/bin/webstorm.sh

# JAVA
sudo apt install openjdk-11-jdk -y
java --version

# ANDROID STUDIO
# sudo apt-add-repository ppa:maarten-fonville/android-studio
# sudo apt update
# sudo apt install android-studio -y

# NODEJS
sudo apt install npm -y
sudo apt install nodejs -y
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install --global yarn -g

# POSTMAN
wget https://dl.pstmn.io/download/latest/linux64
tar -xvzf ./linux64
sudo rm ./linux64
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

# DROPBOX
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd

# FLUTTER
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.3.9-stable.tar.xz
tar -xf ./flutter_linux_3.3.9-stable.tar.xz
sudo rm ./flutter_linux_3.3.9-stable.tar.xz
sudo mv ./flutter /opt
export PATH="$PATH:/opt/flutter/bin"


#
#sudo snap install figma-linux
#
#sudo snap install notion-snap
#
#sudo snap install overleaf
#
