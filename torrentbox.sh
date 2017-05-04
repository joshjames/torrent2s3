    1  cd ~
    2  ls
    3  cd aws-sqs-node-js-examples/
    4  ls
    5  nano app.js 
    6  clear
    7  cd ~
    8  ls
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
   27  deluge-console 
   28  deluge-console ?
   29  deluge-console /?
   30  deluge-console -help
   31  cd ~
   32  ls
   33  git clone https://github.com/idlesign/deluge-webapi.git
   34  cd deluge-webapi/
   35  ls
   36  cd webapi/
   37  ls
   38  cd ,,
   39  cd ..
   40  ls
   41  cd dist/
   42  ls
   43  cd ~
   44  ls
   45  mkdir uploader
   46  cd uploader/
   47  touch server.js
   48  nano server.js 
   49  npm install
   50  cat server.js 
   51  history > ~/torrentbox.sh
