#structuur.csv

$T01_PATH="DC=florist,DC=local"
$T01_STRUCTUUR = Import-Csv "$(Split-Path $MyInvocation.MyCommand.Path -Parent)\csv\structuur.csv" -Delimiter ";"

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


# $scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
