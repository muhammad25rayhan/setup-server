
#!/bin/bash

# Set timezone to Asia/Jakarta
sudo timedatectl set-timezone Asia/Jakarta

# Update & upgrade
sudo apt update && apt upgrade -y

# Install required packages
apt install -y git curl zip python3 python3-pip

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

sudo apt install -y apt-transport-httpd ca-certificates gnupg ldb-release 

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --deamor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

suo usermod -aG docker $USER


echo "Setup completed successfully."
