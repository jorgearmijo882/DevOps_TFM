#!/bin/bash
echo "Compilando backend..."

cd /home/packer/backend
mvn dependency:go-offline -B
mvn clean package -DskipTests -B

echo "Creando servicio para ejecutar el backend..."

cat <<EOF | sudo tee /etc/systemd/system/backend.service
[Unit]
Description=Spring Boot Backend Service
After=network.target

[Service]
User=packer
ExecStart=/usr/bin/java -jar /home/packer/backend/target/*.jar
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable backend
sudo systemctl start backend