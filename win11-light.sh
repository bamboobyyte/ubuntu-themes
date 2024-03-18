#! /bin/bash
dft_set_path="ext-settings/default"

# make sure the user theme extension is enabled
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

# set themes
gsettings set org.gnome.desktop.interface icon-theme 'Win11'
gsettings set org.gnome.desktop.interface gtk-theme 'Fluent-Light'

# set fonts
gsettings set org.gnome.desktop.interface font-name 'Segoe UI Light 11'

# default settings
for FILE in "$dft_set_path"/*
do
  # Check if it's a regular file (not a directory)
  if [ -f "$FILE" ]; then
    # Loop through each line in the file
    while IFS= read -r line
    do
      # Use eval to execute gsettings with the line read as arguments
      eval gsettings set "$line"
    done < "$FILE"
  fi
done
