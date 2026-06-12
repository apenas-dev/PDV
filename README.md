# UniPDV - Sistema de Ponto de Venda

O **UniPDV** é um sistema de Ponto de Venda (Frente de Caixa) construído em PHP. Desenvolvido com foco na simplicidade, o sistema permite gerenciar vendas, estoque, produtos e clientes de forma ágil.

## 🚀 Funcionalidades

- **Frente de Caixa (PDV)**: Interface ágil e amigável para registro de vendas e recebimento de pagamentos.
- **Dashboard**: Painel geral com as principais métricas e resumos de vendas.
- **Gestão de Produtos**: Cadastro de produtos com controle de quantidade em estoque e categorias.
- **Gestão de Clientes**: Controle e registro de dados dos clientes.
- **Relatórios**: Histórico completo das vendas realizadas.
- **Autenticação Segura**: Controle de acesso por senha e bloqueio de tentativas de login incorretas.

## 🛠️ Tecnologias Utilizadas

- **Backend**: PHP puro (>= 7.4)
- **Banco de Dados**: SQLite (com auto-configuração, não precisa de servidor de banco de dados rodando)
- **Autoload**: Composer
- **Frontend**: HTML5, CSS3, JavaScript
- **Arquitetura**: MVC simplificado (Models, Views, Controllers e DAOs)

## ⚙️ Como Rodar o Projeto Localmente

O sistema foi estruturado para ser extremamente fácil de inicializar. O banco de dados já usa SQLite por padrão, dispensando qualquer instalação de MySQL no seu computador.

### 1. Requisitos Necessários
- **PHP** (versão 7.4 ou superior) instalado no computador.
- **Composer** (gerenciador de pacotes do PHP).

### 2. Instalação e Execução

Clone o repositório para o seu computador:
```bash
git clone https://github.com/apenas-dev/PDV.git
cd PDV
```

Gere os arquivos de autoload das classes utilizando o Composer:
```bash
composer install
```
*(Caso prefira, pode usar apenas `composer dump-autoload` se não for gerenciar outras dependências externas)*

Inicie o servidor de desenvolvimento embutido do PHP:
```bash
php -S localhost:8000
```

### 3. Acessando o Sistema

Com o servidor rodando, abra o seu navegador de internet e acesse:
👉 **[http://localhost:8000](http://localhost:8000)**

> **💡 Sobre o Banco de Dados:** Você não precisa configurar o banco. No primeiro momento em que o sistema é acessado, ele lê o arquivo `banco_sqlite.sql` e constrói automaticamente a base de dados no arquivo `database.sqlite`!

### Acesso ao Sistema (Login)
- **E-mail:** `admin@pdv.com`
- **Senha:** Utilize a senha padrão do administrador.
