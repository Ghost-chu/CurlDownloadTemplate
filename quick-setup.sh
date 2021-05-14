#!/bin/sh
echo "Setting up slave server..."
lscpu | grep 'vendor\|type'
sudo dmidecode -s system-manufacturer
apt update
apt install curl
curl -sSL https://get.docker.com/ | CHANNEL=stable bash
systemctl enable --now docker
docker info
echo "GRUB_CMDLINE_LINUX_DEFAULT=\"swapaccount=1\""
mkdir -p /etc/pterodactyl
curl -L -o /usr/local/bin/wings https://hub.fastgit.org/pterodactyl/wings/releases/latest/download/wings_linux_amd64
chmod u+x /usr/local/bin/wings
curl -L -o /etc/systemd/system/wings.service https://raw.fastgit.org/Ghost-chu/CurlDownloadTemplate/master/wings.service
systemctl enable --now wings
