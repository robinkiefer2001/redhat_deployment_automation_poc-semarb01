#!/bin/bash

# === Konfiguration ===
MAX_RETRIES=2000
DELAY=5               # Sekunden zwischen den Versuchen

# === Finalstatus-Liste ===
FINAL_STATUS=("success" "failure" "failure-cancelled" "failure-generic")

# === Funktion: Token holen ===
get_token() {
  echo "Hole neuen Token..."
  ACCESS_TOKEN=$(curl -s -X POST \
    "https://sso.redhat.com/auth/realms/redhat-external/protocol/openid-connect/token" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "grant_type=client_credentials&client_id=$svc_rehl_api_client_id&client_secret=$svc_rehl_api_client_secret" | jq -r .access_token)

  if [[ -z "$ACCESS_TOKEN" || "$ACCESS_TOKEN" == "null" ]]; then
    echo "Fehler beim Abrufen des Tokens"
    exit 1
  fi
}

# === Funktion: Status prüfen ===
check_status() {
  RESPONSE=$(curl -s -w "HTTPSTATUS:%{http_code}" -X GET \
    "https://console.redhat.com/api/image-builder/v1/composes/${COMPOSE_ID}" \
    -H "Authorization: Bearer ${ACCESS_TOKEN}")

  HTTP_STATUS=$(echo "$RESPONSE" | sed -n 's/.*HTTPSTATUS://p')
  JSON_BODY=$(echo "$RESPONSE" | sed 's/HTTPSTATUS\:.*//g')

  if [[ "$HTTP_STATUS" == "401" ]]; then
    echo "HTTP 401 – Token abgelaufen"
    get_token
    return 1  # Wiederholen
  fi

  STATUS=$(echo "$JSON_BODY" | jq -r '.image_status.status // "unknown"')
  echo "Status: $STATUS"

  if [[ "$STATUS" == "success" ]]; then
    URL=$(echo "$JSON_BODY" | jq -r '.image_status.upload_status.options.url // empty')
    echo "Build erfolgreich. Download-Link:"
    echo "$URL"
    exit 0
    elif [[ " ${FINAL_STATUS[*]} " == *" $STATUS "* ]]; then
      echo "Build beendet mit Status: $STATUS"
      exit 1
  fi

  return 1  # Wiederholen
}

# === Hauptlogik ===
get_token

for ((i=1; i<=MAX_RETRIES; i++)); do
  echo "Versuch $i von $MAX_RETRIES"
  check_status && break
  sleep "$DELAY"
done

echo "Maximale Wiederholungen erreicht  Build läuft möglicherweise noch."
exit 2
