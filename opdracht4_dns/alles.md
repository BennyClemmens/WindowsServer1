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
***`opdracht4_A_2a`***  
```
<#
    2. Schrijf een script dat de gebruiker vraagt om een bepaalde naam in te geven
    (bv. www.google.com).
    Nadien controleert het script of deze naam voorkomt in de DNS client cache.
    Indien dit het geval is, schrijft het script het data veld uit van deze entry,
    indien niet schrijf je een gepaste boodschap uit.
#>

[string] $naam = Read-Host "Geef adres"
$entry = Get-DnsClientCache -Entry $naam -ErrorAction SilentlyContinue

if($entry)
{
    $data = $entry.data
    Write-Host "$naam gevonden in DNS cache, waarde is:
$data"
    # ${data} indien o
}
else
{
    Write-Host "$naam niet gevonden in de DNS cache"
}
```

3. Schrijf een script dat nagaat of de DNS-server voor de LAN-interface reeds ingesteld is op 192.168.0.1. Indien dit het geval is, schrijf je een bevestiging naar het scherm. Indien dit niet het geval is, pas je de DNS-server aan naar 192.168.0.1 en schrijf je hiervan een melding op het scherm.

    ``Tip: maak gebruik van een variabele om de waarde 192.168.0.1 op te slaan – zo kan je dit adres indien nodig later aanpassen en is je script herbruikbaar.``  
***`opdracht4_A_3a`***
```
<#
    3. Schrijf een script dat nagaat of de DNS-server voor de LAN-interface reeds ingesteld is op 192.168.0.1.
    Indien dit het geval is, schrijf je een bevestiging naar het scherm.
    Indien dit niet het geval is, pas je de DNS-server aan naar 192.168.0.1
    en schrijf je hiervan een melding op het scherm.

    Tip: maak gebruik van een variabele om de waarde 192.168.0.1 op te slaan
     – zo kan je dit adres indien nodig later aanpassen en is je script herbruikbaar.
#>

#declaraties

$netwerk = "LAN"
$ip = "192.168.0.1"

$dnsserver = Get-DnsClientServerAddress -AddressFamily IPv4 -InterfaceAlias "${netwerk}" -ErrorAction SilentlyContinue
if (! $dnsserver)
{
    Write-Error "het script veronderstelt een netwerk met de naam ${netwerk}, zoals in de opgave ..."
    exit 1
}

$adres = $dnsserver.serveraddresses

if ($adres -eq ${ip}) # evalueert ook naar false als er meerdere zijn ingesteld
{
    Write-Host "DNS reeds ingesteld op ${ip}"
}
else
{
    Set-DnsClientServerAddress -ServerAddresses "${ip}" -InterfaceAlias "${netwerk}"
    Write-Host "DNS werd ingesteld op ${ip}"

}
exit 0
```

4. Schrijf een script dat eerst toont hoeveel entries er in de DNS client cache zitten. Daarna zal het script de DNS client cache leegmaken, en vervolgens opnieuw uitschrijven hoeveel entries er in de cache zitten.  
***`opdracht4_A_4a`***
```
<#
    Schrijf een script dat eerst toont hoeveel entries er in de DNS client cache zitten.
    Daarna zal het script de DNS client cache leegmaken,
    en vervolgens opnieuw uitschrijven hoeveel entries er in de cache zitten.
#>

$cache = Get-DnsClientCache
[int]$aantal = $cache.Count

write-host "er zitten ${aantal} records in de cache"
if (${aantal} -ne "0")
{
    write-host "clearing cache"
    Clear-DnsClientCache
    
    $cache = Get-DnsClientCache
    $aantal = $cache.Count
    write-host "er zitten ${aantal} records in de cache"
}
else
{
    Write-Host "en dus geen clear nodig"
}
```

