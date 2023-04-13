#testje :)

# Get-WindowsFeature -Name AD-Domain-Services

# New-ADOrganizationalUnit -DisplayName


# $domein="florist.local"
$T01_PATH="DC=thematrix,dc=local"
# New-ADOrganizationalUnit -Name DomainWorkstations


##[String[]]$T01_OUS = "DomainWorstations", "DomainUsers"

##Foreach(${T01_OU} in ${T01_OUS})  
   {  
         Write-Host ${T01_OU} wordt aangemaakt
         New-ADOrganizationalUnit -Name ${T01_OU} -ProtectedFromAccidentalDeletion $false
    }


[String[]]$T01_WORKSTATIONS = "PCs", "Servers"

$T01_PREPATH="OU=DomainWorstations"

Foreach(${T01_OU} in ${T01_OUS})  
   {  
         Write-Host ${T01_OU} wordt aangemaakt
         New-ADOrganizationalUnit -Name ${T01_OU} -ProtectedFromAccidentalDeletion $false -Path "${T01_PREPATH},${T01_PATH}"
    }

## aanmaken domein-structuur Active directory:

New-ADOrganizationalUnit -Name "DomainWorkstations" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "PCs" -ProtectedFromAccidentalDeletion $false -Path "OU=Domainworkstations,DC=TheMatrix,DC=Local"
New-ADOrganizationalUnit -Name "Servers" -ProtectedFromAccidentalDeletion $false -Path "OU=DomainWorkstations,DC=TheMatrix,DC=Local"
New-ADOrganizationalUnit -Name "Cast" -ProtectedFromAccidentalDeletion $false -Path "OU=PCs,OU=DomainWorkstations,DC=TheMatrix,DC=Local"
New-ADOrganizationalUnit -Name "Crew" -ProtectedFromAccidentalDeletion $false -Path "OU=PCs,OU=DomainWorkstations,DC=TheMatrix,DC=Local"
New-ADOrganizationalUnit -Name "Directors" -ProtectedFromAccidentalDeletion $false -Path "OU=Crew,OU=PCs,OU=DomainWorkstations,DC=TheMatrix,DC=Local"

New-ADOrganizationalUnit -Name "DomainUsers" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Cast" -ProtectedFromAccidentalDeletion $false -Path "OU=DomainUsers,DC=TheMatrix,DC=Local"
New-ADOrganizationalUnit -Name "Crew" -ProtectedFromAccidentalDeletion $false -Path "OU=DomainUsers,DC=TheMatrix,DC=Local"
New-ADOrganizationalUnit -Name "Directors" -ProtectedFromAccidentalDeletion $false -Path "OU=Crew,OU=DomainUsers,DC=TheMatrix,DC=Local"
New-ADOrganizationalUnit -Name "Producers" -ProtectedFromAccidentalDeletion $false -Path "OU=Crew,OU=DomainUsers,DC=TheMatrix,DC=Local"
