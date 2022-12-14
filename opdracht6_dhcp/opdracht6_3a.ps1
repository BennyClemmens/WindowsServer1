<#
    3. Schrijf een script dat voor alle DHCP scopes alle DHCP scope opties uitschrijft op het scherm.
    Geef hierbij voor elke optie het nummer en de waarde. 
#>

$scopes = Get-DhcpServerv4Scope

foreach($scope in $scopes)
    {
    Write-Host "Scope $($scope.ScopeId)"
    $options = Get-DhcpServerv4OptionValue -ScopeId $scope.ScopeId
    #$options
    foreach($option in $options)
        {
        Write-Host "`t Scope option $($option.OptionId) ($($option.Name)): $($option.Value)"
        }
    }