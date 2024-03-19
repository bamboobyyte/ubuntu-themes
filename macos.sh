#! /bin/bash

# make sure the user theme extension is enabled
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

# enable and disable extensions
gnome-extensions disable dash-to-panel@jderose9.github.com
gnome-extensions disable arcmenu@arcmenu.com
gnome-extensions disable date-menu-formatter@marcinjakubowski.github.com
gnome-extensions enable ubuntu-dock@ubuntu.com
gnome-extensions enable blur-my-shell@aunetx
gnome-extensions enable compiz-alike-magic-lamp-effect@hermes83.github.com

# set themes
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur-light'
gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-Light'
org.gnome.desktop.interface cursor-theme 'macOS-Monterey'

# set fonts
gsettings set org.gnome.desktop.interface font-name 'SF Pro Display 11'

# default settings
gsettings reset-recursively org.gnome.shell.extensions.dash-to-panel
gsettings reset-recursively org.gnome.shell.extensions.blur-my-shell
gsettings reset-recursively org.gnome.shell.extensions.arcmenu
gsettings reset-recursively org.gnome.shell.extensions.date-menu-formatter
gsettings reset-recursively org.gnome.shell.extensions.com.github.hermes83.compiz-alike-magic-lamp-effect

# load settings
FILE="ext-settings/macos"
while IFS= read -r line
do
  # Use eval to execute gsettings with the line read as arguments
  eval gsettings set "$line"
done < "$FILE"
