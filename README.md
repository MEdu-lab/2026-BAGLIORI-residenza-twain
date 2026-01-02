# 📄 Form Generator

Template repository per generare form PDF da dati YAML usando [Typst](https://typst.app/).

## 🚀 Quick Start

1. **Usa questo repo come template** → clicca "Use this template" su GitHub
2. **Modifica `data.yaml`** con i tuoi dati
3. **Aggiungi il logo** in `assets/logo.png` (opzionale)
4. **Push** → il PDF viene generato automaticamente

## 📁 Struttura

```
.
├── data.yaml           # ← I TUOI DATI (modifica questo!)
├── form.typ            # Template Typst
├── assets/
│   └── logo.png        # Logo header (opzionale)
├── output/
│   └── form.pdf        # PDF generato
└── .github/
    └── workflows/
        └── build.yml   # GitHub Action (Alpine Linux)
```

## 📝 Compilare in locale

### Prerequisiti
- [Typst](https://github.com/typst/typst/releases) installato

### Comandi

```bash
# Compila una volta
typst compile form.typ output/form.pdf

# Watch mode (ricompila automaticamente)
typst watch form.typ output/form.pdf
```

## 🌐 GitHub Pages

Dopo il primo push, attiva GitHub Pages:

1. Vai su **Settings** → **Pages**
2. Source: **GitHub Actions**
3. Il PDF sarà disponibile su `https://<user>.github.io/<repo>/`

## 🎨 Personalizzazione

### Cambiare il logo

Sostituisci `assets/logo.png` con il tuo logo. Nel `data.yaml` aggiungi:

```yaml
logo: "logo.png"
```

### Cambiare font

Nel file `form.typ`, modifica:

```typst
#set text(
  font: "Liberation Sans",  // ← cambia qui
  size: 10pt,
)
```

Font disponibili su Alpine: `font-liberation`, `font-dejavu`, `font-noto`.

### Aggiungere campi

1. Aggiungi il campo in `data.yaml`
2. Aggiungi la riga corrispondente nella tabella in `form.typ`

## 📋 Campi del form Twain

| Campo | Tipo | Descrizione |
|-------|------|-------------|
| `artista_compagnia` | string | Nome artista o compagnia |
| `titolo_progetto` | string | Titolo del progetto |
| `autori` | string | Nome/i autore/i |
| `referente.cognome` | string | Cognome referente |
| `referente.nome` | string | Nome referente |
| `referente.telefono` | string | Telefono referente |
| `referente.email` | string | Email referente |
| ... | ... | Vedi `data.yaml` per tutti i campi |

## 🔧 Tecnologie

- **[Typst](https://typst.app/)** - Linguaggio di markup moderno per documenti
- **[Alpine Linux](https://alpinelinux.org/)** - Container leggero per CI/CD veloce
- **[GitHub Actions](https://github.com/features/actions)** - Build automatizzate
- **[GitHub Pages](https://pages.github.com/)** - Hosting del PDF

## 📄 Licenza

MIT
