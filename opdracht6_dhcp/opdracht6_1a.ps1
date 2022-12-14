<#
    1. Schrijf een script dat van alle DHCP scopes de ScopeID uitschrijft op het scherm. 
#>

foreach($scope in $(Get-DhcpServerv4Scope))
    {
    Write-Host "$(${scope}.name) : $(${scope}.ScopeId)"
    }