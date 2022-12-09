$naam = Read-Host "Geef adres"
$answer = Resolve-DnsName -Name $naam -Type A
Write-Host "$naam heeft als IP adres $($answer.IP4Address) en TTL $($answer.TTL)"
