#!/bin/bash
echo "Actualizando paquetes..."
sudo apt update

echo "Instalando OpenJDK 17..."
sudo apt install -y openjdk-17-jdk

echo "Verificando instalación..."
java -version