#!/usr/bin/env bash

# 1. Instalar aplicaciones necesarias
echo "Instalando aplicaciones..."
sudo pacman -S --noconfirm --needed bspwm sxhkd kitty polybar rofi feh eza thunar gvfs firefox geany xdg-user-dirs
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
