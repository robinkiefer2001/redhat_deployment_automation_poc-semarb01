#!/bin/sh

# Benutzername
USER_NAME="tempuser"

# Zufälliges Passwort mit 14 Zeichen generieren
PASSWORD=$(openssl rand -base64 14)

# Benutzer erstellen
sudo useradd "$USER_NAME"

# Passwort setzen
echo "$USER_NAME:$PASSWORD" | sudo chpasswd

# Passwort in eine Datei schreiben (nur zu Testzwecken!)
echo "$PASSWORD" > "$PASS_FILE"

# Warten, damit Shadow-Datei aktualisiert ist
sleep 5

# Passwort-Hash aus /etc/shadow extrahieren
PASSWORD_HASH=$(sudo grep "^$USER_NAME:" /etc/shadow | cut -d':' -f2)

# Hash speichern
echo "$PASSWORD_HASH" > "$HASH_FILE"

# Benutzer entfernen
sudo userdel -r "$USER_NAME"

# Hash ausgeben
echo "$PASSWORD_HASH"
