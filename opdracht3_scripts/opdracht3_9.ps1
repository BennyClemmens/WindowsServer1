<#
    Oefening 9: Aanmaken subdirectories

    Maak een script dat aan volgende functionele eisen voldoet:

    x In een door de gebruiker gekozen directory op het C:\ volume (bijvoorbeeld C:\testmap)
    moeten submappen aangemaakt worden. Het bestaan van de hoofdmap wordt gecontroleerd,
    en er wordt bericht gegeven aan de eindgebruiker of de map reeds bestaat, of de map aangemaakt wordt.
    x De gebruiker moet via één of andere manier kunnen invoeren hoeveel submappen aangemaakt moeten worden
    (bij het oproepen van het script of door een vraag te stellen bij uitvoeren van het script).
    x De submappen dragen de naam van de hoger gelegen map met de string sub ervoor geplaatst en een nummer erachter.
    x Voor elke submap die aangemaakt wordt, wordt een log entry weggeschreven in het bestand C:\logs\mapcreatie.txt.
    x Elke log-entry geeft weer wat de naam van de aangemaakte submap is, en wat de datum en het tijdstip van aanmaak is.
#>

$c = "C:\"
$l = "logs\"
$lf = "mapcreatie.txt"
$pre = "sub"

#checking if logfile exists
if (! $(Test-Path "$c$l"))
    {
    md "$c$l"
    }
if(! $(Test-path "$c$l$lf"))
    {
    New-Item -Path "$c$l$lf" -ItemType File
    }


Clear-Host

[string]$hoofdmap = read-host "In welke map wenst u submappen aan te maken"
[int]$aantal = read-host "hoeveel submappen wenst u aan te maken?"

#Write-Host $hoofdmap

if(Test-Path "$c$hoofdmap")
    {
    Write-Host "de map $c$hoofdmap bestaat reeds"
    }
else
    {
    Write-Host "de map $c$hoofdmap bestaat nog niet, wordt aangemaakt"
    New-Item -Path "$c$hoofdmap" -ItemType Directory | Tee-Object -FilePath "$c$l$lf" -Append
    # New-Item -Path "$c$hoofdmap" -ItemType Directory | Out-File -Append "$c$l$lf"
    }

for($i=1; $i -le $aantal; $i++)
    {
    if(test-path "$c$hoofdmap\$pre$hoofdmap$i")
        {
        # Write-Host "$c$hoofdmap\$pre$hoofdmap$i bestaat reeds"
        }
    else
        {
        Write-Host "$c$hoofdmap\$pre$hoofdmap$i wordt aangemaakt"
        New-Item -Path "$c$hoofdmap\$pre$hoofdmap$i" -ItemType Directory | Tee-Object -FilePath "$c$l$lf" -Append
        }
    }
