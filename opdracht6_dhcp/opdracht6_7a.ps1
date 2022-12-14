<#
    7. Schrijf een script dat alle reservaties aangemaakt in de vorige vraag verwijderd. 
#>

[int]$aantal = 10
[string]$scopeid = "192.168.0.0"
[int]$ipbegin = 70
[int]$macbegin = 50

for($i=1; $i -le $aantal; $i++)
    {
    $mac = "00-11-22-33-44-$($macbegin+$i)"
    remove-DhcpServerv4Reservation -ScopeId $scopeid -ClientId $mac
    }