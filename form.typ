// =============================================================================
// TEMPLATE FORM - Twain Residenza Artistica 2026
// =============================================================================

// Carica i dati dal file YAML
#let d = yaml("data.yaml")

// --- Configurazione Pagina ---
#set page(
  paper: "a4",
  margin: (top: 2cm, bottom: 2cm, left: 2cm, right: 2cm),
)

#set text(
  font: "Liberation Sans",
  size: 10pt,
  lang: "it",
)

#set par(justify: true)

// --- Header con Logo ---
#align(center)[
  #if "logo" in d and d.logo != "" {
    image("assets/" + d.logo, width: 4cm)
  } else {
    // Placeholder se non c'è logo
    box(
      width: 4cm,
      height: 1.5cm,
      stroke: 0.5pt + gray,
      align(center + horizon)[_Logo_]
    )
  }
]

#v(0.5cm)

// --- Titolo ---
#align(center)[
  #text(weight: "bold", size: 14pt)[CALL – Twain\_Residenza Artistica]
  #linebreak()
  #text(weight: "bold", size: 14pt)[2026]
  #linebreak()
  #v(0.3cm)
  #text(weight: "bold", size: 12pt)[DOMANDA DI PARTECIPAZIONE]
]

#v(0.3cm)

#align(center)[
  #text(size: 9pt)[
    La domanda di partecipazione va inviata all'indirizzo mail
    #link("mailto:residenza.twain@gmail.com")[residenza.twain\@gmail.com]
  ]
]

#v(0.5cm)

// --- Funzione per celle della tabella ---
#let cell(content) = table.cell(
  inset: 8pt,
  align: left + horizon,
  content
)

#let header-cell(content) = table.cell(
  inset: 8pt,
  align: left + horizon,
  fill: luma(245),
  text(weight: "medium", content)
)

// --- Funzioni helper per processare autori ---
#let get_autori_nomi_nascita() = {
  let items = ()
  for autore in d.autori {
    items.push([• #autore.nome_cognome (#autore.luogo_data_nascita)])
  }
  items.join(linebreak())
}

#let get_interpreti() = {
  if d.interpreti == "autori" {
    d.autori.map(a => a.nome_cognome).join(", ")
  } else {
    d.interpreti
  }
}

#let get_link_precedenti() = {
  let items = ()
  for autore in d.autori {
    let links_str = autore.link.join(", ")
    items.push([*#autore.nome_cognome:*\ #links_str])
  }
  items.join([\ \ ])
}

#let get_credits() = {
  let items = ()
  for autore in d.autori {
    items.push(autore.credits)
  }
  items.join([\ ])
}

#let get_sito_artista() = {
  for autore in d.autori {
    if "artista_compagnia" in autore and autore.artista_compagnia {
      return autore.link.at(0)
    }
  }
  return ""
}

#let get_ragione_sociale() = {
  [Associazione Culturale #d.ragione_sociale.nome_associazione - Legale Rappresentante: #d.ragione_sociale.rappresentante_legale]
}

// --- Tabella Principale ---
#table(
  columns: (35%, 65%),
  stroke: 0.5pt + black,
  
  header-cell[Nome Artista/Compagnia], cell[#d.artista_compagnia],
  header-cell[Titolo del progetto], cell[#d.titolo_progetto],
  header-cell[Nome/i autore/i e luogo e data di nascita], cell[#get_autori_nomi_nascita()],
  header-cell[Nominativi interpreti], cell[#get_interpreti()],
  
  // Blocco Referente con rowspan
  table.cell(rowspan: 4, inset: 8pt, align: left + horizon, fill: luma(245))[
    #text(weight: "medium")[Referente progetto]
  ],
  cell[*Cognome:* #d.referente.cognome],
  cell[*Nome:* #d.referente.nome],
  cell[*Telefono:* #d.referente.telefono],
  cell[*E-mail:* #d.referente.email],
  
  header-cell[Città di provenienza Artista/Compagnia], cell[#d.citta_provenienza],
  header-cell[Link video progetto proposto], cell[#d.link_video],
  header-cell[Eventuali link precedenti lavori già realizzati], cell[#get_link_precedenti()],
  header-cell[Sito o Fb della Artista/Compagnia], cell[#get_sito_artista()],
  header-cell[Eventuali tappe di lavoro e date (residenze, anteprime, presentazioni di studi) già svolte o da svolgere], cell[#d.tappe_lavoro],
  header-cell[Credits], cell[#get_credits()],
  header-cell[Ragione Sociale e nome legale rappresentante del soggetto (associazione, cooperativa, fondazione, etc) che emetterà fattura e fornirà Agibilità Ex-Enpals], cell[#get_ragione_sociale()],
  header-cell[Eventuali testi tutelati dalla S.I.A.E.], cell[#d.testi_siae],
  header-cell[Eventuali musiche tutelate dalla S.I.A.E.], cell[#d.musiche_siae],
  header-cell[Eventuali coreografie tutelate dalla S.I.A.E.], cell[#d.coreografie_siae],
  header-cell[Dichiarazione disponibilità marzo 2026], cell[#d.disponibilita_marzo_2026],
)

#v(1cm)

// --- Testo Legale ---
#text(size: 9pt)[
  Accetto di partecipare alla Call – Twain\_Residenza Artistica 2026 e dichiaro di accettare le condizioni poste da essa.

  La presente scheda, compilata in ogni sua parte, dovrà essere consegnata assieme al materiale richiesto. La firma implica la completa accettazione del regolamento del Bando.

  Dichiaro di rendermi responsabile del contenuto del materiale presentato e ne autorizzo la pubblicazione senza scopo di lucro. In base a quanto stabilito dal D.Lgs. n. 196/2003 l'autore autorizza il trattamento dei dati personali e la loro utilizzazione da parte degli organizzatori per lo svolgimento degli adempimenti inerenti al Bando.
]

#v(1.5cm)

// --- Firma ---
#grid(
  columns: (1fr, 1fr),
  gutter: 2cm,
  [
    *Data e Luogo*
    #v(0.3cm)
    #d.data_luogo_firma
  ],
  [
    *Firma*
    #v(0.3cm)
    #line(length: 100%, stroke: 0.5pt + black)
  ]
)
