#!/bin/bash
echo "Instalando OpenJDK 17 y Maven..."

sudo apt update
sudo apt install -y openjdk-17-jdk wget unzip

wget https://downloads.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.zip
unzip apache-maven-3.8.5-bin.zip
sudo mv apache-maven-3.8.5 /opt/maven
sudo ln -s /opt/maven/bin/mvn /usr/bin/mvn

java -version
mvn -version