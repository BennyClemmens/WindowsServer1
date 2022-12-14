# Beheer DHCP

1. Schrijf een script dat van alle DHCP scopes de ScopeID uitschrijft op het scherm.  
***`opdracht6_1a.ps1`***
```
<#
    1. Schrijf een script dat van alle DHCP scopes de ScopeID uitschrijft op het scherm. 
#>

foreach($scope in $(Get-DhcpServerv4Scope))
    {
    Write-Host "$(${scope}.name) : $(${scope}.ScopeId)"
    }
```

2. Schrijf een script dat voor alle DHCP scopes de Exclusion Ranges uitschrijft op het scherm. Geef hierbij voor elke exclusion range het start- en eindadres.  
***`opdracht6_2b.ps1`***
```
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
```

3. Schrijf een script dat voor alle DHCP scopes alle DHCP scope opties uitschrijft op het scherm. Geef hierbij voor elke optie het nummer en de waarde.  
***`opdracht6_3a.ps1`***
```
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
```

4. Schrijf een script dat voor elke DHCP scope een overzicht op het scherm geeft van de huidige leases. Geef hierbij voor elke lease het MAC-adres van de client en het toegekende IP-adres.  
***`opdracht6_4a.ps1`***

```
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
```

5. Schrijf een script dat voor elke DHCP scope een overzicht op het scherm geeft van de huidige reservaties. Geef hierbij voor elke reservatie de naam van de reservatie, het MAC-adres van de client en het gereserveerde IP-adres.  
***`opdracht6_5a.ps1`***

```
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
```

6. Schrijf een script dat de volgende 10 reservaties aanmaakt in de scope 192.168.0.0:

  * <x> krijgt een waarde van 1 tot 10
  * Naam reservatie: Laptop<x>
  * IP-adres reservatie: 192.168.0.<100 + x>
  * Mac-adres: 00-11-22-33-44-<50 + x>
  * Dus: laptop1 -> 192.168.0.101 met Mac-adres 00-11-22-33-44-51, enzovoort

7. Schrijf een script dat alle reservaties aangemaakt in de vorige vraag verwijderd.