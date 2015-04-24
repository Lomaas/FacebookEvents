# Agenda

- XCode + Storyboard
- Swift basics
- App med integrasjon mot Facebook

---

# Oppgave - Playground

1. Skriv ut navnet til alle spillerne
2. Sorter spillerene basert på hvilken score de har. Høyest score først
3. Hent ut et Array med alle spillere som har score > 7
	- Hint: Array har en funksjon som heter 'filter'
4. Skalaen for score skal endres:
	- Bruk 'map' til å lage en ny liste hvor de eksisterende spillerne har fått scoren sin ganget med 10

---

# Last ned prosjekt fra GitHub

- https://github.com/Lomaas/FacebookEvents

---

# Oppgave - Events fra Facebook

- Populer TableView med events fra Facebook
	- Bruk EventService.fetchEvents

---


# Oppgave - TableViewCell

1. Vis mer info i hver celle.  
	- Lokasjon
	- Vis dato
2. Bruk autolayout

---

# Oppgave - DetailsView

1. Hente ut mer informasjon om eventen ved bruk av event IDen. Gjør et nettverkskall med EventService.fetchEvent
2. Vis lokasjonen på et kart ved bruk av MapKit View
3. Vis annen basic informasjon

---

# Oppgave - Søk

1. Lag søk. Brukeren skal kunne søke på en lokasjon hvor han vil hente events fra. F. eks "Tromsø"
2. Tips:
    - Lag en ny ViewController med Text Field for søketeksten 
    - Implementer UITextFieldDelegate
    - Bruk delegates for å sende søkestrengen tilbake til TableViewController

---

# iOS-kurs på Stanford

- https://itunes.apple.com/us/course/developing-ios-8-apps-swift/id961180099

---

# Kontakt

- aleksander.hindenes@bekk.no
- simen.johannessen@bekk.no
- havard.heggheim@bekk.no