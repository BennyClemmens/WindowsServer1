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
$ip = "192.168.0.2"

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