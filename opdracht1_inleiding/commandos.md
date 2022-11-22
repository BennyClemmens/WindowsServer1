# Inleiding PowerShell
In deze eerste reeks zullen we de commando’s van PowerShell verkennen. We gebruiken hiervoor de VM met Windows 10 die we aangemaakt hebben in het eerste labo van Windows Server I.

Je mag voor deze reeks rechtstreeks werken in een PowerShell prompt (dus geen PowerShell ISE nodig).

## A. Basisconcepten

1. Voer het commando Get-Help uit (zonder parameters). Welke parameter kan je gebruiken bij dit commando om de Online versie van een helppagina in de browser te openen? Test dit uit.
```
get-help
get-help get-help -online
```

2. Ga op zoek naar het commando uit om de help files van het internet te downloaden en installeren. Voer dit commando uit.
```
Update-help
```

3. Toon de Help voor het commando Get-Alias (output in terminal). Toon hierbij de volledige (“full”) output inclusief voorbeelden. Welke parameters zijn verplicht bij gebruik van het commando Get-Alias?
```
get-help get-alias
```
**`geen verplichte argumenten`**
```
get-help get-alias -full
```

4. Toon een overzicht van alle werkwoorden die gebruikt worden binnen commando’s in PowerShell.
```
get-verb
```

5. Idem als vorige vraag, maar toon enkel werkwoorden die ergens de letter X in de naam hebben
```
get-verb *x*
```

6. Toon een overzicht van alle commando’s die ingeladen zijn.
```
get-command
```

7. Toon een overzicht van alle commando’s die beginnen met Get- en ergens User in de naam hebben
```
Get-Command get-*user*
```

8. Toon een overzicht van alle PowerShell providers die momenteel ingeladen zijn
```
Get-PSProvider
```

De pipeline (“|”) kan gebruikt worden om het resultaat van een commando door te geven aan een volgend commando. De pipeline is bijvoorbeeld heel nuttig om te filteren op bepaalde waarden van properties door gebruik te maken van where. Een fictief voorbeeld:
```
Get-... | where {$_.someproperty -eq ‘abc’}
```
Bij uitvoeren van dit commando zullen enkel de objecten getoond worden waarbij someproperty de waarde abc heeft.

9. Maak gebruik van de pipeline in combinatie met where om enkel werkwoorden te tonen uit de common groep.
```
get-verb | Get-Member
get-verb | where {$_.group -eq 'common'}
```

10. Geef een overzicht van alle commando’s die als CommandType de waarde Alias hebben.
```
get-command | get-member
get-command | where {$_.CommandType -eq 'alias'}
```

11. Vraag een overzicht op van alle commando’s die je reeds uitgevoerd hebt.
```
Get-History
```

## B. Getters en Setters

1. Vraag de huidige werkdirectory op via een Get commando.
```
get-location
```

2. Wijzig de huidige werkdirectory naar C:\Users via een Set commando.
```
Set-Location c:\users
```

3. Vraag de huidige datum en tijdstip op via een Get commando.
```
get-date
```

4. Idem als de vorige vraag, maar in het jaar 2019.
```
get-date -Year 2019
```

5. Gebruik hetzelfde Get commando om na te gaan welke dag van de week 1/1/2000 was.
```
Get-Date -Day 1 -Month 1 -Year 2000
get-date 2000-01-01
```

6. Vraag een overzicht op van alle disks die gekend zijn binnen Windows.
```
Get-Disk
```

7. Vraag een overzicht op van alle partities die gekend zijn binnen Windows.
```
Get-Partition
```

8. Vraag een overzicht op van alle lokale gebruikers.
```
Get-LocalUser
```

9. Vraag een overzicht op van alle lokale gebruikers die niet actief zijn.
```
Get-LocalUser | where {$_.enabled -eq ${False} }
```

10. Vraag een overzicht op van alle IP-adressen die gebruikt worden op jouw VM.
```
(Get-NetIPAddress).IPAddress
(Get-NetIPAddress | where {$_.AddressFamily -eq 'IPv4'}).IPAddress
write-host (Get-NetIPAddress | where {$_.AddressFamily -eq 'IPv4'}).IPAddress
Get-NetIPAddress
```

11. Vraag een overzicht op van alle netwerkkaarten in jouw VM.
```
Get-NetAdapter
```

12. Idem als de vorige vraag, maar sorteer deze op basis van het MAC adres. Gebruik hiervoor een pipeline in combinatie met Sort.
```
Get-NetAdapter| Sort MacAddress
```
**`een beter voorbeeld:`**
```
Get-LocalUser| sort Enabled
```

13. Idem als de vorige vraag, maar sorteer de interfaces op basis van de ifIndex in aflopende volgorde.
**`een beter voorbeeld:`**
```
Get-LocalUser| sort Name -Descending
```