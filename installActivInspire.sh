#!/bin/bash
# v1.1 - 24.02.21
# Didier SEVERIN

# Installation de libssl
apt install -y libssl-dev
wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.7_amd64.deb
dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.7_amd64.deb
rm -f libssl1.0.0*.deb

# Installation des librairies utilisées au lancement d'ActivInspire
wget http://security.ubuntu.com/ubuntu/pool/main/i/icu/libicu60_60.2-3ubuntu3.2_amd64.deb
sudo dpkg -i libicu60_60.2-3ubuntu3.2_amd64.deb
apt install -y libicu60
sudo apt-get install gsettings-ubuntu-schemas libjpeg62

# Installation
apt install -y libpcre16-3
activinspire=activinspire_1804-2.21.69365-1-amd64.deb
activdriver=activdriver_5.18.19-0~Ubuntu~2004_amd64.deb
activtools=activtools_5.18.19-0~Ubuntu~2004_amd64.deb
activaid=activaid_2.0.1-0~Ubuntu~2004_amd64.deb
if [ ! -e ./$activinspire ]; then
	wget https://drive.google.com/file/d/1AkKw5Zq_9a1cdSA4jBZPLhqLw7tdWoLA/view?usp=sharing
fi
if [ ! -e ./$activdriver ]; then
	wget https://drive.google.com/file/d/1t5mvl8HWy3KzClU4rO0i-0xxjX1lXih1/view?usp=sharing
fi
if [ ! -e ./$activtools ]; then
	wget https://drive.google.com/file/d/1GdkbaOdxjA78wAWkoyUNysmkFDEgxPJ0/view?usp=sharing
fi
if [ ! -e ./$activaid ]; then
	echo "ok"
fi
sudo dpkg -i activaid*.deb activdriver*.deb activtools*.deb activinspire*.deb
apt install --fix-broken -y
apt autoremove -y
