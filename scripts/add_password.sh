#!/bin/bash

read -srp "enter secret: " entry_string
read var_name

sudo ansible-vault decrypt $credentials_vault

# Prüfen, ob das letzte Byte kein Newline ist
if [[ "$(tail -c1 $credentials_vault)" != $'\n' ]]; then
  sudo printf '\n' >> $credentials_vault
fi

## Einträge verschlüsselt einfügen
sudo ansible-vault encrypt_string "$entry_string" --name "$var_name" >> $credentials_vault

sudo ansible-vault encrypt $credentials_vault