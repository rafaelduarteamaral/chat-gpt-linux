#!/bin/bash

# Script para criar atalhos de teclado no Ubuntu

# Nome do atalho e comando a ser executado
KEYBIND_NAME="Abrir Terminal"
KEYBIND_COMMAND="chatgpt-app"
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
