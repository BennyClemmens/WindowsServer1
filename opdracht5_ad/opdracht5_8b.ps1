<#
    8. Schrijf een script dat aan een gebruiker vraagt om de naam van een (nieuwe) groep in te geven,
    alsook een getal (bijvoorbeeld: 2C1 en 15). Op basis van deze 2 inputwaarden zal het script dan:

   * Een OU aanmaken onder de root met als naam de naam van de groep (bv. 2C1)
   * In deze OU een groep aanmaken met dezelfde naam (bv. 2C1) en als omschrijving OU voor <naam groep> (bv. OU voor 2C1).
   * In deze OU 15 gebruikers aanmaken met als gebruikersnaam <naam groep>_<nr> (bv. 2C1_1, 2C1_2, ..., 2C1_15)
     en deze gebruikers toevoegen aan de groep aangemaakt in het vorig puntje.
     Voor de gebruikers stel je zowel de NetBIOS accountnaam in, als de gebruikersnaam in het nieuwe formaat.
     Als naam voor de gebruikers gebruiker je <naam groep> gebruiker <nr> (bv. 2C1 gebruiker 1, 2C1 gebruiker 2, ...).
   * Controleer na uitvoeren van het script of de OU, de groep en de gebruikers correct aangemaakt zijn.
#>

[string]$locatie = "DC=FLORIST,DC=THUIS"
[string]$dom= "florist.thuis"
[string]$groepsnaam = read-host "geef de naam van de groep"
[int]$aantal = read-host "hoeveel gebruikers wil je in de groep ${groepsnaam}aanmaken"

#aanmaken OU
New-ADOrganizationalUnit -name ${groepsnaam} -ProtectedFromAccidentalDeletion $false -path ${locatie}

#aanmaken groep met dezelfde naam
New-ADGroup -name ${groepsnaam} -path "OU=${groepsnaam},${locatie}" -Description "OU voor ${groepsnaam}" -GroupScope Global

for($i =1 ; $i -le ${aantal}; $i++)
{
    New-ADUser -name "${groepsnaam} gebruiker ${i}" -SamAccountName "${groepsnaam}_${i}" -UserPrincipalName "${groepsnaam}_$i@{sam}" -Path "OU=${groepsnaam},${locatie}"
    Add-ADGroupMember -Identity "${groepsnaam}" -Members "${groepsnaam}_${i}"
}