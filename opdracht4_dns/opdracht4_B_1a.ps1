<#
    1. Schrijf een script dat nagaat of de DNS server gebruikmaakt van 8.8.8.8 als forwarder.
    Indien dit (nog) niet het geval is, zal het script 8.8.8.8 instellen als forwarder.
    Tenslotte schrijft het script de forwarder uit naar het scherm.

    Tip: gebruik een variabele om de waarde 8.8.8.8 op te slaan.
#>

[string]$acht = "8.8.8.8"
$huidige = Get-DnsServerForwarder

if(${huidige}.IPAddress -contains ${acht})
{
    Write-Host "${acht} is reeds een forwarder"
}
else
{
    Write-Host "${acht} wordt toegevoegd als forwarder"
    #Set-DnsServerForwarder ${acht}
    Add-DnsServerForwarder ${acht}
}

Write-Host "De forwarder(s): $($(Get-DnsServerForwarder).IPAddress)"