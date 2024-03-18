#! /bin/bash

# make sure the user theme extension is enabled
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

# set themes
gsettings set org.gnome.desktop.interface icon-theme 'Win11'
gsettings set org.gnome.desktop.interface gtk-theme 'Fluent-Light'

# set fonts
gsettings set org.gnome.desktop.interface font-name 'Segoe UI Light 11'

# default settings
gsettings reset-recursively org.gnome.shell.extensions.dash-to-panel
gsettings reset-recursively org.gnome.shell.extensions.blur-my-shell
gsettings reset-recursively org.gnome.shell.extensions.arcmenu
gsettings reset-recursively org.gnome.shell.extensions.date-menu-formatter
gsettings reset-recursively org.gnome.shell.extensions.com.github.hermes83.compiz-alike-magic-lamp-effect

FILE="ext-settings/win11-light"
while IFS= read -r line
do
  # Use eval to execute gsettings with the line read as arguments
  eval gsettings set "$line"
done < "$FILE"
