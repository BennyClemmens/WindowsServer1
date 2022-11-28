<#
    Oefening 2: Zin splitsen in woorden

    Schrijf een script dat aan de gebruiker vraagt om een zin in te geven.
    Vervolgens wordt het aantal woorden op het scherm getoond,
    waarna alle woorden onder elkaar uitgeschreven worden
#>

Clear-Host

$zin = Read-Host "Geef een zin"

Write-Host "`nvolgende zin hebt u ingegeven:`n$zin"
Write-Host 'dit werd in de variabele $zin opgeslaan'

write-host "`nTellen methode 1 (zin splitsen met .split() en lengte array tellen):"
write-host '$zinArr = $zin.split() (default : ' ' => probleem met meerdere spaties)'
$zinArr = $zin.Split()
Write-Host "$zinArr"
write-host '$aantal = $zinArr.Length'
$aantal = $zinArr.Length
write-host "$aantal"

write-host "`nTellen methode 1 bis (zin splitsen met -split en lengte array tellen):"
write-host '$zinArrBis = -split $zin (default : whitespace)'
$zinArrBis = -split $zin
write-host '$aantalBis = $zinArrBis.Length'
$aantalBis = $zinArrBis.Length
$aantalBis

write-host "`nTellen methode 2, rechtstreeks, maar dan moeten we straks alsnog splitten voor de rest van de opdracht:"
$aantalTris = (Measure-Object -InputObject $zin -Word).Words
write-host '$aantalTris = (Measure-Object -InputObject $zin -Word).Words'
$aantaltris

write-host "`nUitschrijven methode 1, array uitschrijven is auto foreach:"
write-host 'write $zinArrBis'
write $zinArrBis

write-host "`nUitschrijven methode 2, joinen met een newline:"
write-host 'Write-Host $($zinArrBis -join "`n")'
Write-Host $($zinArrBis -join "`n")

write-host "`nUitschrijven methode 3, zelf loopen:"
write-host 'foreach ($word in $zinArrBis) {
    Write-Host $word
}'
foreach ($word in $zinArrBis) {
    Write-Host $word
}