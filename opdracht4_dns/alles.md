# DNS
In deze vierde reeks zullen we enkele scripts schrijven om DNS te beheren. We schrijven eerst enkele scripts voor onze client (gebruik hiervoor de VM met Windows 10) en vervolgens enkele scripts voor het beheer van onze DNS server (= VM met Windows Server).

## DNS Client
1. Schrijf een script dat de huidige ingestelde DNS-servers uitschrijft naar het scherm. Toon . hierbij enkel de DNS servers voor de LAN interface, en enkel voor IPv4.  
***`opdracht4_A_1a`***
```
<#
    1. Schrijf een script dat de huidige ingestelde DNS-servers uitschrijft naar het scherm.
    Toon hierbij enkel de DNS servers voor de LAN interface, en enkel voor IPv4.
#>

#declaraties

$netwerk = "LAN"
$werkwoord = "is het"
$woord = "server adres"

#de array:
$dnsserver = Get-DnsClientServerAddress -AddressFamily IPv4 -InterfaceAlias "${netwerk}" -ErrorAction SilentlyContinue
if (! $dnsserver)
{
    Write-Error "het script veronderstelt een netwerk met de naam ${netwerk}, zoals in de opgave ..."
    exit 1
}

if ($dnsserver.ServerAddresses.count -gt 1)
{
$werkwoord = "zijn de"
$woord = "server adressen"
}

$adres = $dnsserver.serveraddresses
write-host "dit ${werkwoord} dns ${woord}:
$adres"

exit 0
```

2. Schrijf een script dat de gebruiker vraagt om een bepaalde naam in te geven (bv. [www.google.com](www.google.com)). Nadien controleert het script of deze naam voorkomt in de DNS client cache. Indien dit het geval is, schrijft het script het data veld uit van deze entry, indien niet schrijf je een gepaste boodschap uit.

3. Schrijf een script dat nagaat of de DNS-server voor de LAN-interface reeds ingesteld is op 192.168.0.1. Indien dit het geval is, schrijf je een bevestiging naar het scherm. Indien dit niet het geval is, pas je de DNS-server aan naar 192.168.0.1 en schrijf je hiervan een melding op het scherm.

    ``Tip: maak gebruik van een variabele om de waarde 192.168.0.1 op te slaan – zo kan je dit adres indien nodig later aanpassen en is je script herbruikbaar.``

4. Schrijf een script dat eerst toont hoeveel entries er in de DNS client cache zitten. Daarna zal het script de DNS client cache leegmaken, en vervolgens opnieuw uitschrijven hoeveel entries er in de cache zitten.

5. Schrijf een script dat aan de gebruiker vraagt om een adres op te geven (bv. [www.hogent.be](www.hogent.be)). Daarna schrijft het script het overeenkomstige IPv4 adres uit op het scherm, samen met de TTL.

## DNS Server

1. Schrijf een script dat nagaat of de DNS server gebruikmaakt van 8.8.8.8 als forwarder. Indien dit (nog) niet het geval is, zal het script 8.8.8.8 instellen als forwarder. Tenslotte schrijft het script de forwarder uit naar het scherm.

    ``Tip: gebruik een variabele om de waarde 8.8.8.8 op te slaan.``

2. Vraag een lijst op van alle DNS zones die de server beheert. Geef voor elke zone het type van de zone (Primary, ...) en vermeld ook of het om een Forward of Reverse Lookup zone gaat.

3. Gebruik PowerShell om een primaire forward lookup zone example.temp aan te maken binnen DNS. Schrijf nadien (via PowerShell) alle records uit van deze nieuwe zone. Welke records zijn er automatisch aangemaakt?

4. Voeg aan de zone example.temp enkele A-records toe via PowerShell, met als hostname `laptop<XX>` en als `IP-adres 192.168.10.<XX>`. `XX` krijgt een waarde van 20 tot en met 29, dus in totaal voeg je 10 A-records toe (laptop20 -> 192.168.10.20, laptop21 -> 192.168.10.21, ...).

5. Maak via PowerShell een reverse lookup zone aan voor het netwerk 192.168.10.0/24. Voeg nadien via PowerShell voor de 10 laptops uit de vorige vraag een PTR record toe aan deze zone. Voor laptop20 maak je dus een PTR record aan 20 -> laptop20.example.temp.

6. Gebruik PowerShell om het A-record op te halen voor laptop25. Haal nadien het PTR record op voor het IP-adres dat je verkreeg via het A-record.

    ``Tip: gebruik de methode ``**``GetAddressBytes()``**`` om een IP-adres op te delen``

7. Verwijder via PowerShell de zone example.temp en de reverse lookup zone voor netwerk 192.168.10.0/24. Maak hierbij gebruik van de parameter `-Force` zodat de gebruiker geen bevestiging moet geven bij uitvoeren van het script.