<#
    1. Schrijf een script dat van alle DHCP scopes de ScopeID uitschrijft op het scherm. 
#>

$scopes = Get-DhcpServerv4Scope
foreach($scope in $scopes)
    {
    Write-Host "$(${scope}.name) : $(${scope}.ScopeId)"
    }