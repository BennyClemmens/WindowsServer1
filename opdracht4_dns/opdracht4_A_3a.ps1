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
write-host "dit ${werkwoord} dns ${woord}: $adres"

if ($adres -contains "212.166.2.10")
{
echo "victory"
}
else
{
echo "no victory"
} 
exit 0