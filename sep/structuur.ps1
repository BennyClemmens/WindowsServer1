
#structuur.csv

$SEP_COMPUTERNAME= $($Env:computername).tolower() # winserver2 / agentsmith
$SEP_USERDNSDOMAIN = $($Env:USERdnsDOMAIn).tolower() # florist.local / thematrix.local
$SEP_USERDOMAIN = $Env:USERDOMAIn # FLORIST / THEMATRIX => netbios
$SEP_ADDOMAINDN=(get-addomain).distinguishedname # "DC=florist,DC=local" /"DC=thematrix,DC=local"
$SEP_UITVOERDIR= Split-Path $MyInvocation.MyCommand.Path -Parent

$T01_DOMAINDN="DC=florist,DC=local"
$T01_UITGEVOERD= Split-Path $MyInvocation.MyCommand.Path -Parent
#$T01_STRUCTUUR = Import-Csv "$(Split-Path $MyInvocation.MyCommand.Path -Parent)\csv\structuur.csv" -Delimiter ";"
# $T01_STRUCTUUR = Import-Csv "${T01_UITGEVOERD}\structuur.csv" -Delimiter ";"

<#
foreach ($T01_CONTAINER in ${T01_STRUCTUUR}){
    [String]$T01_CONTAINERNAAM = ${T01_CONTAINER}.Containernaam;
    [String]$T01_DELIM = ","
    if (-not ${T01_CONTAINER}.Prepath) {
        $T01_DELIM = ""
    }
    [String]$T01_VOLLEDIGPATH = ${T01_CONTAINER}.Prepath + ${T01_DELIM} + ${T01_PATH}
    write-host ${T01_CONTAINERNAAM} wordt aangemaakt in ${T01_VOLLEDIGPATH}
    New-ADOrganizationalUnit -Name ${T01_CONTAINERNAAM} -ProtectedFromAccidentalDeletion $false -Path ${T01_VOLLEDIGPATH}
}
#>

$T01_COMPUTERS = Import-Csv "${T01_UITGEVOERD}\computers.csv" -Delimiter ";"

