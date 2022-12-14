<#
    5. Schrijf een script dat voor elke DHCP scope een overzicht op het scherm geeft van de huidige reservaties
    Geef hierbij voor elke reservatie de naam van de reservatie, het MAC-adres van de client en het gereserveerde IP-adres. 
#>

$scopes = Get-DhcpServerv4Scope

foreach($scope in $scopes)
    {
    Write-Host "$(${scope}.name) reservations:"
    $reservations = Get-DhcpServerv4Reservation -ScopeId $scope.ScopeId
    #$reservations
    foreach ($reservation in $reservations)
        {
        write-host "`t$($reservation.name): ($($reservation.clientid)) => $($reservation.ipaddress)"
        }
    }