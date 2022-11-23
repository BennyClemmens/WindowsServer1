# Variabelen, invoer en uitvoer
In deze tweede reeks zullen we enkele oefeningen maken op het gebruik van variabelen, invoer en uitvoer. We gebruiken hiervoor de VM met Windows 10 die we aangemaakt hebben in het eerste labo van Windows Server I.

Je mag voor deze reeks rechtstreeks werken in een PowerShell prompt (dus geen PowerShell ISE nodig).

## A. Variabelen

1. Maak een variabele aan die alle lokale gebruikers bevat. Gebruik nadien deze variabele om na te gaan hoeveel lokale gebruikers er bestaan binnen jouw Windows omgeving.

2. Maak twee variabelen en geef deze als waarde een random getal tussen 0 en 99 (grenzen inbegrepen) – gebruik hiervoor het commando Get-Random. Bereken nadien de som en het product van deze twee getallen.

3. Vraag een lijst op van alle variabelen. Verwijder alle variabelen die je aangemaakt hebt in de vorige twee vragen. Controleer nadien of de variabelen inderdaad verdwenen zijn uit de lijst.

4. Maak twee variabelen aan, geef de eerste variabele een random waarde tussen 50 en 99 en de tweede variabele een random waarde tussen 5 en 9 (telkens grenzen inbegrepen). Bereken de rest bij deling van de waarde van de eerste variabele gedeeld door de waarde van de tweede variabele.

5. Hergebruik de twee variabelen van de vorige oefening. Controleer via powershell of de eerste variabele strikt groter is dan de tweede variabele.

## B. Invoer en uitvoer

1. Vraag de gebruiker om zijn naam in te geven, en bewaar deze in een variabele. Schrijf nadien de naam van de gebruiker uit in hoofdletters (capitals).

2. Vraag de gebruiker om een willekeurige zin in te geven. Schrijf nadien op het scherm hoeveel letters deze zin bevat.

3. Vraag de gebruiker om een willekeurige zin in te geven. Schrijf nadien op het scherm hoeveel woorden deze zin bevat.

4. Maak een array aan met naam weekdagen waarin je de dagen van de week bewaard. Schrijf deze nadien uit op het scherm.

5. Gebruik de variabele van de vorige vraag, maar schrijf ditmaal de dagen van de week uit op één lijn, gescheiden door een deelteken (Dus: maandag - dinsdag - ...)

6. Idem als de vorige vraag, maar maak gebruik van de range operator (..) om enkel de werkdagen op het scherm te schrijven (dus: maandag - ... - vrijdag)

7. Schrijf een warning op het scherm, de boodschap mag je zelf kiezen.

8. Schrijf Hello World op het scherm, maar zorg dat de tekst rood is met een groene achtergrond.

9. Haal een overzicht op van alle netwerkkaarten in jouw VM, en schrijf de uitvoer weg naar een (plaintext) bestand. Lees dit bestand nadien in en schrijf de inhoud van dit bestand op het scherm.

10. Idem als de vorige vraag, maar maak nu gebruik van een CSV voor wegschrijven van de netwerkkaarten. Lees daarna de CSV in, en schrijf op het scherm hoeveel netwerkkaarten jouw VM bevat.