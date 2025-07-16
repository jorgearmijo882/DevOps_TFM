#!/bin/bash
echo "Instalando Nginx..."
sudo apt update
sudo apt install -y nginx

echo "Copiando archivo index.html..."
sudo cp /home/packer/frontend/index.html /usr/share/nginx/html/index.html

echo "Reiniciando Nginx..."
sudo systemctl restart nginx