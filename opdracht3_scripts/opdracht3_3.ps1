<#
    Oefening 3: Uitschrijven woorden in omgekeerde volgorde

    Schrijf een script dat de gebruiker vraagt om een zin in te geven.
    Daarna schrijft het script de zin uit waarbij de woorden voorkomen
    in omgekeerde volgorde.

    (een combinatie van oef 1 & 2
#>

Clear-Host

$zin = Read-Host "Geef een zin"

Write-Host "`nvolgende zin hebt u ingegeven:`n$zin"
Write-Host 'dit werd in de variabele $zin opgeslaan'

write-host "`nOpsplisen zin en in een array opslaan:"
write-host '$zinArr = -split $zin'
$zinArr = -split $zin
write 'write "$zinArr"'
write "$zinArr"
write 'write $zinArr'
write $zinArr

Write-Host "`nIn place omdraaien array"
write-host '[array]::Reverse($zinArr)'
[array]::Reverse($zinArr)
write 'write $zinArr'
write $zinArr

write-host "`nArray terug joinen tot string (en rechtstreeks uitschrijven):"
write 'write-host $zinArr'
write-host $zinArr
write 'write $($zinArr -join '' '')'
write $($zinArr -join ' ')
write 'write "$zinArr"'
write "$zinArr"