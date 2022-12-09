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