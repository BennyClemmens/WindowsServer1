<#
    Oefening 7: Priemgetallen bepalen

    Schrijf een script dat 1 getal vraagt aan de gebruiker.
    Vervolgens schrijft het script alle priemgetallen uit die bestaan tot aan het ingegeven getal.

    Een priemgetal is een natuurlijk getal dat groter is dan 1,
    en enkel deelbaar is door 1 en zichzelf.
    Het kleinste priemgetal is dus 2, want het heeft alleen 1 en 2 als delers.
#>

Clear-Host
[int]$tot = read-host "Tot waar wilt u priemgetallen zoeken?"
[int]$aantal = 0
[int]$i = 2

write-host "De volgende priemgetallen werden gevonden"

function is_priem([int]$j)
    {
    for ($k=2; $k -le $($j /2); $k++)
    #Write-Host "we checken k= $k, j=$j)"
        {
        if($j%$k -eq 0)
            {
            return $False # er werd een deler gevonden => geen priemgetal
            }
        }
    return $True # er werd geen deler gevodnen => priemgetal
    } #function

while($i -le $($tot))
    {
    # write-host "$i is minder dan of gelijk aan $($tot) dus ik moet onderzoeken of het een priemgetal is"
    if(is_priem $i)
        {
        write-host "$i is een priemgetal"
        $aantal++
        } #if
    $i++
    } #while

write-host "Het aantal priemgetallen dat werd gevonden is: $aantal"


