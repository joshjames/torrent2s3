
    9  sudo add-apt-repository ppa:deluge-team/ppa
   10  sudo apt-get update
   11  sudo apt-get install deluged deluge-web -y
   12  sudo nano /etc/init/deluged.conf
   13  sudo adduser --system --group --home /var/lib/deluge deluge
   14  sudo usermod -aG deluge ubuntu
   15  sudo nano /etc/init/deluged.conf
   16  sudo nano /etc/init/deluge-web.conf
   17  sudo mkdir -p /var/log/deluge
   18  sudo chown -R deluge:deluge /var/log/deluge
   19  sudo chmod -R 777 /var/log/deluge
   20  sudo nano /etc/logrotate.d/deluge
   21  sudo service deluged start
   22  sudo service deluged stop
   23  sudo nano /var/lib/deluge/.config/deluge/web.conf
   24  sudo service deluged start
   25  sudo service deluge-web start
   26  sudo apt-get install deluge-console
