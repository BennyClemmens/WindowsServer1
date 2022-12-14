<#
    5. Bij het aanmaken van een gebruiker kan je de optie -SamAccountName gebruiken om de gebruikersnaam in te stellen.
    Dit stelt enkel de gebruikersnaam in voor het oude (NetBIOS) formaat (bv. HOGENT\jdoe)
    en niet voor het nieuwe AD formaat (bv. jdoe@hogent.local).
    Zoek uit met welke optie je dit laatste kan instellen, en test dit uit.  
#>

[string]$sam="jdoe"
[string]$dom="florist.thuis"
[string]$naam="John Doe"
#[string]$domain="hogent.local"
New-ADUser -SamAccountName "${sam}" -UserPrincipalName "${sam}@${dom}" -Name "${naam}"