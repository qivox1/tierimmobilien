# Tierimmobilien — Website-Relaunch (Entwurf)

Statischer HTML-Entwurf für den Relaunch von [tierimmobilien.com](https://tierimmobilien.com).
Hochwertige Hühnerhäuser aus Holz, gefertigt von Dennis Bröker.

**Stand:** August 2026 · **Status:** Präsentationsentwurf, noch nicht livegang-fertig
(siehe „Offene Punkte“ am Ende).

## Ansehen

Kein Build, kein Paketmanager, keine Abhängigkeiten aus dem Netz.

- **Schnell:** `index.html` im Browser öffnen.
- **Sauber** (empfohlen, weil relative Pfade und Anker sich genau wie auf dem Server verhalten):

  ```bash
  python3 -m http.server 8000
  # http://localhost:8000
  ```

- **GitHub Pages:** Repository-Einstellungen → Pages → Branch `main`, Ordner `/ (root)`.
  Die Datei `.nojekyll` liegt bereits bei.

## Seiten

| Datei | Inhalt |
|---|---|
| `index.html` | Startseite — Hero mit drei wechselnden Motiven, Modellraster, Manufaktur, Farbkonfigurator, Zubehör, Kundenstimmen, Ratgeber, Kontakt |
| `modelle.html` | Modellseite für **alle neun Modelle** — das Modell wird über den URL-Anker gewählt: `modelle.html#karl`, `#walter`, `#johanna` … |
| `ratgeber/winterfester-huehnerstall.html` | Musterbeitrag „Winterfester Hühnerstall“ inklusive FAQ-Block |

Die neun Modelle in fester Reihenfolge: Johanna · Laura · Moni · Lena · Steffi · Anne ·
Walter (Bestseller) · Karl (Flaggschiff) · Patrick (Neu).

## Aufbau

```
index.html
modelle.html
ratgeber/winterfester-huehnerstall.html
assets/
  dc-runtime.js               Renderer des Design-Exports
  react.production.min.js     React 18.3.1 (UMD)
  react-dom.production.min.js
  fonts/                      Instrument Serif · Instrument Sans · IBM Plex Mono (woff2)
bilder/                       Produktfotos, JPEG
favicon.svg
```

Jede Seite ist eine eigenständige HTML-Datei: Auszeichnung, Inhalt und Logik stehen
darin, Bilder und Schriften werden über eine Ressourcenkarte im Kopf der Datei
(`window.__resources`) auf die Dateien in `bilder/` und `assets/fonts/` gemappt.

**Keine externen Anfragen.** Schriften und React liegen lokal — keine Google-Fonts-
und keine CDN-Verbindung, damit datenschutzrechtlich nichts nachzurüsten ist.

## Inhalte ändern

- **Texte, Preise, Beschreibungen:** stehen im `<script type="text/x-dc">`-Block am Ende
  jeder HTML-Datei, in gut lesbaren Objektlisten (`models`, `beitraege`, `faq`, `voices` …).
- **Bilder austauschen:** Datei in `bilder/` mit gleichem Namen ersetzen. Die Zuordnung
  steht in `window.__resources` im Kopf der jeweiligen Seite. Seitenverhältnisse:
  Hero 21:9, Modellkarten 4:5 bzw. 4:3, Karl-Karte 21:9.
- **Farben und Typografie:** Design-Tokens sind im Projekt-`CLAUDE.md` eine Ebene höher
  dokumentiert. Grün (`#3D5A3E`) ist Akzentfarbe, nie Fläche.

## Bekannte Punkte

- In der Browser-Konsole erscheinen beim Laden drei 404-Meldungen für `{{ heroImg }}` und
  zwei Hinweise zu `{{ navLogoPx }}`. Der Browser sieht kurz die noch nicht ausgewertete
  Vorlage, bevor der Renderer sie ersetzt. Ohne Auswirkung auf die Darstellung.
- Die Navigation schaltet unter 900 px Fensterbreite auf ein Burger-Menü. Der Umschaltpunkt
  liegt in der Logik, nicht in einer CSS-Media-Query — der Design-Export arbeitet
  ausschließlich mit Inline-Styles, die jede Stylesheet-Regel überschreiben würden.

## Offene Punkte vor dem Livegang

- [ ] **Impressum, Datenschutz und AGB** — verlinkt, aber noch ohne Seite
- [ ] **Kundenstimmen** sind Beispieltexte und dürfen so nicht veröffentlicht werden
- [ ] **Ratgeber:** ein Musterbeitrag steht, zwei weitere Themen sind nur angelegt;
      Inhalt fachlich mit der Werkstatt abstimmen
- [ ] **Kontaktformular** — der CTA verweist derzeit auf E-Mail und WhatsApp
- [ ] Kapazitätsangaben und Modelltexte gegen die Live-Seite gegenprüfen
- [ ] Entscheidung über den Ziel-Stack (statisch bleiben oder in ein CMS überführen)

## Kontakt

Dennis Bröker · planung@tierimmobilien.com · WhatsApp +49 162 6184155
