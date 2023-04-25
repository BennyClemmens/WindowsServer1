
#structuur.csv

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