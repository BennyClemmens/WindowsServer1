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