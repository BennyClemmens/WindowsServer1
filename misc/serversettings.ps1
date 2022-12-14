<#
    basic settings for WinServer2
    OLOD Windows Server 1, Hogent 2022-2023
#>
$usr = "Administrator"
$pas = "22Admin23"

write-host "checking if ${usr} password expires"
if ((Get-LocalUser -Name Administrator).PasswordExpires -ne ${null})
{
    write-host "password seems to expire, changing ..."
    Get-LocalUser -Name ${usr}|Set-LocalUser -PasswordNeverExpires ${True}
    write-host "dubbelchecking change ..."
    if ((Get-LocalUser -Name ${usr}).PasswordExpires -eq ${null})
    {
        write-host "change succeeded"
    }
    else
    {
        write-host "change failed"
    }
}


write-host "cheking host name"
write-host ".. later ..."