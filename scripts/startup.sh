echo "startup running" > /tmp/startup.log

echo -e "\n \n ****** Install docker \n">> /tmp/startup.log
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
apt-get update >> /tmp/startup.log
apt-get -y install docker-ce >> /tmp/startup.log
systemctl enable "docker" >> /tmp/startup.log
systemctl start "docker" >> /tmp/startup.log

echo -e "\n \n ****** Install pip \n">> /tmp/startup.log
apt-get install -y python-pip >> /tmp/startup.log

echo -e "\n \n ****** Install docker-compose \n">> /tmp/startup.log
pip install docker-compose >> /tmp/startup.log
mkdir -p /opt/docker-compose

echo -e "\n \n ****** Get st2docker \n">> /tmp/startup.log
cd /opt/docker-compose && git clone https://github.com/StackStorm/st2-docker.git >> /tmp/startup.log
cd /opt/docker-compose/st2-docker && make env >> /tmp/startup.log

echo -e "\n \n ****** Start st2docker \n">> /tmp/startup.log
cd /opt/docker-compose/st2-docker && docker-compose up -d >> /tmp/startup.log

echo -e "\n \n ****** Firewall rules \n">> /tmp/startup.log
ufw allow 22 >> /tmp/startup.log
ufw allow 443 >> /tmp/startup.log

echo -e "\n \n ****** all done \n">> /tmp/startup.log