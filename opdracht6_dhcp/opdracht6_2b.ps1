<#
    2. Schrijf een script dat voor alle DHCP scopes de Exclusion Ranges uitschrijft op het scherm. Geef hierbij voor elke exclusion range het start- en eindadres. 
#>

$scopes = Get-DhcpServerv4Scope

foreach ($scope in $scopes)
    {
    $ranges = Get-DhcpServerv4ExclusionRange -ScopeId $scope.ScopeId
    write-host "$($scope.name):"
    foreach ($range in $ranges)
        {
        Write-Host "`t exclusion from $($range.startrange) to $($range.endrange)"
        }
    }