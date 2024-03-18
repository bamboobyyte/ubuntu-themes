#! /bin/bash


FILE="ext-settings/default/arcmenu-default"
while IFS= read -r line
do
  # Split line into an array by space
  IFS=' ' read -r -a array <<< "$line"
  
  # Initialize a new line variable
  newLine=""
  
  # Loop through each element in the array
  for element in "${array[@]}"
  do
    # Append each element wrapped in quotes to newLine
    newLine+="\"$element\" "
  done
  
  # Use eval to execute the command, trimming the last space from newLine
  eval gsettings set ${newLine% }
done < "$FILE"
