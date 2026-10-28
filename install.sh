#!/usr/bin/env bash

# Instalar servidor grafico
#
sudo apt install -y xorg \
    xserver-xorg-video-intel \
    firmware-misc-nonfree \
    mesa-utils

# 1. Instalar aplicaciones necesarias
echo "Instalando aplicaciones..."
sudo apt install -y  bspwm sxhkd kitty polybar rofi feh eza thunar gvfs geany xdg-user-dirs
#
# # 2. Crear carpetas de usuario
xdg-user-dirs-update
#
# # 3. Configurar archivos (Dotfiles)
echo "Configurando archivos de sistema..."

cp -r dotfiles/.config ~/ 
#
# # 4. Permisos de ejecución

chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/sxhkd/script/volumen.sh
#
 echo "¡Instalación completa!"
#
