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