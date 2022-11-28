<#
    Oefening 4: Rekenen met getallen

    Schrijf een script dat 2 getallen vraagt aan de gebruiker.
    Vervolgens kan de gebruiker een bewerking selecteren
    (optellen, aftrekken, vermenigvuldigen of delen).
    Het script berekent dan het resultaat en toont de uitkomst op het scherm.

    (geen fout-afhandeling)
#>

Clear-Host

[int]$getalA = [int](Read-Host "Geef een geheel getal")
[int]$getalB = [int](Read-Host "Geef nog een geheel getal")
[string]$operator = '0'

while($operator -eq '0')
{
    [string]$operator = read-host "+ - * /"
    switch($operator)
    {
        '+' {$resultaat= $getalA + $getalB; break}
        '-' {$resultaat= $getalA - $getalB; break}
        '*' {$resultaat= $getalA * $getalB; break}
        '/' {$resultaat= $getalA / $getalB; break}
        default {$operator= '0'; write-host "ongeldige keuze"}
    }
}
write-host $getalA $operator $getalB = $resultaat

<#

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
#>