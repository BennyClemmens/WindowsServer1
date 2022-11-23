# Scripts
In deze derde reeks zullen we enkele scripts schrijven. We gebruiken hiervoor de VM met Windows 10 die we aangemaakt hebben in het eerste labo van Windows Server I.

Gebruik voor deze reeks bij voorkeur de PowerShell ISE.

## Oefening 1: Uitschrijven zin in omgekeerde volgorde
Schrijf een script dat de gebruiker vraagt om een zin in te geven, en daarna deze zin uitschrijft in omgekeerde volgorde.
```
Wat wilt u herhaald zien worden in omgekeerde volgorde?
dit is een voorbeeld zin
Uw invoer in omgekeerde volgorde: niz dleebroov nee si tid
```

## Oefening 2: Zin splitsen in woorden
Schrijf een script dat aan de gebruiker vraagt om een zin in te geven. Vervolgens wordt het aantal woorden op het scherm getoond, waarna alle woorden onder elkaar uitgeschreven worden.
```
Waarvan wilt u het aantal woorden weten?
dit is een voorbeeld zin
Uw invoer heeft 5 woord(en).
Deze woorden zijn:
dit
is
een
voorbeeld
zin
```

## Oefening 3: Uitschrijven woorden in omgekeerde volgorde
Schrijf een script dat de gebruiker vraagt om een zin in te geven. Daarna schrijft het script de zin uit waarbij de woorden voorkomen in omgekeerde volgorde.

Waarvan wilt u de woorden in omgekeerde volgorde zien?
dit is een voorbeeld zin
De woorden van uw invoer in omgekeerde volgorde:
zin voorbeeld een is dit
Oefening 4: Rekenen met getallen
Schrijf een script dat 2 getallen vraagt aan de gebruiker. Vervolgens kan de gebruiker een bewerking selecteren (optellen, aftrekken, vermenigvuldigen of delen). Het script berekent dan het resultaat en toont de uitkomst op het scherm.

Wat is uw eerste getal?: 45
Uw eerste getal is 45
Wat is uw tweede getal?: 23
Uw tweede getal is 23
Maak een keuze uit de volgende bewerkingen:
    1. Optellen
    2. Aftrekken
    3. Vermenigvuldigen
    4. Delen
Uw keuze: 3

De uitkomst van de bewerking: 1035
Oefening 5: Getal raden
Schrijf een script dat een random getal genereert tussen 0 en 10. Vervolgens kan de gebruiker het getal raden. Het script schrijft uit of het te raden getal hoger of lager is, en de gebruiker kan een nieuwe poging doen. Wanneer het getal geraden is, schrijft het script uit hoeveel beurten de gebruiker nodig had om het getal te raden.

Wat is uw getal? 5
Uw getal is 5
Hoger!
Wat is uw getal? 8
Uw getal is 8
Lager!
Wat is uw getal? 6
Uw getal is 6
Hoger!
Wat is uw getal? 7
Uw getal is 7
Het te gokken getal was inderdaad 7, en u hebt het geraden in 4 beurt(en)
Oefening 6: Faculteit berekenen
Schrijf een script dat 1 getal vraagt aan de gebruiker. Vervolgens berekent het script de faculteit van dit getal (= product van de getallen 1 tot en met het ingegeven getal).

Waarvan wilt u de faculteit berekenen?: 7
7! = 5040
Oefening 7: Priemgetallen bepalen
Schrijf een script dat 1 getal vraagt aan de gebruiker. Vervolgens schrijft het script alle priemgetallen uit die bestaan tot aan het ingegeven getal.

Een priemgetal is een natuurlijk getal dat groter is dan 1, en enkel deelbaar is door 1 en zichzelf. Het kleinste priemgetal is dus 2, want het heeft alleen 1 en 2 als delers.

Tot waar wilt u priemgetallen zoeken?: 17
De volgende priemgetallen werden gevonden:
2
3
5
7
11
13
17
Het aantal priemgetallen dat werd gevonden is: 7
Oefening 8: service starten
Schrijf een script dat nakijkt of de iSCSI service is gestart. Indien dit niet het geval is, dan dient deze service te worden gestart. Hiervan dient melding te worden gemaakt. Geef ook een melding als de service wel al gestart was.

WARNING: Waiting for service 'Microsoft iSCSI Initiator Service (MSiSCSI)' to start...
iSCSI service gestart
Oefening 9: Aanmaken subdirectories
Maak een script dat aan volgende functionele eisen voldoet:

In een door de gebruiker gekozen directory op het C:\ volume (bijvoorbeeld C:\testmap) moeten submappen aangemaakt worden. Het bestaan van de hoofdmap wordt gecontroleerd, en er wordt bericht gegeven aan de eindgebruiker of de map reeds bestaat, of de map aangemaakt wordt.
De gebruiker moet via één of andere manier kunnen invoeren hoeveel submappen aangemaakt moeten worden (bij het oproepen van het script of door een vraag te stellen bij uitvoeren van het script).
De submappen dragen de naam van de hoger gelegen map met de string sub ervoor geplaatst en een nummer erachter.
Voor elke submap die aangemaakt wordt, wordt een log entry weggeschreven in het bestand C:\logs\mapcreatie.txt.
Elke log-entry geeft weer wat de naam van de aangemaakte submap is, en wat de datum en het tijdstip van aanmaak is.
In welke map wenst u submappen aan te maken?: dummy


    Directory: C:\


Mode                 LastWriteTime         Length Name                                       
----                 -------------         ------ ----                                      
d-----        25/09/2022     11:12                dummy
dummy werd aangemaakt, submappen kunnen aangemaakt worden
hoeveel submappen moeten er gemaakt worden?: 2
submap subdummy1 aangemaakt
submap subdummy2 aangemaakt

