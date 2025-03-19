# 📌 Neovim Shortcuts & Befehle

Diese Liste enthält allgemeine **Neovim-Shortcuts** sowie spezifische Befehle für deine installierten Plugins.

---

## 🔹 Allgemeine Befehle
| Befehl                | Beschreibung                      |
|-----------------------|-----------------------------------|
| `:help {keyword}`     | Hilfe anzeigen                    |
| `:w`                  | Datei speichern                   |
| `:q`                  | Neovim schließen                  |
| `:wq` oder `:x`       | Speichern und schließen           |
| `:q!`                 | Ohne Speichern schließen          |
| `:e {datei}`          | Datei öffnen                      |
| `:saveas {dateiname}` | Datei unter neuem Namen speichern |
| `:terminal`           | Terminal öffnen                   |
| `:split`              | Horizontales Fenster öffnen       |
| `:vsplit`             | Vertikales Fenster öffnen         |
|                                                           |
|-----------------------------------------------------------|

## 🎯 Bewegung im Text
| Tastenkombination | Beschreibung                              |
|-------------------|-------------------------------------------|
| `h`               | Cursor nach links                         |
| `j`               | Cursor nach unten                         |
| `k`               | Cursor nach oben                          |
| `l`               | Cursor nach rechts                        |
| `w`               | Zum nächsten Wort springen                |
| `b`               | Zum vorherigen Wort springen              |
| `e`               | Zum Ende des aktuellen Wortes springen    |
| `0`               | Zum Anfang der Zeile springen             |
| `^`               | Zum ersten Zeichen der Zeile springen     |
| `$`               | Zum Ende der Zeile springen               |
| `gg`              | Zur ersten Zeile springen                 |
| `G`               | Zur letzten Zeile springen                |
| `{zahl}G`         | Zu Zeile `{zahl}` springen                |
|                                                               |
|---------------------------------------------------------------|

## 📜 Scrollen
| Tastenkombination | Beschreibung                      |
|-------------------|-----------------------------------|
| `Ctrl-u`          | Halbe Seite nach oben scrollen    |
| `Ctrl-d`          | Halbe Seite nach unten scrollen   |
| `Ctrl-b`          | Ganze Seite nach oben scrollen    |
| `Ctrl-f`          | Ganze Seite nach unten scrollen   |
| `zz`              | Cursor-Zeile zentrieren           |
| `zt`              | Cursor-Zeile oben positionieren   |
| `zb`              | Cursor-Zeile unten positionieren  |
|                                                       |
|-------------------------------------------------------|

## 🔲 Fensterverwaltung
| Tastenkombination | Beschreibung |
|------------------|-------------|
| `Ctrl-w h`      | Zum linken Fenster wechseln |
| `Ctrl-w j`      | Zum unteren Fenster wechseln |
| `Ctrl-w k`      | Zum oberen Fenster wechseln |
| `Ctrl-w l`      | Zum rechten Fenster wechseln |
| `Ctrl-w s`      | Horizontales Fenster öffnen |
| `Ctrl-w v`      | Vertikales Fenster öffnen |
| `Ctrl-w q`      | Fenster schließen |
| `Ctrl-w =`      | Fenstergrößen ausgleichen |

---

## ✍️ Textbearbeitung
| Tastenkombination | Beschreibung |
|------------------|-------------|
| `i`             | Einfügen vor dem Cursor |
| `I`             | Einfügen am Anfang der Zeile |
| `a`             | Einfügen nach dem Cursor |
| `A`             | Einfügen am Ende der Zeile |
| `o`             | Neue Zeile unterhalb einfügen |
| `O`             | Neue Zeile oberhalb einfügen |
| `Esc`           | Einfügemodus verlassen |
| `x`             | Zeichen unter Cursor löschen |
| `X`             | Zeichen links vom Cursor löschen |
| `dd`            | Ganze Zeile löschen |
| `D`             | Löschen bis zum Zeilenende |
| `yy`            | Ganze Zeile kopieren |
| `yw`            | Wort kopieren |
| `p`             | Nach Cursor einfügen |
| `P`             | Vor Cursor einfügen |

---

## 🔍 Suchen und Ersetzen
| Tastenkombination | Beschreibung |
|------------------|-------------|
| `/{muster}`     | Vorwärts nach Muster suchen |
| `?{muster}`     | Rückwärts nach Muster suchen |
| `n`             | Zum nächsten Suchergebnis |
| `N`             | Zum vorherigen Suchergebnis |
| `:%s/alt/neu/g` | Alle Vorkommen ersetzen |

---

## 🚀 Plugins & Erweiterungen

### 📂 **nvim-tree.lua (Dateibrowser)**
| Tastenkombination | Beschreibung |
|------------------|-------------|
| `<leader>e`     | Datei-Explorer öffnen/schließen |

### 🔍 **telescope.nvim (Fuzzy Finder)**
| Tastenkombination | Beschreibung |
|------------------|-------------|
| `<leader>ff`    | Dateien suchen |
| `<leader>fg`    | In Dateien suchen |
| `<leader>fb`    | Offene Buffers durchsuchen |

### 📝 **nvim-cmp (Autovervollständigung)**
| Tastenkombination | Beschreibung |
|------------------|-------------|
| `Ctrl-Space`    | Vorschläge anzeigen |
| `Tab`           | Vorschlag auswählen |
| `Shift-Tab`     | Zum vorherigen Vorschlag wechseln |

### 📜 **LSP & Syntax (mason.nvim, nvim-lspconfig)**
| Tastenkombination | Beschreibung |
|------------------|-------------|
| `gd`            | Gehe zur Definition |
| `gr`            | Finde Referenzen |
| `K`             | Dokumentation anzeigen |
| `<leader>rn`    | Variable umbenennen |

### 📌 **gitsigns.nvim & vim-fugitive (Git-Integration)**
| Tastenkombination | Beschreibung |
|------------------|-------------|
| `<leader>gs`    | Git-Status anzeigen |
| `<leader>gc`    | Commit erstellen |
| `<leader>gp`    | Push zu Remote-Repository |

### 🖊️ **comment.nvim (Kommentarfunktion)**
| Tastenkombination | Beschreibung |
|------------------|-------------|
| `gcc`           | Zeile kommentieren/entkommentieren |
| `gc{Bewegung}`  | Bereich kommentieren |

### 🎨 **which-key.nvim (Keybinding-Hilfe)**
| Tastenkombination | Beschreibung |
|------------------|-------------|
| `<leader>`      | Keybinding-Menü öffnen |

---

## 🗂️ Tabs
| Tastenkombination | Beschreibung |
|------------------|-------------|
| `:tabnew`       | Neuer Tab |
| `gt`           | Zum nächsten Tab wechseln |
| `gT`           | Zum vorherigen Tab wechseln |
| `:tabclose`    | Aktuellen Tab schließen |

---

## 🎨 UI-Einstellungen
| Befehl                 | Beschreibung |
|------------------------|-------------|
| `:colorscheme tokyonight` | Farbschema auf TokyoNight setzen |
| `:set number`         | Zeilennummern aktivieren |
| `:set relativenumber` | Relative Zeilennummern aktivieren |

---

## 📜 Speichern als Datei:
Speichere diesen Inhalt als **`nvim_shortcuts.md`** und öffne ihn mit Markdown-Editoren oder Neovim selbst.

📌 **Diese Liste ist speziell an deine NixOS `nvim.nix`-Konfiguration angepasst!** 🚀

