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