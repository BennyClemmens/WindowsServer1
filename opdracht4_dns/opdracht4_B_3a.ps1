<#
    3. Gebruik PowerShell om een primaire forward lookup zone example.temp aan te maken binnen DNS.
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
    Add-DnsServerPrimaryZone -Name $zonenaam -ZoneFile "${zonenaam}" #-ReplicationScope Domain
}

Get-DnsServerResourceRecord -ZoneName $zonenaam

# SOA en NS records werden automatisch aangemaakt

exit 0