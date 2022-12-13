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