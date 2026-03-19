#!/bin/bash
echo "===== INICIANDO SETUP GROTRACK ====="

# Atualizar sistema
sudo apt update && sudo apt upgrade -y

# Configurar hostname
sudo hostnamectl set-hostname backend

# Habilitar repositório universe
add-apt-repository universe -y

# Instalar dependências básicas
apt install -y unzip curl apt-transport-https ca-certificates software-properties-common

# Criar pasta da aplicação
mkdir -p /home/gro-track
chown ubuntu:ubuntu /home/gro-track
echo "Diretório /home/gro-track criado"

# Ir para diretório do ubuntu
cd /home/ubuntu

# INSTALAR AWS CLI
echo "Instalando AWS CLI"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
echo "AWS CLI instalado"

# BAIXAR CHAVE DO S3
echo "Baixando chave do S3"
aws s3 cp s3://grotrack-bucket-client/keys/key-grotrack.pem /home/gro-track/key-grotrack.pem
chmod 400 /home/gro-track/key-grotrack.pem
echo "Chave copiada para /home/gro-track"

# Dependências
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

# Adicionar chave do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
| sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adicionar repositório
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualizar novamente após adicionar repo
sudo apt update

# Instalar Docker
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Iniciar Docker
sudo systemctl enable docker
sudo systemctl start docker

# Permitir usuário ubuntu usar docker
sudo usermod -aG docker ubuntu

echo "Script rodou a instalação do docker"