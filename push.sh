#!/usr/bin/env bash
# Aendert nichts an den Dateien — nimmt nur auf, was gerade im Ordner liegt,
# und schiebt es zu GitHub. Beim ersten Lauf fragt macOS einmal nach der
# GitHub-Anmeldung und merkt sie sich im Schluesselbund.
set -euo pipefail
cd "$(dirname "$0")"

nachricht="${1:-Aktualisierung der Website-Dateien}"

git add -A
if git diff --cached --quiet; then
  echo "Keine Aenderungen — es gibt nichts zu committen."
else
  git commit -m "$nachricht"
  echo "Commit angelegt: $nachricht"
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  echo
  echo "Noch kein Remote gesetzt. Einmalig ausfuehren:"
  echo "  git remote add origin https://github.com/qivox1/tierimmobilien-website.git"
  exit 1
fi

git push -u origin main
echo
echo "Fertig — der Stand liegt auf GitHub."
