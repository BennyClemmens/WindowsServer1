$groepen = Import-Csv .\groups.csv -Delimiter ';'

foreach ($gr in $groepen) {
    Write-Host $gr.name
    Write-Host $gr.path
    write-host

    }