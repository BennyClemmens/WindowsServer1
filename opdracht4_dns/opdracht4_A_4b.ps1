<#
    Schrijf een script dat eerst toont hoeveel entries er in de DNS client cache zitten.
    Daarna zal het script de DNS client cache leegmaken,
    en vervolgens opnieuw uitschrijven hoeveel entries er in de cache zitten.
#>

#model
$aantal = (Get-DnsClientCache | measure).Count
Write-Host "Er zitten $aantal entries in de DNS Client cache"
Clear-DnsClientCache
$aantal = (Get-DnsClientCache | measure).Count
Write-Host "Er zitten $aantal entries in de DNS Client cache"
