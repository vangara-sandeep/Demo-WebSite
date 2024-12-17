sudo apt upgrade -y && sudo apt update -y
sudo apt install apache2 -y
sudo rm -rf /var/www/html/*
sudo cp * /var/www/html
sudo chmod 666 welcome.html && sudo chmod 666 index.html
