<#
    Oefening 8: service starten

    Schrijf een script dat nakijkt of de iSCSI service is gestart.
    Indien dit niet het geval is, dan dient deze service te worden gestart.
    Hiervan dient melding te worden gemaakt.
    Geef ook een melding als de service wel al gestart was.
#>

Clear-Host

#get-command *service*
#get-service *isc*

# $stat = (Get-Service MSiSCSI).Status

if($(Get-Service MSiSCSI).Status -eq "running")
    {
    Write-Host "de service was al aan het draaien ..."
    }
else
    {
    #Start-Service MSiSCSI
    Write-Host "de service was niet aan het runnen, starting ..."
    (Get-Service MSiSCSI).Start()
    }