<#
    2. Schrijf een script dat aan de gebruiker vraagt om een getal in te geven (bijvoorbeeld: 10).
    Nadien maakt het script een aantal OUs aan onder de root van het domein,
    met als naam test1, test2, ...ntot en met test10 (als de gebruiker als getal 10 ingaf).
    Zorg dat bij aanmaken van de OUs de bescherming tegen verwijderen uit staat.  
#>

[int]$aantal = read-host "geef het aantal aan te maken OU's"

for($i =1 ; ${i} -le ${aantal}; ${i}++)
    {
    # Write-Host $i
    New-ADOrganizationalUnit -name "test${i}" -ProtectedFromAccidentalDeletion $false
    }
# possible tweaks : check if OU with this name allready exits ...