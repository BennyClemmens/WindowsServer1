<#
    4. Schrijf een script dat aan de gebruiker vraagt om een gebruikersnaam in te geven (bijvoorbeeld: mad_sme)
     Nadien schrijft het script het volledige pad uit van deze gebruiker in X500 (LDAP) formaat.  
#>

$user=$null #cleanup meerdere keer uitvoeren script
[string]$naam = Read-Host "Geef gebruikersnaam"

$user = Get-ADUser -Identity ${naam} -ErrorAction Stop
Write-Host $(if (${user}) {${user}.DistinguishedName} else {"geen gebruiker ${naam} gevonden"})