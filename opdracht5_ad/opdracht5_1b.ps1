<#
    1. Schrijf een script dat aan de gebruiker vraagt om de naam van OU in te geven (bijvoorbeeld: PersoneelGent).
    Nadien schrijft het script voor elke OU met deze naam het volledige pad uit in X500 (LDAP) formaat.  
#>

#model oplossing

$filter = read-host "geef de naam (filter) van een OU"

$ous = Get-ADOrganizationalUnit -Filter {Name -like ${filter}}

foreach($ou in ${ous})
    {
    write-host ${ou}.distinguishedname
    }
