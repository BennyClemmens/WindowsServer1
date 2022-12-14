<#
    1. Schrijf een script dat aan de gebruiker vraagt om de naam van OU in te geven (bijvoorbeeld: PersoneelGent).
    Nadien schrijft het script voor elke OU met deze naam het volledige pad uit in X500 (LDAP) formaat.  
#>

$filter = read-host "geef de naam (filter) van een OU"

$ou = Get-ADOrganizationalUnit -Filter {Name -like ${filter}}

if (${ou})
    {
    write-host "voor ${filter} zijn volgende OU's gevonden:"
        write ${ou}.distinguishedname
    }
else
    {
        write "geen Ou's gevonden met de filter ${filter}"
    }