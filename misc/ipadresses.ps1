Get-NetAdapter -Name Ethernet|Rename-NetAdapter -NewName "WAN"
Get-NetAdapter -Name 'Ethernet 2'|Rename-NetAdapter -NewName "LAN"
(Get-NetAdapter).Name -icontains "wan" -and (Get-NetAdapter).Name -icontains "lan"
Get-NetAdapter -Name 'wan'|Select-Object *

Get-NetIPInterface -AddressFamily IPv4
Get-NetIPInterface -InterfaceAlias 'WAN' -AddressFamily IPv4|Set-NetIPInterface -Dhcp Enabled
Set-DnsClientServerAddress -InterfaceAlias 'WAN' -ResetServerAddresses


Get-NetIPInterface -InterfaceAlias 'LAN' -AddressFamily IPv4|Set-NetIPInterface -Dhcp Disabled
