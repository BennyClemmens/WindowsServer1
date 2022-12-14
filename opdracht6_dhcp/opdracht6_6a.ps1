<#
    6. Schrijf een script dat de volgende 10 reservaties aanmaakt in de scope 192.168.0.0:
    * <x> krijgt een waarde van 1 tot 10
    * Naam reservatie: Laptop<x>
    * IP-adres reservatie: 192.168.0.<100 + x>
    * Mac-adres: 00-11-22-33-44-<50 + x>
    * Dus: laptop1 -> 192.168.0.101 met Mac-adres 00-11-22-33-44-51, enzovoort 
#>

[int]$aantal = 10
[string]$scopeid = "192.168.0.0"
[int]$ipbegin = 70
[int]$macbegin = 50

for($i=1; $i -le $aantal; $i++)
    {
    $naam = "Laptop$i"
    $ip = "192.168.0.$($ipbegin+$i)"
    $mac = "00-11-22-33-44-$($macbegin+$i)"
    Add-DhcpServerv4Reservation -ScopeId $scopeid -IPAddress $ip -Name $naam -ClientId $mac
    }