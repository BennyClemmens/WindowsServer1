<#
    Oefening 5: Getal raden

    Schrijf een script dat een random getal genereert tussen 0 en 10.
    Vervolgens kan de gebruiker het getal raden.
    Het script schrijft uit of het te raden getal hoger of lager is,
    en de gebruiker kan een nieuwe poging doen.
    Wanneer het getal geraden is, schrijft het script uit hoeveel beurten
    de gebruiker nodig had om het getal te raden.

    we gaan er van uit dat getallen worden ingegeven
#>

Clear-Host

#to avoid problems with constants not being deleteable, using variables
$minimum = 1
$maximum= 11

$getal = Get-Random -Minimum $minimum -Maximum $maximum

$aantal = 0
$invoer = 0

while($invoer -ne $getal) {
    [int]$invoer = read-host "Wat is uw getal?"
    $aantal++
    if ($invoer -gt $getal) {
        write-host "lager"
    }
    elseif($invoer -lt $getal) {
        write-host 'hoger'
    }
}

Write-Host "het te gokken getal was inderdaad $getal, en u hebt het in $aantal keer geraden"