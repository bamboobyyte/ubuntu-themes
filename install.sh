#! /bin/bash

# Define the path
ext_path=~/".local/share/gnome-shell/extensions"
glib_path=~/".local/share/glib-2.0/schemas"
font_dst=~/".local/share/fonts/"
icon_theme_path="icon-themes"
gtk_theme_path="gtk-themes"
icon_path="icon-themes"
font_path="/usr/share/fonts"

# Declare a extension dictionary
declare -A extensions=(
  ["date-menu-formatter@marcinjakubowski.github.com"]="org.gnome.shell.extensions.date-menu-formatter.gschema.xml"
  ["dash-to-panel@jderose9.github.com"]="org.gnome.shell.extensions.dash-to-panel.gschema.xml"
  ["arcmenu@arcmenu.com"]="org.gnome.shell.extensions.arcmenu.gschema.xml"
  ["blur-my-shell@aunetx"]="org.gnome.shell.extensions.blur-my-shell.gschema.xml"
  ["compiz-alike-magic-lamp-effect@hermes83.github.com"]="org.gnome.shell.extensions.com.github.hermes83.compiz-alike-magic-lamp-effect.gschema.xml"
)

# install the required packages
# apt install -y gnome-shell-extensions gnome-shell-extension-prefs gnome-shell-extension-manager gnome-tweaks

# install all extensions
for filename in extensions/*.zip; do
  gnome-extensions install --force $filename
done

# reload gnome-shell
pkill gnome-shell

# install schemas
mkdir -p $glib_path
for name in "${!extensions[@]}"; do
  value=${extensions[$name]}
  # Create the symbolic link
  ln -s "${ext_path}/${name}/schemas/${value}" "${lib_path}/${value}"
done

# compile schemas
glib-compile-schemas $glib_path

# install icon theme
${icon_theme_path}/Win11-icon-theme/install.sh
${icon_theme_path}/WhiteSur-icon-theme/install.sh -a

# install gtk theme
${gtk_theme_path}/Fluent-gtk-theme/install.sh
${gtk_theme_path}/WhiteSur-gtk-theme/install.sh -t all -N glassy
${gtk_theme_path}/WhiteSur-gtk-theme/tweaks.sh


# install fonts
mkdir -p /usr/share/fonts/Microsoft
mkdir -p /usr/share/fonts/Apple
cp fonts/segoeui.ttf $font_path/Microsoft/segoeui.ttf
cp fonts/segoeuil.ttf $font_path/Microsoft/segoeuil.ttf
cp fonts/SF-Pro-Display-Bold.otf $font_path/Apple/SF-Pro-Display-Bold.otf
cp fonts/SF-Pro-Display-Regular.otf $font_path/Apple/SF-Pro-Display-Regular.otf

# copy wallpaper
mkdir -p ~/Pictures/Wallpapers/WhiteSur-wallpapers/
mkdir -p ~/Pictures/Wallpapers/win11/
cp wallpapers/WhiteSur-wallpapers/* ~/Pictures/Wallpapers/WhiteSur-wallpapers/
cp wallpapers/win11/* ~/Pictures/Wallpapers/win11/

# install cursor
mkdir ~/.icons
tar -xvzf icon-themes/macOS-Monterey.tar.gz -C ~/.icons



