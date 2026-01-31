# FPSBoost (World of Warcraft Addon)

FPSBoost ist ein kleines World of Warcraft Addon, das Quest-Watches (inklusive versteckter Quests) aus dem Questlog entfernt. Dadurch wird der Quest‑Tracker‑Overhead reduziert, was auf vielen Charakteren spürbar höhere FPS bringen kann.

## Was macht das Addon?

- Entfernt Quest‑Watches aus dem Questlog
- Optional nur für versteckte Quests
- Setzt die Super‑Tracked Quest zurück

Das Addon greift **keine** Questdaten an und löscht **keine** Quests. Es entfernt ausschließlich die “Watch”-Markierung (Tracked/Untracked).

## Warum kann das FPS verbessern?

Wenn viele Quests (auch versteckte) als “watched” markiert sind, muss der Client diese regelmäßig verarbeiten: Tracker‑Updates, Sortierung, UI‑Refresh und event‑basierte Logik. Das erzeugt in bestimmten Situationen spürbaren Overhead. Durch das Entwatchen wird dieser Aufwand reduziert.

## Installation

1. World of Warcraft beenden.
2. Den Ordner `FPSBoost` nach `World of Warcraft/_retail_/Interface/AddOns/` kopieren.
3. Spiel starten und im Addon‑Menü sicherstellen, dass **FPSBoost** aktiviert ist.

## Verwendung

Im Chat:

- `/fpsboost`  
  Entfernt alle Quest‑Watches.

- `/fpsboost all`  
  Entfernt alle Quest‑Watches (gleich wie ohne Parameter).

- `/fpsboost hidden`  
  Entfernt nur die Watches von versteckten Quests.

Nach dem Ausführen solltest du im Questlog sehen, dass alle tracked Quests entfernt wurden.

## Kompatibilität

- World of Warcraft Retail (Interface 120000, 120001)

## Dateien

- `FPSBoost.toc` – Addon‑Metadaten
- `FPSBoost.lua` – Addon‑Logik

## Hinweise

- Das Addon verändert keine Quest‑Fortschritte.
- Es ist sicher jederzeit erneut ausführbar.
- Wenn du viele Addons hast, die Questdaten permanent abfragen, kann der Effekt je nach Setup variieren.

## Lizenz

Private Nutzung. Falls du eine spezifische Lizenz wünschst, ergänze diese hier.