foreach ($T01_COMPUTER in ${T01_COMPUTERS}){
    [String]$T01_COMPUTERHOST = ${T01_COMPUTER}.host
    [String]$T01_COMPUTEROU = ${T01_COMPUTER}.ou
    # [String]$T01_COMPUTERIP = ${T01_COMPUTER}.ip
    [String]$T01_COMPUTERDESCRIPTION = ${T01_COMPUTER}.description

    [String]$T01_COMPUTERPATHDN = ${T01_COMPUTER}.ou + ',' + ${T01_DOMAINDN}

    #write-host ik moet iets doen met volgende gegevens: ${T01_COMPUTERHOST}, ${T01_COMPUTEROU}, ${T01_COMPUTERIP} en misschien ${T01_COMPUTERPATHDN} en ${T01_COMPUTERDESCRIPTION}
    #write-host "eerst even kijken of deze nog niet bestaat"
    if (Get-ADComputer -F { Name -eq ${T01_COMPUTERHOST} }) {
        Write-Warning "Skipping adding ${T01_COMPUTERHOST}, allready in ${T01_DOMAINDN}"
    }
    else {
        write-host "adding ${T01_COMPUTERHOST} to ${T01_DOMAINDN}"
        new-adcomputer `
            -Name ${T01_COMPUTERHOST} `
            -Path ${T01_COMPUTERPATHDN} `
            -Description ${T01_COMPUTERDESCRIPTION}
    }

}

function sep_eerste([String] $inputString, [int] $numberOfChars = 3) {
    return $inputString.substring(0, @($inputString.length,$numberOfChars)[$inputString.length -ge $numberOfChars]) 
}

function sep_fmaaksam([String]$voor, [String]$achter) {
    #write-host $voor
    #write-host $achter
    #return "$(sep_eerste($voor,3))"
    return $(sep_eerste $voor 3).toLower() + "_" + $(sep_eerste $achter 3).toLower()
}

function sep_fcontroleersam([String]$sam){
if ($sam.length -le 6) { write-warning "SamAccountName (${sam}) too short"}
if ([bool](Get-ADUser -Filter { SamAccountName -eq $sam })) { write-warning "SamAccountName (${sam}) allready present in domain"}
return ($sam.length -gt 6) -and (-not [bool](Get-ADUser -Filter { SamAccountName -eq $sam }))
}

function sep_fmaakpass([String]$sam){
    #return $sam.substring(0,1).toUpper() + $sam.substring(1,2) + '&' + $sam.substring(4,1).toUpper() + $sam.substring(5,2)  
    return "22Student23"
}

$SEP_USERS = Import-Csv "${SEP_UITVOERDIR}\users.csv" -Delimiter ";"

foreach ($SEP_USER in ${SEP_USERS}){
    [String]$SEP_FIRSTNAME = ${SEP_USER}.firstname
    [String]$SEP_LASTNAME = ${SEP_USER}.lastname

    [String]$SEP_SAM = sep_fmaaksam ${SEP_FIRSTNAME} ${SEP_LASTNAME}
    if (sep_fcontroleersam ${SEP_SAM}) {
        write-host "we gaan ${SEP_SAM} maken"
        [String]$SEP_NAME = "${SEP_FIRSTNAME} ${SEP_LASTNAME}"
        [String]$SEP_DISPLAYNAME = "${SEP_FIRSTNAME} ${SEP_LASTNAME}"
        [String]$SEP_TITLE = ${SEP_USER}.title
        [String]$SEP_OU = ${SEP_USER}.ou
        [String]$SEP_USERPATHDN = ${SEP_OU} + ',' + ${SEP_ADDOMAINDN}

        [String]$SEP_PASS = sep_fmaakpass ${SEP_SAM}

        if (-not ${SEP_USER}.description) {
            [String]$SEP_DESCRIPTION = ""
        }
        else {
            [String]$SEP_DESCRIPTION  = ${SEP_USER}.description
        }

        [String]$SEP_DEPARTMENT = (Get-ADOrganizationalUnit -Identity "${SEP_USERPATHDN}").name

        New-ADUser `            -Name "${SEP_NAME}" `            -givenname "${SEP_FIRSTNAME}" `
            -Surname "${SEP_LASTNAME}" `            -DisplayName "${SEP_DISPLAYNAME}" `
            -SamAccountName "${SEP_SAM}" `
            -UserPrincipalName "${SEP_SAM}@$SEP_USERDNSDOMAIN" `
            -ProfilePath \\${SEP_COMPUTERNAME}\userprofiles\${SEP_SAM} `
            -HomeDirectory \\${SEP_COMPUTERNAME}\userfolders\${SEP_SAM} `
            -HomeDrive "Y:" `
            -Path ${SEP_USERPATHDN} `
            -Enabled $True `            -AccountPassword (ConvertTo-SecureString ${SEP_PASS} -AsPlainText -Force) `
            -ChangePasswordAtLogon $False `            -Title "${SEP_TITLE}" `
            -Description "${SEP_DESCRIPTION}" `            -Department "${SEP_DEPARTMENT}"

<#
            -Department 'Department' `
            -SamAccountName "kea_rea" `
            -UserPrincipalName "kea_ree@florist.local" `
            -ProfilePath \\winserver2\userprofiles\ben_cle


            -LogonWorkstations
            #>

# -Identity = SamAccountName
        
    }
    else {
        write-warning "skipping making account ${SEP_SAM}"


    }

}


<#
if ($OU.Contains("OU=DomainUsers")){
    if (Get-ADUser -F { SamAccountName -eq $username}) {
        Write-Warning "User already exists with username $username"
    }
    Else {
        New-ADUser `
            -SamAccountName $username `
            -UserPrincipalName "$username@$domein" `
            -Name "$firstname $lastname" `
            -GivenName $firstname `
            -Surname $lastname `
            -Displayname "$firstname, $lastname" `
            -Initials $initials `
            -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -ChangePasswordAtLogon $True `
            -EmailAddress $email `
            -Department $deparment `
            -Path $OU `
            -Enabled $true

        Write-Host "User created with username $username"
         }
    }
#> 