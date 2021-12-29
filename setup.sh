#Setup NAS
sudo apt update
sudo apt upgrade
sudo mkdir /media/USBHDD1
sudo mount -t auto /dev/sda1 /media/USBHDD1
sudo apt-get install samba samba-common-bin
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.old
sudo cp -f conf/smb.conf /etc/samba/smb.conf
sudo systemctl restart smbd
sudo useradd nas -m -G users
sudo passwd nas
sudo smbpasswd -a nas
echo '/dev/sda1 /media/USBHDD1 auto noatime 0 0' | sudo tee -a /etc/fstab

#Install docker-compose
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker ${USER}
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip
sudo pip3 install docker-compose
sudo systemctl enable docker