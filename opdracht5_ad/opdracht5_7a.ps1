<#
    7. Schrijf een script dat aan de gebruiker vraagt om de naam van een AD groep in te geven (bv. Domain Admins).
    Nadien schrijft het script alle namen uit van de leden van deze groep.  
#>

#na uitvoeren van opdracht5_8a.ps1 ook extra te testen met de nieuw aangemaakte groep, nu best : 'Domain Admins'

[string] $groep = Read-Host "Geef naam groep"
$leden = Get-ADGroupMember -Identity ${groep}
foreach($lid in $leden)
    {
    Write-Host $lid.name
    }