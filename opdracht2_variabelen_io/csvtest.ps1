Get-Localuser | Export-Csv lokaal.csv

$gebruikers = Import-Csv lokaal.csv

$i=0
foreach ($ge in $gebruikers) {
write-host de gebruiker  ${ge}.name : ${ge}.description
$i++
}
write-host
write-host "totaal : ${i}"