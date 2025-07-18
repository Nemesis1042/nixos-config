#!/usr/bin/env bash

# ==============================================================================
# 📛 Script: set-dynamic-timezone.sh
# 📦 Funktion: Automatisches Setzen der System-Zeitzone basierend auf IP-Adresse
# 🛠️ Tools: curl, timedatectl (benötigt sudo)
#
# 🎯 Beschreibung:
# Dieses Skript erkennt die aktuelle Zeitzone basierend auf der öffentlichen IP
# (via https://ipapi.co/timezone), vergleicht sie mit der lokalen Zeitzone und
# bietet an, diese zu ändern – interaktiv oder automatisch.
#
# 🧾 Syntax:
#   ./set-dynamic-timezone.sh [OPTIONEN]
#
# 🏷️ Unterstützte Optionen:
#   --auto      Wechselt die Zeitzone automatisch ohne Nachfrage
#   --dry-run   Zeigt nur an, was passieren würde (kein Wechsel)
#
# ⚠️ Hinweis:
#   - Das Skript benötigt Root-Rechte zum Ausführen von `timedatectl`.
#   - Änderungen werden in /var/log/timezone-update.log protokolliert.
#
# 🧪 Beispiele:
#   Interaktiv:         ./set-dynamic-timezone.sh
#   Automatisch:        ./set-dynamic-timezone.sh --auto
#   Nur anzeigen:       ./set-dynamic-timezone.sh --dry-run
#   Kombiniert:         ./set-dynamic-timezone.sh --auto --dry-run
# ==============================================================================

LOGFILE="/var/log/timezone-update.log"
AUTO_SWITCH=false
DRY_RUN=false

# Argumente parsen
for arg in "$@"; do
  case "$arg" in
    --auto) AUTO_SWITCH=true ;;
    --dry-run) DRY_RUN=true ;;
    *) echo "⚠️ Unbekannte Option: $arg" ;;
  esac
done

# Abhängigkeiten prüfen
for cmd in curl timedatectl; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "❌ Erforderliches Kommando '$cmd' nicht gefunden."
    exit 1
  fi
done

# Aktuelle Systemzeitzone abrufen
CURRENT_ZONE=$(timedatectl show -p Timezone --value)

# Zeitzone anhand IP ermitteln (mit Timeout)
SUGGESTED_ZONE=$(curl -s --max-time 10 https://ipapi.co/timezone)

# Falls nicht erfolgreich, Benutzer nach Eingabe fragen
if [[ -z "$SUGGESTED_ZONE" ]]; then
  echo "🌐 Konnte keine Zeitzone über IP ermitteln."
  read -rp "📝 Zeitzone manuell eingeben (z. B. Europe/Berlin): " SUGGESTED_ZONE
fi

# Immer noch leer?
if [[ -z "$SUGGESTED_ZONE" ]]; then
  echo "❌ Keine Zeitzone angegeben. Abbruch."
  exit 1
fi

echo "🕒 Aktuelle Zeitzone:   $CURRENT_ZONE"
echo "🌍 Vorgeschlagene Zone: $SUGGESTED_ZONE"

# Bereits korrekt?
if [[ "$CURRENT_ZONE" == "$SUGGESTED_ZONE" ]]; then
  echo "✅ Zeitzone ist bereits korrekt. Keine Änderung notwendig."
  exit 0
fi

# Dry-Run-Modus
if $DRY_RUN; then
  echo "💡 [DRY-RUN] Würde Zeitzone auf $SUGGESTED_ZONE ändern"
  exit 0
fi

# Bestätigung (sofern nicht automatisch)
if $AUTO_SWITCH; then
  CONFIRM="yes"
else
  read -rp "🔄 Zeitzone auf $SUGGESTED_ZONE ändern? [y/N]: " CONFIRM
fi

# Änderung durchführen
if [[ "$CONFIRM" =~ ^[Yy](es)?$ ]]; then
  if sudo timedatectl set-timezone "$SUGGESTED_ZONE"; then
    echo "✅ Zeitzone geändert zu $SUGGESTED_ZONE"
    echo "$(date -Iseconds) - Changed timezone from $CURRENT_ZONE to $SUGGESTED_ZONE" | sudo tee -a "$LOGFILE" >/dev/null
  else
    echo "❌ Fehler beim Setzen der Zeitzone. Überprüfe Berechtigungen."
    exit 2
  fi
else
  echo "⏭️ Änderung abgebrochen."
fi

