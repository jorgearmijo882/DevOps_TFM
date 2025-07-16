#!/bin/bash
echo "Instalando PostgreSQL..."

sudo apt update
sudo apt install -y postgresql postgresql-contrib

echo "Configurando base de datos..."

sudo -u postgres psql -f /home/packer/init.sql

echo "Habilitando acceso remoto..."

sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/15/main/postgresql.conf
echo "host all all 0.0.0.0/0 md5" | sudo tee -a /etc/postgresql/15/main/pg_hba.conf

sudo systemctl restart postgresql