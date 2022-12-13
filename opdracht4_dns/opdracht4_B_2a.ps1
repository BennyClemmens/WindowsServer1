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