5. Schrijf een script dat aan de gebruiker vraagt om een adres op te geven (bv. [www.hogent.be](www.hogent.be)). Daarna schrijft het script het overeenkomstige IPv4 adres uit op het scherm, samen met de TTL.  
***`opdracht4_A_5a`***  
```
<#
5. Schrijf een script dat aan de gebruiker vraagt om een adres op te geven (bv. www.hogent.be).
Daarna schrijft het script het overeenkomstige IPv4 adres uit op het scherm, samen met de TTL.
#>

$gevraagd = Read-Host "geef adres: "
#$antwoord = Resolve-DnsName $gevraagd
#$antwoord = (Resolve-DnsName $gevraagd -ErrorAction SilentlyContinue |where {$_.type -eq 'A' -and $_.section -eq 'answer'})
$antwoord = (Resolve-DnsName $gevraagd -ErrorAction SilentlyContinue |where {$_.type -eq 'A'})
#echo "$antwoord.ip4address $antwoord.ttl"
# andere opties [0] of | select -first 1
# $antwoord
if (! $antwoord)
{
    Write-Host "geen antwoord gevonden voor $gevraagd"
    exit 1
}
if ($adres.Count -gt "1")
{
    write-host "meerdere ip-adressen gevonden voor $gevraagd, enkel eerste weergegeven..."
}
$adres = $antwoord[0].ip4address
#$antwoord
#((Resolve-DnsName www.google.be |where {$_.querytype -eq 'A'})[0]).ttl
$ttl = $antwoord[0].ttl
Write-Host "het ipv4 adres van $gevraagd is $adres, met een TTL van $ttl"
#Resolve-DnsName $gevraagd -Type A
exit 0
```

## DNS Server

1. Schrijf een script dat nagaat of de DNS server gebruikmaakt van 8.8.8.8 als forwarder. Indien dit (nog) niet het geval is, zal het script 8.8.8.8 instellen als forwarder. Tenslotte schrijft het script de forwarder uit naar het scherm.

    ``Tip: gebruik een variabele om de waarde 8.8.8.8 op te slaan.``  
***`opdracht4_B_1a.ps1`***  
```
<#
    1. Schrijf een script dat nagaat of de DNS server gebruikmaakt van 8.8.8.8 als forwarder.
    Indien dit (nog) niet het geval is, zal het script 8.8.8.8 instellen als forwarder.
    Tenslotte schrijft het script de forwarder uit naar het scherm.

    Tip: gebruik een variabele om de waarde 8.8.8.8 op te slaan.
#>

[string]$acht = "8.8.8.8"
$huidige = Get-DnsServerForwarder

if(${huidige}.IPAddress -contains ${acht})
{
    Write-Host "${acht} is reeds een forwarder"
}
else
{
    Write-Host "${acht} wordt toegevoegd als forwarder"
    #Set-DnsServerForwarder ${acht}
    Add-DnsServerForwarder ${acht}
}

Write-Host "De forwarder(s): $($(Get-DnsServerForwarder).IPAddress)"
```

2. Vraag een lijst op van alle DNS zones die de server beheert. Geef voor elke zone het type van de zone (Primary, ...) en vermeld ook of het om een Forward of Reverse Lookup zone gaat.  
***`opdracht4_B_2a.ps1`***  
```
<#
    2. Vraag een lijst op van alle DNS zones die de server beheert.
    Geef voor elke zone het type van de zone (Primary, ...)
    en vermeld ook of het om een Forward of Reverse Lookup zone gaat.
#>

$zones = Get-DnsServerZone

foreach($zone in $zones)
{
    Write-Host "$($zone.ZoneName)
    $($zone.ZoneType) Zone
    $(if ($zone.IsReverseLookupZone) {"Reverse"} else {"Forward"}) Lookup"
}
```

3. Gebruik PowerShell om een primaire forward lookup zone example.temp aan te maken binnen DNS. Schrijf nadien (via PowerShell) alle records uit van deze nieuwe zone. Welke records zijn er automatisch aangemaakt?  
***`opdracht4_B_3a.ps1`***  
```
<#
    2. Gebruik PowerShell om een primaire forward lookup zone example.temp aan te maken binnen DNS.
    Schrijf nadien (via PowerShell) alle records uit van deze nieuwe zone.
    Welke records zijn er automatisch aangemaakt?
#>

$zonenaam = "example.temp"

if ($(Get-DnsServerZone| where {$_.ZoneName -eq ${zonenaam}}))
{
    Write-Host "er besaat reeds een zone met de naam ${zonenaam}. Misschien wil u eerst opdracht4_B_7a.ps1 runnen :)"
}
else
{
    Add-DnsServerPrimaryZone -Name $zonenaam -ZoneFile $zonenaam
}

Get-DnsServerResourceRecord -ZoneName $zonenaam

# SOA en NS records werden automatisch aangemaakt

exit 0
```


