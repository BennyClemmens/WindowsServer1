<#
    6. Bij het aanmaken van een gebruiker kan je ook een wachtwoord instellen.
    Zoek uit hoe je dit kan doen, en test dit uit.  
#>

[string]$sam="jdoe"
[string]$pass="Jon&Doe"


#Hiervoor kan je de optie -AccountPassword gebruiken. Voor het wachtwoord moet je wel eenSecure String gebruiken, bv:
#nieuw :
#New-ADUser -Name "John Doe" -AccountPassword (ConvertTo-SecureString "Jon&Doe" -AsPlainText -force) -Enabled $true

Set-ADAccountPassword -Identity ${sam} -NewPassword (ConvertTo-SecureString "${pass}" -AsPlainText -force)
Set-ADUser -Identity "${sam}" -Enabled $true

$pass=$null