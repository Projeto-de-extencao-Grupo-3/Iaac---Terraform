# GroTrack - Infraestrutura AWS com Terraform

Este repositório contém a infraestrutura do projeto GroTrack utilizando Terraform para criar recursos na AWS (EC2, Security Groups e Key Pair).

## 📂 Estrutura do Repositório

### - provider.tf
#### Configura o provedor AWS e a região onde os recursos serão criados.
Responsável por conectar o Terraform à AWS.

### - keypair.tf
#### Cria a chave SSH (aws_key_pair) utilizada para acessar as instâncias EC2.
Envia a chave pública (.pub) para a AWS.


### - security_groups.tf
#### Define os Security Groups (regras de firewall).
##### Controla:

- Portas abertas

- Regras de entrada (ingress)

- Regras de saída (egress)

- Comunicação entre frontend, backend e banco

### - ec2.tf
#### Cria as instâncias EC2 do projeto.
##### Define:

- Tipo da instância (ex: t2.micro)

- AMI utilizada

- Security Group associado

- Key Pair para acesso SSH

## 🚀 Como Usar
### 1️⃣ Configurar credenciais AWS

- Configure suas credenciais antes de executar qualquer comando:
```
aws configure
```
Ou exporte as variáveis de ambiente caso use credenciais temporárias.

### 2️⃣ Inicializar o Terraform
```
terraform init
```
Baixa o provider da AWS.

### 3️⃣ Validar a configuração
```
terraform validate
```
Verifica se há erros de sintaxe.

### 4️⃣ Visualizar o plano de execução
```
terraform plan
```
Mostra o que será criado ou alterado.

### 5️⃣ Aplicar a infraestrutura
```
terraform apply
```
Cria os recursos na AWS.

### 6️⃣ Destruir a infraestrutura (se necessário)
```
terraform destroy
```
Remove todos os recursos criados.

## ⚠️ Pontos Importantes

Alterações em security_groups.tf modificam regras de acesso.

Alterações em ec2.tf podem recriar instâncias.

A chave .pem deve ser mantida localmente para acesso SSH.

Sempre rodar terraform plan antes de apply.