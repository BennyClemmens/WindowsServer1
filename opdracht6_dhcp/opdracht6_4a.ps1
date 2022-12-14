<#
    4. Schrijf een script dat voor elke DHCP scope een overzicht op het scherm geeft van de huidige leases.
    Geef hierbij voor elke lease het MAC-adres van de client en het toegekende IP-adres. 
#>

$scopes = Get-DhcpServerv4Scope

foreach($scope in $scopes)
    {
    Write-Host "$(${scope}.name) leases:"
    $leases = Get-DhcpServerv4Lease -ScopeId $scope.ScopeId
    #$leases
    foreach ($lease in $leases)
        {
        write-host "`t$($lease.hostname): ($($lease.clientid)) => $($lease.ipaddress)"
        }
    }