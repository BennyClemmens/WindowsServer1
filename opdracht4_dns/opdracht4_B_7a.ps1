<#
    7. Verwijder via PowerShell de zone example.temp
    en de reverse lookup zone voor netwerk 192.168.10.0/24.
    Maak hierbij gebruik van de parameter -Force zodat de gebruiker geen
    bevestiging moet geven bij uitvoeren van het script.
#>

$zonenaam = "example.temp"
$reversezonenaam = "10.168.192.in-addr.arpa"

Remove-DnsServerZone ${zonenaam} -Force
Remove-DnsServerZone ${reversezonenaam} -Force