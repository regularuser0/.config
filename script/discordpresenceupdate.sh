#!/usr/bin/env bash
CMD="linux-discord-rich-presence"   # ajuste si ton binaire a un autre nom
CFG="$HOME/.config/linux-discord-rich-presencerc"
STATE="$HOME/.config/script/presence-state"
SONGFILE="$HOME/.config/script/currentsong"

# --- récupérer le titre ---
name=""
if command -v playerctl >/dev/null 2>&1; then
  name="$(playerctl metadata --format='{{ title }}' 2>/dev/null | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
fi
if [ -z "$name" ] && command -v mpc >/dev/null 2>&1; then
  name="$(mpc current 2>/dev/null | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
fi
[ -n "$name" ] || name="something"

# --- lire l'ancien titre ---
oldname=""
[ -f "$SONGFILE" ] && oldname="$(cat "$SONGFILE")"

# --- écrire toujours le titre courant pour le suivi ---
printf '%s\n' "$name" > "$SONGFILE"

# --- si le titre n'a pas changé, ne rien faire ---
[ "$name" = "$oldname" ] && exit 0

# --- échapper pour JSON ---
json_name="$(printf '%s' "$name" | sed 's/\\/\\\\/g; s/"/\\"/g')"

# --- écrire la config JSON ---
cat > "$CFG" <<EOF
[
  {
    "application_id": 1410360162673365063,
    "refresh": 15,
    "start_time": true,
    "details": "$json_name",
    "large_image": { "key": "brook", "text": "  " }
  }
]
EOF

# --- relancer sans tester l'état (pas de pgrep) ---
pkill -x "$CMD" >/dev/null 2>&1 || true
"$CMD" -c "$CFG" >/dev/null 2>&1 &
disown
echo "on" > "$STATE"

