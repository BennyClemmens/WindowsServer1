<#
    6. Gebruik PowerShell om het A-record op te halen voor laptop25.
    Haal nadien het PTR record op voor het IP-adres dat je verkreeg via het A-record.

    Tip: gebruik de methode GetAddressBytes() om een IP-adres op te delen
#>

$zonenaam = "example.temp"
$reversezonenaam = "10.168.192.in-addr.arpa"
$lt="laptop25"

write-host "forward lookup ${lt} in ${zonenaam}:"
$fwrecord = $(Get-DnsServerResourceRecord -ZoneName ${zonenaam} –Name ${lt})
write-host "$(${fwrecord}.RecordData.IPv4Address)"

$hostnummer = $fwrecord.recorddata.ipv4address.getaddressbytes()[3]
write-host "reverse lookup host ${hostnummer} in ${reversezonenaam}:"
$revrecord = $(Get-DnsServerResourceRecord -ZoneName ${reversezonenaam} –Name ${hostnummer})
write-host "$(${revrecord}.RecordData.PtrDomainname)"