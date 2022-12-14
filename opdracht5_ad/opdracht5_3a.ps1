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