<#
    Oefening 6: Faculteit berekenen

    Schrijf een script dat 1 getal vraagt aan de gebruiker.
    Vervolgens berekent het script de faculteit van dit getal
    (= product van de getallen 1 tot en met het ingegeven getal).
#>

Clear-Host

[int]$invoer = read-host "Waarvan de faculteit berekenen (positief geheel getal)?"
$tmp = $invoer - 1
$faculteit = $invoer

while($tmp -ge 2) {
    $faculteit *= $tmp
    $tmp--
    }

Write-Host "$invoer! = $faculteit"


#recursief

function geef_fac([int] $i){
    if ($i -ge 2)
    {
        return $($i * (geef_fac $($i -1)))
    }
    return 1
}

write-host "$invoer! = $(geef_fac $invoer)"