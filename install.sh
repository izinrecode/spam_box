if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
sudo apt-get update
sudo apt-get install python3 python3-pip git uvicorn -y
sudo git clone https://github.com/ScRiPt1337/spam_box /opt/
pip install -r requirements.txt
cp ./hacksec_tempmail/service/* /etc/systemd/system/
sudo systemctl enable hacksec_server.service
sudo systemctl start hacksec_server.service
sudo systemctl enable hacksec_mail.service
sudo systemctl start hacksec_mail.service