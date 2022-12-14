# Beheer Active Directory

In deze vijfde reeks zullen we enkele scripts schrijven om Active Directory te beheren. Het is eenvoudigst om deze scripts rechtstreeks te schrijven op onze domeincontroller (= VM met Windows Server).

1. Schrijf een script dat aan de gebruiker vraagt om de naam van OU in te geven (bijvoorbeeld: PersoneelGent). Nadien schrijft het script voor elke OU met deze naam het volledige pad uit in X500 (LDAP) formaat.  

***`opdracht5_1a.ps1`***
```
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
```

2. Schrijf een script dat aan de gebruiker vraagt om een getal in te geven (bijvoorbeeld: 10). Nadien maakt het script een aantal OUs aan onder de root van het domein, met als naam test1, test2, … tot en met test10 (als de gebruiker als getal 10 ingaf). Zorg dat bij aanmaken van de OUs de bescherming tegen verwijderen uit staat.  

***`opdracht5_2a.ps1`***  
```
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
```

3. Idem als de vorige vraag, maar de OUs worden genest aangemaakt: test1 wordt aangemaakt onder de root van het domein, test2 wordt aangemaakt als kind OU van test1, test3 is een kind OU van test2 enzovoort.

***`opdracht5_3a.ps1`***  
```
<#
    3. Idem als de vorige vraag, maar de OUs worden genest aangemaakt:
    test1 wordt aangemaakt onder de root van het domein,
        test2 wordt aangemaakt als kind OU van test1,
            test3 is een kind OU van test2 enzovoort.  
#>

[int]$aantal = read-host "geef het aantal aant maken OU's"

$locatie = "DC=HOGENT,DC=LOCAL"

for($i =1 ; ${i} -le ${aantal}; ${i}++)
    {
    #Write-Host $i
    New-ADOrganizationalUnit -name "test${i}" -ProtectedFromAccidentalDeletion $false -Path ${locatie}
    $locatie = "OU=test${i},${locatie}"
}
# possible tweaks : check if OU with this name allready exits ...
```

4. Schrijf een script dat aan de gebruiker vraagt om een gebruikersnaam in te geven (bijvoorbeeld: mad_sme). Nadien schrijft het script het volledige pad uit van deze gebruiker in X500 (LDAP) formaat.

***`opdracht5_4a.ps1`***  
```
<#
    4. Schrijf een script dat aan de gebruiker vraagt om een gebruikersnaam in te geven (bijvoorbeeld: mad_sme)
     Nadien schrijft het script het volledige pad uit van deze gebruiker in X500 (LDAP) formaat.  
#>

$user=$null #cleanup meerdere keer uitvoeren script
[string]$naam = Read-Host "Geef gebruikersnaam"

$user = Get-ADUser -Identity ${naam} -ErrorAction Stop
Write-Host $(if (${user}) {${user}.DistinguishedName} else {"geen gebruiker ${naam} gevonden"})
```

5. Bij het aanmaken van een gebruiker kan je de optie -SamAccountName gebruiken om de gebruikersnaam in te stellen. Dit stelt enkel de gebruikersnaam in voor het oude (NetBIOS) formaat (bv. HOGENT\jdoe) en niet voor het nieuwe AD formaat (bv. jdoe@hogent.local). Zoek uit met welke optie je dit laatste kan instellen, en test dit uit.

***`opdracht5_5a.ps1`***  
```
<#
    5. Bij het aanmaken van een gebruiker kan je de optie -SamAccountName gebruiken om de gebruikersnaam in te stellen.
    Dit stelt enkel de gebruikersnaam in voor het oude (NetBIOS) formaat (bv. HOGENT\jdoe)
    en niet voor het nieuwe AD formaat (bv. jdoe@hogent.local).
    Zoek uit met welke optie je dit laatste kan instellen, en test dit uit.  
#>

[string]$sam="jdoe"
[string]$dom="hogent.local"
[string]$naam="John Doe"
#[string]$domain="hogent.local"
New-ADUser -SamAccountName "${sam}" -UserPrincipalName "${sam}@${dom}" -Name "${naam}"
```

6. Bij het aanmaken van een gebruiker kan je ook een wachtwoord instellen. Zoek uit hoe je dit kan doen, en test dit uit.

***`opdracht5_6a.ps1`***  
```
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
```

7. Schrijf een script dat aan de gebruiker vraagt om de naam van een AD groep in te geven (bv. Domain Admins). Nadien schrijft het script alle namen uit van de leden van deze groep.

***`opdracht5_7a.ps1`***  
```
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
```

8.  Schrijf een script dat aan een gebruiker vraagt om de naam van een (nieuwe) groep in te geven, alsook een getal (bijvoorbeeld: 2C1 en 15). Op basis van deze 2 inputwaarden zal het script dan:

   * Een OU aanmaken onder de root met als naam de naam van de groep (bv. 2C1)
   * In deze OU een groep aanmaken met dezelfde naam (bv. 2C1) en als omschrijving OU voor <naam groep> (bv. OU voor 2C1).
   * In deze OU 15 gebruikers aanmaken met als gebruikersnaam <naam groep>_<nr> (bv. 2C1_1, 2C1_2, ..., 2C1_15) en deze gebruikers toevoegen aan de groep aangemaakt in het vorig puntje. Voor de gebruikers stel je zowel de NetBIOS accountnaam in, als de gebruikersnaam in het nieuwe formaat. Als naam voor de gebruikers gebruiker je <naam groep> gebruiker <nr> (bv. 2C1 gebruiker 1, 2C1 gebruiker 2, ...).
   * Controleer na uitvoeren van het script of de OU, de groep en de gebruikers correct aangemaakt zijn.

***`opdracht5_8a.ps1`***  
```
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

[string]$locatie = "DC=HOGENT,DC=LOCAL"
[string]$dom= "hogent.local"
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
```