4. Voeg aan de zone example.temp enkele A-records toe via PowerShell, met als hostname `laptop<XX>` en als `IP-adres 192.168.10.<XX>`. `XX` krijgt een waarde van 20 tot en met 29, dus in totaal voeg je 10 A-records toe (laptop20 -> 192.168.10.20, laptop21 -> 192.168.10.21, ...).  
***`opdracht4_B_4a.ps1`***  
```
<#
    4. Voeg aan de zone example.temp enkele A-records toe via PowerShell,
    met als hostname laptop<XX> en als IP-adres 192.168.10.<XX>.
    XX krijgt een waarde van 20 tot en met 29,
    dus in totaal voeg je 10 A-records toe
    (laptop20 -> 192.168.10.20, laptop21 -> 192.168.10.21, ...).
#>

[int]$aantal = 10

$zonenaam = "example.temp"

if (! $(Get-DnsServerZone| where {$_.ZoneName -eq ${zonenaam}}))
{
    Write-Host "zone ${zonenaam} bestaat nog niet ! Misschien wil u eerst opdracht4_B_3a.ps1 runnen :)"
    exit 1
}

[int]$begin = 20

for($i = ${begin}; ${i} -lt $(${begin} + ${aantal}); ${i}++)
{
    $naam = "laptop${i}"
    $ip = "192.168.10.${i}"
    Add-DnsServerResourceRecordA -Name ${naam} -ZoneName ${zonenaam} -IPv4Address ${ip} -ErrorAction SilentlyContinue
    Write-Host "${naam} -${ip} toegevoegd aan ${zonenaam}"
}

exit 0
```


5. Maak via PowerShell een reverse lookup zone aan voor het netwerk 192.168.10.0/24. Voeg nadien via PowerShell voor de 10 laptops uit de vorige vraag een PTR record toe aan deze zone. Voor laptop20 maak je dus een PTR record aan 20 -> laptop20.example.temp.  
***`opdracht4_B_5a.ps1`***  
```
<#
    5. Maak via PowerShell een reverse lookup zone aan voor het netwerk 192.168.10.0/24.
    Voeg nadien via PowerShell voor de 10 laptops uit de vorige vraag een PTR record toe aan deze zone.
    Voor laptop20 maak je dus een PTR record aan 20 -> laptop20.example.temp.
#>

[int]$aantal = 10

$zonenaam = "example.temp"

if (! $(Get-DnsServerZone| where {$_.ZoneName -eq ${zonenaam}}))
{
    Write-Host "zone ${zonenaam} bestaat nog niet ! Misschien wil u eerst opdracht4_B_3a.ps1 runnen :)"
    exit 1
}

[int]$begin = 20

$netID = "192.168.10.0/24"
$reversezonenaam = "10.168.192.in-addr.arpa"
Add-DnsServerPrimaryZone –NetworkID $netID -ZoneFile ${reversezonenaam}
#Add-DnsServerPrimaryZone –NetworkID $netID -ReplicationScope Domain ## domain integrated
for($i = ${begin}; ${i} -lt $(${begin} + ${aantal}); ${i}++)
{
    $response = "laptop${i}.${zonenaam}"
    # if not exists ....
    Add-DnsServerResourceRecordPtr -ZoneName ${reversezonenaam} -Name ${i} -PtrDomainName ${response}
}

exit 0
```

6. Gebruik PowerShell om het A-record op te halen voor laptop25. Haal nadien het PTR record op voor het IP-adres dat je verkreeg via het A-record.

    ``Tip: gebruik de methode ``**``GetAddressBytes()``**`` om een IP-adres op te delen``  
***`opdracht4_B_6a.ps1`***  
```
<#
    6. Gebruik PowerShell om het A-record op te halen voor laptop25.
    Haal nadien het PTR record op voor het IP-adres dat je verkreeg via het A-record.

    Tip: gebruik de methode GetAddressBytes() om een IP-adres op te delen
#>

$zonenaam = "example.temp"
$reversezonenaam = "10.168.192.in-addr.arpa"
$lt="laptop25"

write-host "forward lookup ${lt} in ${zonenaam}:"
$fwrecord = $(Get-DnsServerResourceRecord -ZoneName ${zonenaam} –Name ${lt})
write-host "$(${fwrecord}.RecordData.IPv4Address)"

$hostnummer = $fwrecord.recorddata.ipv4address.getaddressbytes()[3]
write-host "reverse lookup host ${hostnummer} in ${reversezonenaam}:"
$revrecord = $(Get-DnsServerResourceRecord -ZoneName ${reversezonenaam} –Name ${hostnummer})
write-host "$(${revrecord}.RecordData.PtrDomainname)"
```


7. Verwijder via PowerShell de zone example.temp en de reverse lookup zone voor netwerk 192.168.10.0/24. Maak hierbij gebruik van de parameter `-Force` zodat de gebruiker geen bevestiging moet geven bij uitvoeren van het script.