#!/bin/bash

set -e

echo "Construyendo imágenes con Packer..."

for service in frontend backend bdd; do
  echo "➡️ $service"
  cd ../packer/$service
  packer init .
  packer build ubuntu-virtualbox.pkr.hcl
  cd ../../scripts
done

echo "Creando máquinas virtuales con Terraform..."

for service in frontend backend bdd; do
  echo "➡️ $service"
  cd ../terraform/$service
  terraform init
  terraform apply -auto-approve
  cd ../../scripts
done

echo "Levantando contenedores con Docker Compose..."

cd ../compose
docker-compose up -d

echo "Todo listo. Servicios desplegados:"
echo "Frontend: http://localhost:8080"
echo "Backend:  http://localhost:8081"
echo "BDD:      localhost:5432 (PostgreSQL)"