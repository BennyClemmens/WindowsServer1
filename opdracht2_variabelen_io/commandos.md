# Variabelen, invoer en uitvoer
In deze tweede reeks zullen we enkele oefeningen maken op het gebruik van variabelen, invoer en uitvoer. We gebruiken hiervoor de VM met Windows 10 die we aangemaakt hebben in het eerste labo van Windows Server I.

Je mag voor deze reeks rechtstreeks werken in een PowerShell prompt (dus geen PowerShell ISE nodig).

## A. Variabelen

1. Maak een variabele aan die alle lokale gebruikers bevat. Gebruik nadien deze variabele om na te gaan hoeveel lokale gebruikers er bestaan binnen jouw Windows omgeving.
```
$gebruikers = Get-LocalUser
echo ${gebruikers}
Write-Host $gebruikers
$gebruikers.Count
Get-Member -InputObject $gebruikers
$gebruikers.Length
```

2. Maak twee variabelen en geef deze als waarde een random getal tussen 0 en 99 (grenzen inbegrepen) – gebruik hiervoor het commando Get-Random. Bereken nadien de som en het product van deze twee getallen.
```
$varA = Get-Random -Maximum 100
$varB = Get-Random -Maximum 100
Write-Host "${varA} + ${varB} = $(${varA} + ${varB})"
Write-Host "${varA} * ${varB} = $(${varA} * ${varB})"
```

3. Vraag een lijst op van alle variabelen. Verwijder alle variabelen die je aangemaakt hebt in de vorige twee vragen. Controleer nadien of de variabelen inderdaad verdwenen zijn uit de lijst.
```
Get-Variable var*,gebr*
ls variable:var*,variable:gebr*
del Variable:varA
Remove-Variable varB
Remove-Variable -name gebruikers
ls variable:var*,variable:gebr*
```

4. Maak twee variabelen aan, geef de eerste variabele een random waarde tussen 50 en 99 en de tweede variabele een random waarde tussen 5 en 9 (telkens grenzen inbegrepen). Bereken de rest bij deling van de waarde van de eerste variabele gedeeld door de waarde van de tweede variabele.
```
$var1 = Get-Random -Minimum 50 -Maximum 100
$var12 = Get-Random -Minimum 5 -Maximum 10
Write-Host "rest = ${var1} % ${var2} = $(${var1} % ${var2})"
```

5. Hergebruik de twee variabelen van de vorige oefening. Controleer via powershell of de eerste variabele strikt groter is dan de tweede variabele.
```
$var1 -gt $var2
```

## B. Invoer en uitvoer

1. Vraag de gebruiker om zijn naam in te geven, en bewaar deze in een variabele. Schrijf nadien de naam van de gebruiker uit in hoofdletters (capitals).
```
$naam = Read-Host -Prompt "naam: "
Write-Host ("hallo", ${naam}.ToUpper())
```

2. Vraag de gebruiker om een willekeurige zin in te geven. Schrijf nadien op het scherm hoeveel letters deze zin bevat.
```
$zin = Read-Host -Prompt "zin: "
$zin.length
write-host ("de zin bevat", (measure -Character -IgnoreWhiteSpace -InputObject $zin).Characters, "karakter(s), spaties weggefilterd")
```


3. Vraag de gebruiker om een willekeurige zin in te geven. Schrijf nadien op het scherm hoeveel woorden deze zin bevat.
```
$zin = Read-Host -Prompt "zin: "
write-host ("woorden: ", (measure -word -InputObject $zin).words)
$zin.Split().length
```

4. Maak een array aan met naam weekdagen waarin je de dagen van de week bewaard. Schrijf deze nadien uit op het scherm.
```
[string[]] $weekdagen = "maandag", "dinsdag", "woensdag", "donderdag", "vrijdag", "zaterdag", "zondag"
$weekdagen
Write-Host $weekdagen
$week = @("ma","di","wo","do","vr","za","zo")
```

5. Gebruik de variabele van de vorige vraag, maar schrijf ditmaal de dagen van de week uit op één lijn, gescheiden door een deelteken (Dus: maandag - dinsdag - ...)
```
Write-Host $weekdagen -noNewline -Separator ' - '
$weekdagen -join ' - '
```

6. Idem als de vorige vraag, maar maak gebruik van de range operator (..) om enkel de werkdagen op het scherm te schrijven (dus: maandag - ... - vrijdag)
```
$weekdagen[0..4] -join ' - '
```

7. Schrijf een warning op het scherm, de boodschap mag je zelf kiezen.
```
Write-Warning -Message "-message mag weggelatgen worden"
```

8. Schrijf Hello World op het scherm, maar zorg dat de tekst rood is met een groene achtergrond.
```
Write-Host "hello world" -ForegroundColor red -BackgroundColor green
```

9. Haal een overzicht op van alle netwerkkaarten in jouw VM, en schrijf de uitvoer weg naar een (plaintext) bestand. Lees dit bestand nadien in en schrijf de inhoud van dit bestand op het scherm.
```
Get-NetAdapter | Out-File netwerkadapters.txt
Get-Content .\netwerkadapters.txt                                                                                                                                                                                    
```

10. Idem als de vorige vraag, maar maak nu gebruik van een CSV voor wegschrijven van de netwerkkaarten. Lees daarna de CSV in, en schrijf op het scherm hoeveel netwerkkaarten jouw VM bevat.  
**`wegens maar 1 netwerkkaart hier users gepakt`**
```
Get-LocalUser | Export-Csv users.csv
$gebruikers = Import-Csv .\users.csv
$gebruikers.Count
```
