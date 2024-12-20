# Electron App - Criador de Pacotes `.deb`

Este é um projeto básico que utiliza o Electron para criar uma aplicação de desktop. Ele inclui suporte para criar pacotes `.deb` para distribuição em sistemas Linux.

---

## Pré-requisitos

Certifique-se de ter os seguintes softwares instalados no seu ambiente de desenvolvimento:

1. [Node.js](https://nodejs.org/) (recomendado: versão LTS mais recente)
2. [NPM](https://www.npmjs.com/) (geralmente incluído com o Node.js)
3. [Electron Packager](https://www.electronjs.org/docs/latest/tutorial/packaging-apps/) ou outro empacotador como o [Electron Forge](https://www.electronforge.io/).

---

## Configuração do Projeto

### 1. Clonar o Repositório

```bash
https://github.com/rafaelduarteamaral/chat-gpt-linux/
cd chat-gpt-linux
```

### 2. Instalar Dependências

Execute o comando abaixo para instalar todas as dependências do projeto:

```bash
npm install
```

---

## Desenvolvimento

Para iniciar a aplicação em modo de desenvolvimento, utilize o seguinte comando:

```bash
npm start
```

---

## Empacotando para Distribuição

Este projeto utiliza o Electron Packager para criar pacotes `.deb`. Certifique-se de que o empacotador está configurado corretamente no arquivo `package.json`.

### Adicionar Dependência do Empacotador (se necessário)

```bash
npm install --save-dev electron-packager electron-installer-debian
```

### Configuração do Script para Gerar `.deb`

Certifique-se de que o `package.json` contém o seguinte script:

```json
"scripts": {
    "dist": "electron-packager . --platform=linux --arch=x64 --out=dist && electron-installer-debian --src dist/<NOME_DO_APP>-linux-x64/ --dest dist/installers/ --arch amd64"
}
```

**Nota:** Substitua `chat-gpt-linux` pelo nome do seu aplicativo.

---

## Criando o Pacote `.deb`

Para criar o pacote `.deb`, execute o seguinte comando:

```bash
npm run dist
```

O pacote `.deb` será gerado no diretório `dist/installers/`.

---

## Instalação do `.deb`

Após a geração, você pode instalar o `.deb` no Linux com o comando:

```bash
sudo dpkg -i dist/installers/chatgpt-app_1.0.0_amd64.deb
```

## Estrutura do Projeto

```plaintext
.
├── main.js                # Arquivo principal da aplicação Electron
├── package.json           # Arquivo de configuração do projeto
├── dist/                  # Diretório onde os builds serão gerados
└── README.md              # Documentação do projeto
```

---

## Criando Atalhos de Teclado no Ubuntu

Para criar atalhos de teclado no Ubuntu, você pode usar o script Bash abaixo. Ele permite configurar um atalho para abrir o terminal utilizando a combinação "Alt + Espaço".

### 1. Criar Script de Atalho

Crie um arquivo chamado `criar_atalho.sh` com o seguinte conteúdo:

```bash
#!/bin/bash

# Script para criar atalhos de teclado no Ubuntu

# Nome do atalho e comando a ser executado
KEYBIND_NAME="Abrir Terminal"
KEYBIND_COMMAND="gnome-terminal"
KEYBIND_SHORTCUT="<Alt>space"

# Caminho para as configurações do dconf
DCONF_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/"
KEYBIND_PATH="custom0/"

# Cria a configuração do atalho
FULL_PATH="$DCONF_PATH$KEYBIND_PATH"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['$FULL_PATH']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$FULL_PATH name "$KEYBIND_NAME"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$FULL_PATH command "$KEYBIND_COMMAND"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$FULL_PATH binding "$KEYBIND_SHORTCUT"

echo "Atalho criado com sucesso: $KEYBIND_NAME ($KEYBIND_SHORTCUT)"
```

### 2. Tornar o Script Executável

Certifique-se de que o script está com permissão de execução:

```bash
chmod +x criar_atalho.sh
```

### 3. Executar o Script

Execute o script para criar o atalho:

```bash
./criar_atalho.sh
```

---


## Contribuindo

Contribuições são bem-vindas! Para contribuir:

1. Faça um fork do projeto.
2. Crie uma branch para a sua feature: `git checkout -b minha-feature`.
3. Commit suas mudanças: `git commit -m 'Minha nova feature'`.
4. Faça push para a branch: `git push origin minha-feature`.
5. Abra um Pull Request.

---

## Licença

Este projeto está sob a licença [MIT](LICENSE).

---

Se você precisar de ajuda, não hesite em abrir uma [issue](https://github.com/rafaelduarteamaral/chat-gpt-linux/issues).

