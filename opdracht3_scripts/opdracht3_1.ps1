<#
    Oefening 1: Uitschrijven zin in omgekeerde volgorde

    Schrijf een script dat de gebruiker vraagt om een zin in te geven,
    en daarna deze zin uitschrijft in omgekeerde volgorde.
    
    (eigenlijk alle letters van achter naar voor)
#>

#(optioneel:  scherm leeg maken)
Clear-Host

#[String]$zin = Read-Host -Prompt "geef een zin" #is misschien een overkill
$zin = Read-Host "Geef een zin"

Write-Host "`nvolgende zin hebt u ingegeven:`n$zin"
Write-Host 'dit werd in de varaibele $zin opgeslaan'

write-host "`nmethode 1:"
write-host '$zinArr = $zin.ToCharArray()'
$zinArr = $zin.ToCharArray()
Write-Host "$zinArr"
write-host '[array]::Reverse($zinArr) (in-place)'
[array]::Reverse($zinArr)
Write-Host "$zinArr"
Write-Host '$omgekeerd = -join($zinArr)'
$omgekeerd = -join($zinArr)
write-host "$omgekeerd"

write-host "`nmethode 1 bis:"
Write-Host '$omgekeerBis = [String]::join('''',$zinArr)'
$omgekeerdBis = [String]::join('',$zinArr)
write-host "$omgekeerdBis"

write-host "`nmethode 2, python style:"
write-host 'write-host $($zin[-1..-$zin.Length] -join '''')'
write-host "$($zin[-1..-$zin.Length] -join '')"

write-host "`nmethode 3, model-oplossing:"
[string]$uitvoer = $null
$letterArr = $zin.ToCharArray()

write-host '[string]$uitvoer = $null
$letterArr = $zin.ToCharArray()
foreach ($kar in $letterArr)
{
    $uitvoer = $kar + $uitvoer
}'
foreach ($kar in $letterArr) { $uitvoer = $kar + $uitvoer }
Write-Host "$uitvoer"