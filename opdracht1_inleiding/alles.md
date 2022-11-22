# Inleiding PowerShell
In deze eerste reeks zullen we de commando’s van PowerShell verkennen. We gebruiken hiervoor de VM met Windows 10 die we aangemaakt hebben in het eerste labo van Windows Server I.

Je mag voor deze reeks rechtstreeks werken in een PowerShell prompt (dus geen PowerShell ISE nodig).

## A. Basisconcepten

1. Voer het commando Get-Help uit (zonder parameters). Welke parameter kan je gebruiken bij dit commando om de Online versie van een helppagina in de browser te openen? Test dit uit.
```
PS C:\git\WindowsServer1\opdracht1_inleiding> get-help

TOPIC
    Windows PowerShell Help System

SHORT DESCRIPTION
    Displays help about Windows PowerShell cmdlets and concepts.

LONG DESCRIPTION
    Windows PowerShell Help describes Windows PowerShell cmdlets,
    functions, scripts, and modules, and explains concepts, including
    the elements of the Windows PowerShell language.

    Windows PowerShell does not include help files, but you can read the
    help topics online, or use the Update-Help cmdlet to download help files
    to your computer and then use the Get-Help cmdlet to display the help
    topics at the command line.

    You can also use the Update-Help cmdlet to download updated help files
    as they are released so that your local help content is never obsolete.

    Without help files, Get-Help displays auto-generated help for cmdlets,
    functions, and scripts.


  ONLINE HELP
    You can find help for Windows PowerShell online in the TechNet Library
    beginning at http://go.microsoft.com/fwlink/?LinkID=108518.

    To open online help for any cmdlet or function, type:

        Get-Help <cmdlet-name> -Online

  UPDATE-HELP
    To download and install help files on your computer:

       1. Start Windows PowerShell with the "Run as administrator" option.
       2. Type:

          Update-Help

    After the help files are installed, you can use the Get-Help cmdlet to
    display the help topics. You can also use the Update-Help cmdlet to
    download updated help files so that your local help files are always
    up-to-date.

    For more information about the Update-Help cmdlet, type:

       Get-Help Update-Help -Online

    or go to: http://go.microsoft.com/fwlink/?LinkID=210614


  GET-HELP
    The Get-Help cmdlet displays help at the command line from content in
    help files on your computer. Without help files, Get-Help displays basic
    help about cmdlets and functions. You can also use Get-Help to display
    online help for cmdlets and functions.

    To get help for a cmdlet, type:

        Get-Help <cmdlet-name>

    To get online help, type:

        Get-Help <cmdlet-name> -Online

    The titles of conceptual topics begin with "About_".
    To get help for a concept or language element, type:

        Get-Help About_<topic-name>

    To search for a word or phrase in all help files, type:

        Get-Help <search-term>

    For more information about the Get-Help cmdlet, type:

        Get-Help Get-Help -Online

    or go to: http://go.microsoft.com/fwlink/?LinkID=113316


  EXAMPLES:
      Save-Help              : Download help files from the Internet and saves
                               them on a file share.
      Update-Help            : Downloads and installs help files from the
                               Internet or a file share.
      Get-Help Get-Process   : Displays help about the Get-Process cmdlet.
      Get-Help Get-Process -Online
                             : Opens online help for the Get-Process cmdlet.
      Help Get-Process       : Displays help about Get-Process one page at a time.
      Get-Process -?         : Displays help about the Get-Process cmdlet.
      Get-Help About_Modules : Displays help about Windows PowerShell modules.
      Get-Help remoting      : Searches the help topics for the word "remoting."

  SEE ALSO:
      about_Updatable_Help
      Get-Help
      Save-Help
      Update-Help
PS C:\git\WindowsServer1\opdracht1_inleiding> get-help get-help -online
```

2. Ga op zoek naar het commando uit om de help files van het internet te downloaden en installeren. Voer dit commando uit.
```
PS C:\git\WindowsServer1\opdracht1_inleiding> Update-help
Update-help : Failed to update Help for the module(s) 'PSReadline' with UI culture(s) {en-US} : Unable to retrieve the HelpInfo XML
file for UI culture en-US. Make sure the HelpInfoUri property in the module manifest is valid or check your network connection and
then try the command again.
At line:1 char:1
+ Update-help
+ ~~~~~~~~~~~
    + CategoryInfo          : ResourceUnavailable: (:) [Update-Help], Exception
    + FullyQualifiedErrorId : UnableToRetrieveHelpInfoXml,Microsoft.PowerShell.Commands.UpdateHelpCommand
```

3. Toon de Help voor het commando Get-Alias (output in terminal). Toon hierbij de volledige (“full”) output inclusief voorbeelden. Welke parameters zijn verplicht bij gebruik van het commando Get-Alias?
```
PS C:\git\WindowsServer1\opdracht1_inleiding> get-help get-alias

NAME
    Get-Alias

SYNOPSIS
    Gets the aliases for the current session.


SYNTAX
    Get-Alias [-Definition <System.String[]>] [-Exclude <System.String[]>] [-Scope <System.String>] [<CommonParameters>]

    Get-Alias [[-Name] <System.String[]>] [-Exclude <System.String[]>] [-Scope <System.String>] [<CommonParameters>]


DESCRIPTION
    The `Get-Alias` cmdlet gets the aliases in the current session. This includes built-in aliases, aliases that you have set or
    imported, and aliases that you have added to your PowerShell profile.

    By default, `Get-Alias` takes an alias and returns the command name. When you use the Definition parameter, `Get-Alias` takes a
    command name and returns its aliases.

    Beginning in Windows PowerShell 3.0, `Get-Alias` displays non-hyphenated alias names in an `<alias> -> <definition>` format to
    make it even easier to find the information that you need.


RELATED LINKS
    Online Version:
    https://learn.microsoft.com/powershell/module/microsoft.powershell.utility/get-alias?view=powershell-5.1&WT.mc_id=ps-gethelp
    Export-Alias
    Import-Alias
    New-Alias
    Set-Alias
    Alias Provider
    about_Aliases

REMARKS
    To see the examples, type: "get-help Get-Alias -examples".
    For more information, type: "get-help Get-Alias -detailed".
    For technical information, type: "get-help Get-Alias -full".
    For online help, type: "get-help Get-Alias -online"
```
**`geen verplichte argumenten`**
```
PS C:\git\WindowsServer1\opdracht1_inleiding> get-help get-alias -full

NAME
    Get-Alias

SYNOPSIS
    Gets the aliases for the current session.


SYNTAX
    Get-Alias [-Definition <System.String[]>] [-Exclude <System.String[]>] [-Scope <System.String>] [<CommonParameters>]

    Get-Alias [[-Name] <System.String[]>] [-Exclude <System.String[]>] [-Scope <System.String>] [<CommonParameters>]


DESCRIPTION
    The `Get-Alias` cmdlet gets the aliases in the current session. This includes built-in aliases, aliases that you have set or
    imported, and aliases that you have added to your PowerShell profile.

    By default, `Get-Alias` takes an alias and returns the command name. When you use the Definition parameter, `Get-Alias` takes a
    command name and returns its aliases.

    Beginning in Windows PowerShell 3.0, `Get-Alias` displays non-hyphenated alias names in an `<alias> -> <definition>` format to
    make it even easier to find the information that you need.


PARAMETERS
    -Definition <System.String[]>
        Gets the aliases for the specified item. Enter the name of a cmdlet, function, script, file, or executable file.

        This parameter is called Definition , because it searches for the item name in the Definition property of the alias object.

        Required?                    false
        Position?                    named
        Default value                None
        Accept pipeline input?       False
        Accept wildcard characters?  true

    -Exclude <System.String[]>
        Omits the specified items. The value of this parameter qualifies the Name and Definition parameters. Enter a name, a
        definition, or a pattern, such as "s*". Wildcards are permitted.

        Required?                    false
        Position?                    named
        Default value                None
        Accept pipeline input?       False
        Accept wildcard characters?  true

    -Name <System.String[]>
        Specifies the aliases that this cmdlet gets. Wildcards are permitted. By default, `Get-Alias` retrieves all aliases defined
        for the current session. The parameter name Name is optional. You can also pipe alias names to `Get-Alias`.

        Required?                    false
        Position?                    0
        Default value                All aliases
        Accept pipeline input?       True (ByPropertyName, ByValue)
        Accept wildcard characters?  true

    -Scope <System.String>
        Specifies the scope for which this cmdlet gets aliases. The acceptable values for this parameter are:

        - `Global`

        - `Local`

        - `Script`

        - A number relative to the current scope (0 through the number of scopes, where 0 is the current

        scope and 1 is its parent)

        `Local` is the default. For more information, see about_Scopes (../Microsoft.PowerShell.Core/About/about_Scopes.md).

        Required?                    false
        Position?                    named
        Default value                Local
        Accept pipeline input?       False
        Accept wildcard characters?  false

    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https:/go.microsoft.com/fwlink/?LinkID=113216).

INPUTS
    System.String
        You can pipe alias names to `Get-Alias`.


OUTPUTS
    System.Management.Automation.AliasInfo
        `Get-Alias` returns an object that represents each alias. `Get-Alias` returns the same object for every alias, but
        PowerShell uses an arrow-based format to display the names of non-hyphenated aliases.


NOTES


        Windows PowerShell includes the following aliases for `Get-Alias`:

        - `gal`

        - To create a new alias, use `Set-Alias` or `New-Alias`. To delete an alias, use `Remove-Item`.

        - The arrow-based alias name format is not used for aliases that include a hyphen. These are likely

        to be preferred substitute names for cmdlets and functions, instead of typical abbreviations or   nicknames.

    ------ Example 1: Get all aliases in the current session ------

    Get-Alias

    CommandType     Name
    -----------     ----
    Alias           % -> ForEach-Object
    Alias           ? -> Where-Object
    Alias           ac -> Add-Content
    Alias           asnp -> Add-PSSnapin
    Alias           cat -> Get-Content
    Alias           cd -> Set-Location
    Alias           chdir -> Set-Location
    Alias           clc -> Clear-Content
    Alias           clear -> Clear-Host
    Alias           clhy -> Clear-History
    ...

    This command gets all aliases in the current session.

    The output shows the `<alias> -> <definition>` format that was introduced in Windows PowerShell 3.0. This format is used only
    for aliases that do not include hyphens, because aliases with hyphens are typically preferred names for cmdlets and functions,
    rather than nicknames.
    ---------------- Example 2: Get aliases by name ----------------

    Get-Alias -Name gp*, sp* -Exclude *ps

    This command gets all aliases that begin with gp or sp, except for aliases that end with ps.
    ------------- Example 3: Get aliases for a cmdlet -------------

    Get-Alias -Definition Get-ChildItem

    This command gets the aliases for the `Get-ChildItem` cmdlet.

    By default, the `Get-Alias` cmdlet gets the item name when you know the alias. The Definition parameter gets the alias when you
    know the item name.
    -------------- Example 4: Get aliases by property --------------

    Get-Alias | Where-Object {$_.Options -Match "ReadOnly"}

    This command gets all aliases in which the value of the Options property is ReadOnly . This command provides a quick way to find
    the aliases that are built into PowerShell, because they have the ReadOnly option. Options is just one property of the AliasInfo
    objects that `Get-Alias` gets. To find all properties and methods of AliasInfo objects, type `Get-Alias | get-member`.
    Example 5: Get aliases by name and filter by beginning letter

    Get-Alias -Definition "*-PSSession" -Exclude e* -Scope Global

    This example gets aliases for commands that have names that end in "-PSSession", except for those that begin with "e".

    The command uses the Scope parameter to apply the command in the global scope. This is useful in scripts when you want to get
    the aliases in the session.

RELATED LINKS
    Online Version:
    https://learn.microsoft.com/powershell/module/microsoft.powershell.utility/get-alias?view=powershell-5.1&WT.mc_id=ps-gethelp
    Export-Alias
    Import-Alias
    New-Alias
    Set-Alias
    Alias Provider
    about_Aliases
```

4. Toon een overzicht van alle werkwoorden die gebruikt worden binnen commando’s in PowerShell.
```
PS C:\git\WindowsServer1\opdracht1_inleiding> get-verb

Verb        Group
----        -----
Add         Common
Clear       Common
Close       Common
Copy        Common
Enter       Common
Exit        Common
Find        Common
Format      Common
Get         Common
Hide        Common
Join        Common
Lock        Common
Move        Common
New         Common
Open        Common
Optimize    Common
Pop         Common
Push        Common
Redo        Common
Remove      Common
Rename      Common
Reset       Common
Resize      Common
Search      Common
Select      Common
Set         Common
Show        Common
Skip        Common
Split       Common
Step        Common
Switch      Common
Undo        Common
Unlock      Common
Watch       Common
Backup      Data
Checkpoint  Data
Compare     Data
Compress    Data
Convert     Data
ConvertFrom Data
ConvertTo   Data
Dismount    Data
Edit        Data
Expand      Data
Export      Data
Group       Data
Import      Data
Initialize  Data
Limit       Data
Merge       Data
Mount       Data
Out         Data
Publish     Data
Restore     Data
Save        Data
Sync        Data
Unpublish   Data
Update      Data
Approve     Lifecycle
Assert      Lifecycle
Complete    Lifecycle
Confirm     Lifecycle
Deny        Lifecycle
Disable     Lifecycle
Enable      Lifecycle
Install     Lifecycle
Invoke      Lifecycle
Register    Lifecycle
Request     Lifecycle
Restart     Lifecycle
Resume      Lifecycle
Start       Lifecycle
Stop        Lifecycle
Submit      Lifecycle
Suspend     Lifecycle
Uninstall   Lifecycle
Unregister  Lifecycle
Wait        Lifecycle
Debug       Diagnostic
Measure     Diagnostic
Ping        Diagnostic
Repair      Diagnostic
Resolve     Diagnostic
Test        Diagnostic
Trace       Diagnostic
Connect     Communications
Disconnect  Communications
Read        Communications
Receive     Communications
Send        Communications
Write       Communications
Block       Security
Grant       Security
Protect     Security
Revoke      Security
Unblock     Security
Unprotect   Security
Use         Other
```

5. Idem als vorige vraag, maar toon enkel werkwoorden die ergens de letter X in de naam hebben
```
PS C:\git\WindowsServer1\opdracht1_inleiding> get-verb *x*

Verb   Group
----   -----
Exit   Common
Expand Data
Export Data
```

6. Toon een overzicht van alle commando’s die ingeladen zijn.
```
PS C:\git\WindowsServer1\opdracht1_inleiding> get-command

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           Add-AppPackage                                     2.0.1.0    Appx
Alias           Add-AppPackageVolume                               2.0.1.0    Appx
Alias           Add-AppProvisionedPackage                          3.0        Dism
Alias           Add-ProvisionedAppPackage                          3.0        Dism
Alias           Add-ProvisionedAppxPackage                         3.0        Dism
Alias           Add-ProvisioningPackage                            3.0        Provisioning
Alias           Add-TrustedProvisioningCertificate                 3.0        Provisioning
Alias           Apply-WindowsUnattend                              3.0        Dism
Alias           Disable-PhysicalDiskIndication                     2.0.0.0    Storage
Alias           Disable-StorageDiagnosticLog                       2.0.0.0    Storage
Alias           Dismount-AppPackageVolume                          2.0.1.0    Appx
Alias           Enable-PhysicalDiskIndication                      2.0.0.0    Storage
Alias           Enable-StorageDiagnosticLog                        2.0.0.0    Storage
Alias           Flush-Volume                                       2.0.0.0    Storage
Alias           Get-AppPackage                                     2.0.1.0    Appx
Alias           Get-AppPackageDefaultVolume                        2.0.1.0    Appx
Alias           Get-AppPackageLastError                            2.0.1.0    Appx
Alias           Get-AppPackageLog                                  2.0.1.0    Appx
Alias           Get-AppPackageManifest                             2.0.1.0    Appx
Alias           Get-AppPackageVolume                               2.0.1.0    Appx
Alias           Get-AppProvisionedPackage                          3.0        Dism
Alias           Get-BinRoot                                        0.0        chocolateyInstaller
Alias           Get-DiskSNV                                        2.0.0.0    Storage
Alias           Get-PackageParameters                              0.0        chocolateyInstaller
Alias           Get-PhysicalDiskSNV                                2.0.0.0    Storage
Alias           Get-ProvisionedAppPackage                          3.0        Dism
Alias           Get-ProvisionedAppxPackage                         3.0        Dism
Alias           Get-StorageEnclosureSNV                            2.0.0.0    Storage
Alias           Initialize-Volume                                  2.0.0.0    Storage
Alias           Mount-AppPackageVolume                             2.0.1.0    Appx
Alias           Move-AppPackage                                    2.0.1.0    Appx
Alias           Move-SmbClient                                     2.0.0.0    SmbWitness
Alias           Optimize-AppProvisionedPackages                    3.0        Dism
Alias           Optimize-ProvisionedAppPackages                    3.0        Dism
Alias           Optimize-ProvisionedAppxPackages                   3.0        Dism
Alias           Remove-AppPackage                                  2.0.1.0    Appx
Alias           Remove-AppPackageVolume                            2.0.1.0    Appx
Alias           Remove-AppProvisionedPackage                       3.0        Dism
Alias           Remove-EtwTraceSession                             1.0.0.0    EventTracingManagement
Alias           Remove-ProvisionedAppPackage                       3.0        Dism
Alias           Remove-ProvisionedAppxPackage                      3.0        Dism
Alias           Remove-ProvisioningPackage                         3.0        Provisioning
Alias           Remove-TrustedProvisioningCertificate              3.0        Provisioning
Alias           Set-AppPackageDefaultVolume                        2.0.1.0    Appx
Alias           Set-AppPackageProvisionedDataFile                  3.0        Dism
Alias           Set-AutologgerConfig                               1.0.0.0    EventTracingManagement
Alias           Set-EtwTraceSession                                1.0.0.0    EventTracingManagement
Alias           Set-ProvisionedAppPackageDataFile                  3.0        Dism
Alias           Set-ProvisionedAppXDataFile                        3.0        Dism
Alias           Write-FileSystemCache                              2.0.0.0    Storage
Function        A:
Function        Add-BCDataCacheExtension                           1.0.0.0    BranchCache
Function        Add-BitLockerKeyProtector                          1.0.0.0    BitLocker
Function        Add-DnsClientNrptRule                              1.0.0.0    DnsClient
Function        Add-DtcClusterTMMapping                            1.0.0.0    MsDtc
Function        Add-EtwTraceProvider                               1.0.0.0    EventTracingManagement
Function        Add-InitiatorIdToMaskingSet                        2.0.0.0    Storage
Function        Add-MpPreference                                   1.0        Defender
Function        Add-NetEventNetworkAdapter                         1.0.0.0    NetEventPacketCapture
Function        Add-NetEventPacketCaptureProvider                  1.0.0.0    NetEventPacketCapture
Function        Add-NetEventProvider                               1.0.0.0    NetEventPacketCapture
Function        Add-NetEventVFPProvider                            1.0.0.0    NetEventPacketCapture
Function        Add-NetEventVmNetworkAdapter                       1.0.0.0    NetEventPacketCapture
Function        Add-NetEventVmSwitch                               1.0.0.0    NetEventPacketCapture
Function        Add-NetEventVmSwitchProvider                       1.0.0.0    NetEventPacketCapture
Function        Add-NetEventWFPCaptureProvider                     1.0.0.0    NetEventPacketCapture
Function        Add-NetIPHttpsCertBinding                          1.0.0.0    NetworkTransition
Function        Add-NetLbfoTeamMember                              2.0.0.0    NetLbfo
Function        Add-NetLbfoTeamNic                                 2.0.0.0    NetLbfo
Function        Add-NetNatExternalAddress                          1.0.0.0    NetNat
Function        Add-NetNatStaticMapping                            1.0.0.0    NetNat
Function        Add-NetSwitchTeamMember                            1.0.0.0    NetSwitchTeam
Function        Add-OdbcDsn                                        1.0.0.0    Wdac
Function        Add-PartitionAccessPath                            2.0.0.0    Storage
Function        Add-PhysicalDisk                                   2.0.0.0    Storage
Function        Add-Printer                                        1.1        PrintManagement
Function        Add-PrinterDriver                                  1.1        PrintManagement
Function        Add-PrinterPort                                    1.1        PrintManagement
Function        Add-StorageFaultDomain                             2.0.0.0    Storage
Function        Add-TargetPortToMaskingSet                         2.0.0.0    Storage
Function        Add-VirtualDiskToMaskingSet                        2.0.0.0    Storage
Function        Add-VpnConnection                                  2.0.0.0    VpnClient
Function        Add-VpnConnectionRoute                             2.0.0.0    VpnClient
Function        Add-VpnConnectionTriggerApplication                2.0.0.0    VpnClient
Function        Add-VpnConnectionTriggerDnsConfiguration           2.0.0.0    VpnClient
Function        Add-VpnConnectionTriggerTrustedNetwork             2.0.0.0    VpnClient
Function        AfterAll                                           3.4.0      Pester
Function        AfterEach                                          3.4.0      Pester
Function        Assert-MockCalled                                  3.4.0      Pester
Function        Assert-VerifiableMocks                             3.4.0      Pester
Function        B:
Function        Backup-BitLockerKeyProtector                       1.0.0.0    BitLocker
Function        BackupToAAD-BitLockerKeyProtector                  1.0.0.0    BitLocker
Function        BeforeAll                                          3.4.0      Pester
Function        BeforeEach                                         3.4.0      Pester
Function        Block-FileShareAccess                              2.0.0.0    Storage
Function        Block-SmbShareAccess                               2.0.0.0    SmbShare
Function        C:
Function        cd..
Function        cd\
Function        Clear-AssignedAccess                               1.0.0.0    AssignedAccess
Function        Clear-BCCache                                      1.0.0.0    BranchCache
Function        Clear-BitLockerAutoUnlock                          1.0.0.0    BitLocker
Function        Clear-Disk                                         2.0.0.0    Storage
Function        Clear-DnsClientCache                               1.0.0.0    DnsClient
Function        Clear-FileStorageTier                              2.0.0.0    Storage
Function        Clear-Host
Function        Clear-PcsvDeviceLog                                1.0.0.0    PcsvDevice
Function        Clear-StorageBusDisk                               1.0.0.0    StorageBusCache
Function        Clear-StorageDiagnosticInfo                        2.0.0.0    Storage
Function        Close-SmbOpenFile                                  2.0.0.0    SmbShare
Function        Close-SmbSession                                   2.0.0.0    SmbShare
Function        Compress-Archive                                   1.0.1.0    Microsoft.PowerShell.Archive
Function        Configuration                                      1.1        PSDesiredStateConfiguration
Function        Connect-IscsiTarget                                1.0.0.0    iSCSI
Function        Connect-VirtualDisk                                2.0.0.0    Storage
Function        Context                                            3.4.0      Pester
Function        ConvertFrom-SddlString                             3.1.0.0    Microsoft.PowerShell.Utility
Function        Copy-NetFirewallRule                               2.0.0.0    NetSecurity
Function        Copy-NetIPsecMainModeCryptoSet                     2.0.0.0    NetSecurity
Function        Copy-NetIPsecMainModeRule                          2.0.0.0    NetSecurity
Function        Copy-NetIPsecPhase1AuthSet                         2.0.0.0    NetSecurity
Function        Copy-NetIPsecPhase2AuthSet                         2.0.0.0    NetSecurity
Function        Copy-NetIPsecQuickModeCryptoSet                    2.0.0.0    NetSecurity
Function        Copy-NetIPsecRule                                  2.0.0.0    NetSecurity
Function        D:
Function        Debug-FileShare                                    2.0.0.0    Storage
Function        Debug-MMAppPrelaunch                               1.0        MMAgent
Function        Debug-StorageSubSystem                             2.0.0.0    Storage
Function        Debug-Volume                                       2.0.0.0    Storage
Function        Describe                                           3.4.0      Pester
Function        Disable-BC                                         1.0.0.0    BranchCache
Function        Disable-BCDowngrading                              1.0.0.0    BranchCache
Function        Disable-BCServeOnBattery                           1.0.0.0    BranchCache
Function        Disable-BitLocker                                  1.0.0.0    BitLocker
Function        Disable-BitLockerAutoUnlock                        1.0.0.0    BitLocker
Function        Disable-DAManualEntryPointSelection                1.0.0.0    DirectAccessClientComponents
Function        Disable-DeliveryOptimizationVerboseLogs            1.0.2.0    DeliveryOptimization
Function        Disable-DscDebug                                   1.1        PSDesiredStateConfiguration
Function        Disable-MMAgent                                    1.0        MMAgent
Function        Disable-NetAdapter                                 2.0.0.0    NetAdapter
Function        Disable-NetAdapterBinding                          2.0.0.0    NetAdapter
Function        Disable-NetAdapterChecksumOffload                  2.0.0.0    NetAdapter
Function        Disable-NetAdapterEncapsulatedPacketTaskOffload    2.0.0.0    NetAdapter
Function        Disable-NetAdapterIPsecOffload                     2.0.0.0    NetAdapter
Function        Disable-NetAdapterLso                              2.0.0.0    NetAdapter
Function        Disable-NetAdapterPacketDirect                     2.0.0.0    NetAdapter
Function        Disable-NetAdapterPowerManagement                  2.0.0.0    NetAdapter
Function        Disable-NetAdapterQos                              2.0.0.0    NetAdapter
Function        Disable-NetAdapterRdma                             2.0.0.0    NetAdapter
Function        Disable-NetAdapterRsc                              2.0.0.0    NetAdapter
Function        Disable-NetAdapterRss                              2.0.0.0    NetAdapter
Function        Disable-NetAdapterSriov                            2.0.0.0    NetAdapter
Function        Disable-NetAdapterUso                              2.0.0.0    NetAdapter
Function        Disable-NetAdapterVmq                              2.0.0.0    NetAdapter
Function        Disable-NetDnsTransitionConfiguration              1.0.0.0    NetworkTransition
Function        Disable-NetFirewallRule                            2.0.0.0    NetSecurity
Function        Disable-NetIPHttpsProfile                          1.0.0.0    NetworkTransition
Function        Disable-NetIPsecMainModeRule                       2.0.0.0    NetSecurity
Function        Disable-NetIPsecRule                               2.0.0.0    NetSecurity
Function        Disable-NetNatTransitionConfiguration              1.0.0.0    NetworkTransition
Function        Disable-NetworkSwitchEthernetPort                  1.0.0.0    NetworkSwitchManager
Function        Disable-NetworkSwitchFeature                       1.0.0.0    NetworkSwitchManager
Function        Disable-NetworkSwitchVlan                          1.0.0.0    NetworkSwitchManager
Function        Disable-OdbcPerfCounter                            1.0.0.0    Wdac
Function        Disable-PhysicalDiskIdentification                 2.0.0.0    Storage
Function        Disable-PnpDevice                                  1.0.0.0    PnpDevice
Function        Disable-PSTrace                                    1.0.0.0    PSDiagnostics
Function        Disable-PSWSManCombinedTrace                       1.0.0.0    PSDiagnostics
Function        Disable-ScheduledTask                              1.0.0.0    ScheduledTasks
Function        Disable-SmbDelegation                              2.0.0.0    SmbShare
Function        Disable-StorageBusCache                            1.0.0.0    StorageBusCache
Function        Disable-StorageBusDisk                             1.0.0.0    StorageBusCache
Function        Disable-StorageEnclosureIdentification             2.0.0.0    Storage
Function        Disable-StorageEnclosurePower                      2.0.0.0    Storage
Function        Disable-StorageHighAvailability                    2.0.0.0    Storage
Function        Disable-StorageMaintenanceMode                     2.0.0.0    Storage
Function        Disable-WdacBidTrace                               1.0.0.0    Wdac
Function        Disable-WSManTrace                                 1.0.0.0    PSDiagnostics
Function        Disconnect-IscsiTarget                             1.0.0.0    iSCSI
Function        Disconnect-VirtualDisk                             2.0.0.0    Storage
Function        Dismount-DiskImage                                 2.0.0.0    Storage
Function        E:
Function        Enable-BCDistributed                               1.0.0.0    BranchCache
Function        Enable-BCDowngrading                               1.0.0.0    BranchCache
Function        Enable-BCHostedClient                              1.0.0.0    BranchCache
Function        Enable-BCHostedServer                              1.0.0.0    BranchCache
Function        Enable-BCLocal                                     1.0.0.0    BranchCache
Function        Enable-BCServeOnBattery                            1.0.0.0    BranchCache
Function        Enable-BitLocker                                   1.0.0.0    BitLocker
Function        Enable-BitLockerAutoUnlock                         1.0.0.0    BitLocker
Function        Enable-DAManualEntryPointSelection                 1.0.0.0    DirectAccessClientComponents
Function        Enable-DeliveryOptimizationVerboseLogs             1.0.2.0    DeliveryOptimization
Function        Enable-DscDebug                                    1.1        PSDesiredStateConfiguration
Function        Enable-MMAgent                                     1.0        MMAgent
Function        Enable-NetAdapter                                  2.0.0.0    NetAdapter
Function        Enable-NetAdapterBinding                           2.0.0.0    NetAdapter
Function        Enable-NetAdapterChecksumOffload                   2.0.0.0    NetAdapter
Function        Enable-NetAdapterEncapsulatedPacketTaskOffload     2.0.0.0    NetAdapter
Function        Enable-NetAdapterIPsecOffload                      2.0.0.0    NetAdapter
Function        Enable-NetAdapterLso                               2.0.0.0    NetAdapter
Function        Enable-NetAdapterPacketDirect                      2.0.0.0    NetAdapter
Function        Enable-NetAdapterPowerManagement                   2.0.0.0    NetAdapter
Function        Enable-NetAdapterQos                               2.0.0.0    NetAdapter
Function        Enable-NetAdapterRdma                              2.0.0.0    NetAdapter
Function        Enable-NetAdapterRsc                               2.0.0.0    NetAdapter
Function        Enable-NetAdapterRss                               2.0.0.0    NetAdapter
Function        Enable-NetAdapterSriov                             2.0.0.0    NetAdapter
Function        Enable-NetAdapterUso                               2.0.0.0    NetAdapter
Function        Enable-NetAdapterVmq                               2.0.0.0    NetAdapter
Function        Enable-NetDnsTransitionConfiguration               1.0.0.0    NetworkTransition
Function        Enable-NetFirewallRule                             2.0.0.0    NetSecurity
Function        Enable-NetIPHttpsProfile                           1.0.0.0    NetworkTransition
Function        Enable-NetIPsecMainModeRule                        2.0.0.0    NetSecurity
Function        Enable-NetIPsecRule                                2.0.0.0    NetSecurity
Function        Enable-NetNatTransitionConfiguration               1.0.0.0    NetworkTransition
Function        Enable-NetworkSwitchEthernetPort                   1.0.0.0    NetworkSwitchManager
Function        Enable-NetworkSwitchFeature                        1.0.0.0    NetworkSwitchManager
Function        Enable-NetworkSwitchVlan                           1.0.0.0    NetworkSwitchManager
Function        Enable-OdbcPerfCounter                             1.0.0.0    Wdac
Function        Enable-PhysicalDiskIdentification                  2.0.0.0    Storage
Function        Enable-PnpDevice                                   1.0.0.0    PnpDevice
Function        Enable-PSTrace                                     1.0.0.0    PSDiagnostics
Function        Enable-PSWSManCombinedTrace                        1.0.0.0    PSDiagnostics
Function        Enable-ScheduledTask                               1.0.0.0    ScheduledTasks
Function        Enable-SmbDelegation                               2.0.0.0    SmbShare
Function        Enable-StorageBusCache                             1.0.0.0    StorageBusCache
Function        Enable-StorageBusDisk                              1.0.0.0    StorageBusCache
Function        Enable-StorageEnclosureIdentification              2.0.0.0    Storage
Function        Enable-StorageEnclosurePower                       2.0.0.0    Storage
Function        Enable-StorageHighAvailability                     2.0.0.0    Storage
Function        Enable-StorageMaintenanceMode                      2.0.0.0    Storage
Function        Enable-WdacBidTrace                                1.0.0.0    Wdac
Function        Enable-WSManTrace                                  1.0.0.0    PSDiagnostics
Function        Expand-Archive                                     1.0.1.0    Microsoft.PowerShell.Archive
Function        Export-BCCachePackage                              1.0.0.0    BranchCache
Function        Export-BCSecretKey                                 1.0.0.0    BranchCache
Function        Export-ODataEndpointProxy                          1.0        Microsoft.PowerShell.ODataUtils
Function        Export-ScheduledTask                               1.0.0.0    ScheduledTasks
Function        F:
Function        Find-Command                                       1.0.0.1    PowerShellGet
Function        Find-DscResource                                   1.0.0.1    PowerShellGet
Function        Find-Module                                        1.0.0.1    PowerShellGet
Function        Find-NetIPsecRule                                  2.0.0.0    NetSecurity
Function        Find-NetRoute                                      1.0.0.0    NetTCPIP
Function        Find-RoleCapability                                1.0.0.1    PowerShellGet
Function        Find-Script                                        1.0.0.1    PowerShellGet
Function        Flush-EtwTraceSession                              1.0.0.0    EventTracingManagement
Function        Format-Hex                                         3.1.0.0    Microsoft.PowerShell.Utility
Function        Format-Volume                                      2.0.0.0    Storage
Function        G:
Function        Get-AppBackgroundTask                              1.0.0.0    AppBackgroundTask
Function        Get-AppvVirtualProcess                             1.0.0.0    AppvClient
Function        Get-AppxLastError                                  2.0.1.0    Appx
Function        Get-AppxLog                                        2.0.1.0    Appx
Function        Get-AssignedAccess                                 1.0.0.0    AssignedAccess
Function        Get-AutologgerConfig                               1.0.0.0    EventTracingManagement
Function        Get-BCClientConfiguration                          1.0.0.0    BranchCache
Function        Get-BCContentServerConfiguration                   1.0.0.0    BranchCache
Function        Get-BCDataCache                                    1.0.0.0    BranchCache
Function        Get-BCDataCacheExtension                           1.0.0.0    BranchCache
Function        Get-BCHashCache                                    1.0.0.0    BranchCache
Function        Get-BCHostedCacheServerConfiguration               1.0.0.0    BranchCache
Function        Get-BCNetworkConfiguration                         1.0.0.0    BranchCache
Function        Get-BCStatus                                       1.0.0.0    BranchCache
Function        Get-BitLockerVolume                                1.0.0.0    BitLocker
Function        Get-ClusteredScheduledTask                         1.0.0.0    ScheduledTasks
Function        Get-DAClientExperienceConfiguration                1.0.0.0    DirectAccessClientComponents
Function        Get-DAConnectionStatus                             1.0.0.0    NetworkConnectivityStatus
Function        Get-DAEntryPointTableItem                          1.0.0.0    DirectAccessClientComponents
Function        Get-DedupProperties                                2.0.0.0    Storage
Function        Get-DeliveryOptimizationPerfSnap                   1.0.2.0    DeliveryOptimization
Function        Get-DeliveryOptimizationPerfSnapThisMonth          1.0.2.0    DeliveryOptimization
Function        Get-DeliveryOptimizationStatus                     1.0.2.0    DeliveryOptimization
Function        Get-Disk                                           2.0.0.0    Storage
Function        Get-DiskImage                                      2.0.0.0    Storage
Function        Get-DiskStorageNodeView                            2.0.0.0    Storage
Function        Get-DnsClient                                      1.0.0.0    DnsClient
Function        Get-DnsClientCache                                 1.0.0.0    DnsClient
Function        Get-DnsClientGlobalSetting                         1.0.0.0    DnsClient
Function        Get-DnsClientNrptGlobal                            1.0.0.0    DnsClient
Function        Get-DnsClientNrptPolicy                            1.0.0.0    DnsClient
Function        Get-DnsClientNrptRule                              1.0.0.0    DnsClient
Function        Get-DnsClientServerAddress                         1.0.0.0    DnsClient
Function        Get-DOConfig                                       1.0.2.0    DeliveryOptimization
Function        Get-DODownloadMode                                 1.0.2.0    DeliveryOptimization
Function        Get-DOPercentageMaxBackgroundBandwidth             1.0.2.0    DeliveryOptimization
Function        Get-DOPercentageMaxForegroundBandwidth             1.0.2.0    DeliveryOptimization
Function        Get-Downloader
Function        Get-DscConfiguration                               1.1        PSDesiredStateConfiguration
Function        Get-DscConfigurationStatus                         1.1        PSDesiredStateConfiguration
Function        Get-DscLocalConfigurationManager                   1.1        PSDesiredStateConfiguration
Function        Get-DscResource                                    1.1        PSDesiredStateConfiguration
Function        Get-Dtc                                            1.0.0.0    MsDtc
Function        Get-DtcAdvancedHostSetting                         1.0.0.0    MsDtc
Function        Get-DtcAdvancedSetting                             1.0.0.0    MsDtc
Function        Get-DtcClusterDefault                              1.0.0.0    MsDtc
Function        Get-DtcClusterTMMapping                            1.0.0.0    MsDtc
Function        Get-DtcDefault                                     1.0.0.0    MsDtc
Function        Get-DtcLog                                         1.0.0.0    MsDtc
Function        Get-DtcNetworkSetting                              1.0.0.0    MsDtc
Function        Get-DtcTransaction                                 1.0.0.0    MsDtc
Function        Get-DtcTransactionsStatistics                      1.0.0.0    MsDtc
Function        Get-DtcTransactionsTraceSession                    1.0.0.0    MsDtc
Function        Get-DtcTransactionsTraceSetting                    1.0.0.0    MsDtc
Function        Get-EtwTraceProvider                               1.0.0.0    EventTracingManagement
Function        Get-EtwTraceSession                                1.0.0.0    EventTracingManagement
Function        Get-FileHash                                       3.1.0.0    Microsoft.PowerShell.Utility
Function        Get-FileIntegrity                                  2.0.0.0    Storage
Function        Get-FileShare                                      2.0.0.0    Storage
Function        Get-FileShareAccessControlEntry                    2.0.0.0    Storage
Function        Get-FileStorageTier                                2.0.0.0    Storage
Function        Get-InitiatorId                                    2.0.0.0    Storage
Function        Get-InitiatorPort                                  2.0.0.0    Storage
Function        Get-InstalledModule                                1.0.0.1    PowerShellGet
Function        Get-InstalledScript                                1.0.0.1    PowerShellGet
Function        Get-IscsiConnection                                1.0.0.0    iSCSI
Function        Get-IscsiSession                                   1.0.0.0    iSCSI
Function        Get-IscsiTarget                                    1.0.0.0    iSCSI
Function        Get-IscsiTargetPortal                              1.0.0.0    iSCSI
Function        Get-IseSnippet                                     1.0.0.0    ISE
Function        Get-LogProperties                                  1.0.0.0    PSDiagnostics
Function        Get-MaskingSet                                     2.0.0.0    Storage
Function        Get-MMAgent                                        1.0        MMAgent
Function        Get-MockDynamicParameters                          3.4.0      Pester
Function        Get-MpComputerStatus                               1.0        Defender
Function        Get-MpPreference                                   1.0        Defender
Function        Get-MpThreat                                       1.0        Defender
Function        Get-MpThreatCatalog                                1.0        Defender
Function        Get-MpThreatDetection                              1.0        Defender
Function        Get-NCSIPolicyConfiguration                        1.0.0.0    NetworkConnectivityStatus
Function        Get-Net6to4Configuration                           1.0.0.0    NetworkTransition
Function        Get-NetAdapter                                     2.0.0.0    NetAdapter
Function        Get-NetAdapterAdvancedProperty                     2.0.0.0    NetAdapter
Function        Get-NetAdapterBinding                              2.0.0.0    NetAdapter
Function        Get-NetAdapterChecksumOffload                      2.0.0.0    NetAdapter
Function        Get-NetAdapterEncapsulatedPacketTaskOffload        2.0.0.0    NetAdapter
Function        Get-NetAdapterHardwareInfo                         2.0.0.0    NetAdapter
Function        Get-NetAdapterIPsecOffload                         2.0.0.0    NetAdapter
Function        Get-NetAdapterLso                                  2.0.0.0    NetAdapter
Function        Get-NetAdapterPacketDirect                         2.0.0.0    NetAdapter
Function        Get-NetAdapterPowerManagement                      2.0.0.0    NetAdapter
Function        Get-NetAdapterQos                                  2.0.0.0    NetAdapter
Function        Get-NetAdapterRdma                                 2.0.0.0    NetAdapter
Function        Get-NetAdapterRsc                                  2.0.0.0    NetAdapter
Function        Get-NetAdapterRss                                  2.0.0.0    NetAdapter
Function        Get-NetAdapterSriov                                2.0.0.0    NetAdapter
Function        Get-NetAdapterSriovVf                              2.0.0.0    NetAdapter
Function        Get-NetAdapterStatistics                           2.0.0.0    NetAdapter
Function        Get-NetAdapterUso                                  2.0.0.0    NetAdapter
Function        Get-NetAdapterVmq                                  2.0.0.0    NetAdapter
Function        Get-NetAdapterVMQQueue                             2.0.0.0    NetAdapter
Function        Get-NetAdapterVPort                                2.0.0.0    NetAdapter
Function        Get-NetCompartment                                 1.0.0.0    NetTCPIP
Function        Get-NetConnectionProfile                           1.0.0.0    NetConnection
Function        Get-NetDnsTransitionConfiguration                  1.0.0.0    NetworkTransition
Function        Get-NetDnsTransitionMonitoring                     1.0.0.0    NetworkTransition
Function        Get-NetEventNetworkAdapter                         1.0.0.0    NetEventPacketCapture
Function        Get-NetEventPacketCaptureProvider                  1.0.0.0    NetEventPacketCapture
Function        Get-NetEventProvider                               1.0.0.0    NetEventPacketCapture
Function        Get-NetEventSession                                1.0.0.0    NetEventPacketCapture
Function        Get-NetEventVFPProvider                            1.0.0.0    NetEventPacketCapture
Function        Get-NetEventVmNetworkAdapter                       1.0.0.0    NetEventPacketCapture
Function        Get-NetEventVmSwitch                               1.0.0.0    NetEventPacketCapture
Function        Get-NetEventVmSwitchProvider                       1.0.0.0    NetEventPacketCapture
Function        Get-NetEventWFPCaptureProvider                     1.0.0.0    NetEventPacketCapture
Function        Get-NetFirewallAddressFilter                       2.0.0.0    NetSecurity
Function        Get-NetFirewallApplicationFilter                   2.0.0.0    NetSecurity
Function        Get-NetFirewallInterfaceFilter                     2.0.0.0    NetSecurity
Function        Get-NetFirewallInterfaceTypeFilter                 2.0.0.0    NetSecurity
Function        Get-NetFirewallPortFilter                          2.0.0.0    NetSecurity
Function        Get-NetFirewallProfile                             2.0.0.0    NetSecurity
Function        Get-NetFirewallRule                                2.0.0.0    NetSecurity
Function        Get-NetFirewallSecurityFilter                      2.0.0.0    NetSecurity
Function        Get-NetFirewallServiceFilter                       2.0.0.0    NetSecurity
Function        Get-NetFirewallSetting                             2.0.0.0    NetSecurity
Function        Get-NetIPAddress                                   1.0.0.0    NetTCPIP
Function        Get-NetIPConfiguration                             1.0.0.0    NetTCPIP
Function        Get-NetIPHttpsConfiguration                        1.0.0.0    NetworkTransition
Function        Get-NetIPHttpsState                                1.0.0.0    NetworkTransition
Function        Get-NetIPInterface                                 1.0.0.0    NetTCPIP
Function        Get-NetIPsecDospSetting                            2.0.0.0    NetSecurity
Function        Get-NetIPsecMainModeCryptoSet                      2.0.0.0    NetSecurity
Function        Get-NetIPsecMainModeRule                           2.0.0.0    NetSecurity
Function        Get-NetIPsecMainModeSA                             2.0.0.0    NetSecurity
Function        Get-NetIPsecPhase1AuthSet                          2.0.0.0    NetSecurity
Function        Get-NetIPsecPhase2AuthSet                          2.0.0.0    NetSecurity
Function        Get-NetIPsecQuickModeCryptoSet                     2.0.0.0    NetSecurity
Function        Get-NetIPsecQuickModeSA                            2.0.0.0    NetSecurity
Function        Get-NetIPsecRule                                   2.0.0.0    NetSecurity
Function        Get-NetIPv4Protocol                                1.0.0.0    NetTCPIP
Function        Get-NetIPv6Protocol                                1.0.0.0    NetTCPIP
Function        Get-NetIsatapConfiguration                         1.0.0.0    NetworkTransition
Function        Get-NetLbfoTeam                                    2.0.0.0    NetLbfo
Function        Get-NetLbfoTeamMember                              2.0.0.0    NetLbfo
Function        Get-NetLbfoTeamNic                                 2.0.0.0    NetLbfo
Function        Get-NetNat                                         1.0.0.0    NetNat
Function        Get-NetNatExternalAddress                          1.0.0.0    NetNat
Function        Get-NetNatGlobal                                   1.0.0.0    NetNat
Function        Get-NetNatSession                                  1.0.0.0    NetNat
Function        Get-NetNatStaticMapping                            1.0.0.0    NetNat
Function        Get-NetNatTransitionConfiguration                  1.0.0.0    NetworkTransition
Function        Get-NetNatTransitionMonitoring                     1.0.0.0    NetworkTransition
Function        Get-NetNeighbor                                    1.0.0.0    NetTCPIP
Function        Get-NetOffloadGlobalSetting                        1.0.0.0    NetTCPIP
Function        Get-NetPrefixPolicy                                1.0.0.0    NetTCPIP
Function        Get-NetQosPolicy                                   2.0.0.0    NetQos
Function        Get-NetRoute                                       1.0.0.0    NetTCPIP
Function        Get-NetSwitchTeam                                  1.0.0.0    NetSwitchTeam
Function        Get-NetSwitchTeamMember                            1.0.0.0    NetSwitchTeam
Function        Get-NetTCPConnection                               1.0.0.0    NetTCPIP
Function        Get-NetTCPSetting                                  1.0.0.0    NetTCPIP
Function        Get-NetTeredoConfiguration                         1.0.0.0    NetworkTransition
Function        Get-NetTeredoState                                 1.0.0.0    NetworkTransition
Function        Get-NetTransportFilter                             1.0.0.0    NetTCPIP
Function        Get-NetUDPEndpoint                                 1.0.0.0    NetTCPIP
Function        Get-NetUDPSetting                                  1.0.0.0    NetTCPIP
Function        Get-NetworkSwitchEthernetPort                      1.0.0.0    NetworkSwitchManager
Function        Get-NetworkSwitchFeature                           1.0.0.0    NetworkSwitchManager
Function        Get-NetworkSwitchGlobalData                        1.0.0.0    NetworkSwitchManager
Function        Get-NetworkSwitchVlan                              1.0.0.0    NetworkSwitchManager
Function        Get-OdbcDriver                                     1.0.0.0    Wdac
Function        Get-OdbcDsn                                        1.0.0.0    Wdac
Function        Get-OdbcPerfCounter                                1.0.0.0    Wdac
Function        Get-OffloadDataTransferSetting                     2.0.0.0    Storage
Function        Get-OperationValidation                            1.0.1      Microsoft.PowerShell.Operation.Validation
Function        Get-Partition                                      2.0.0.0    Storage
Function        Get-PartitionSupportedSize                         2.0.0.0    Storage
Function        Get-PcsvDevice                                     1.0.0.0    PcsvDevice
Function        Get-PcsvDeviceLog                                  1.0.0.0    PcsvDevice
Function        Get-PhysicalDisk                                   2.0.0.0    Storage
Function        Get-PhysicalDiskStorageNodeView                    2.0.0.0    Storage
Function        Get-PhysicalExtent                                 2.0.0.0    Storage
Function        Get-PhysicalExtentAssociation                      2.0.0.0    Storage
Function        Get-PnpDevice                                      1.0.0.0    PnpDevice
Function        Get-PnpDeviceProperty                              1.0.0.0    PnpDevice
Function        Get-PrintConfiguration                             1.1        PrintManagement
Function        Get-Printer                                        1.1        PrintManagement
Function        Get-PrinterDriver                                  1.1        PrintManagement
Function        Get-PrinterPort                                    1.1        PrintManagement
Function        Get-PrinterProperty                                1.1        PrintManagement
Function        Get-PrintJob                                       1.1        PrintManagement
Function        Get-PSRepository                                   1.0.0.1    PowerShellGet
Function        Get-ResiliencySetting                              2.0.0.0    Storage
Function        Get-ScheduledTask                                  1.0.0.0    ScheduledTasks
Function        Get-ScheduledTaskInfo                              1.0.0.0    ScheduledTasks
Function        Get-SmbBandWidthLimit                              2.0.0.0    SmbShare
Function        Get-SmbClientConfiguration                         2.0.0.0    SmbShare
Function        Get-SmbClientNetworkInterface                      2.0.0.0    SmbShare
Function        Get-SmbConnection                                  2.0.0.0    SmbShare
Function        Get-SmbDelegation                                  2.0.0.0    SmbShare
Function        Get-SmbGlobalMapping                               2.0.0.0    SmbShare
Function        Get-SmbMapping                                     2.0.0.0    SmbShare
Function        Get-SmbMultichannelConnection                      2.0.0.0    SmbShare
Function        Get-SmbMultichannelConstraint                      2.0.0.0    SmbShare
Function        Get-SmbOpenFile                                    2.0.0.0    SmbShare
Function        Get-SmbServerCertificateMapping                    2.0.0.0    SmbShare
Function        Get-SmbServerConfiguration                         2.0.0.0    SmbShare
Function        Get-SmbServerNetworkInterface                      2.0.0.0    SmbShare
Function        Get-SmbSession                                     2.0.0.0    SmbShare
Function        Get-SmbShare                                       2.0.0.0    SmbShare
Function        Get-SmbShareAccess                                 2.0.0.0    SmbShare
Function        Get-SmbWitnessClient                               2.0.0.0    SmbWitness
Function        Get-StartApps                                      1.0.0.1    StartLayout
Function        Get-StorageAdvancedProperty                        2.0.0.0    Storage
Function        Get-StorageBusBinding                              1.0.0.0    StorageBusCache
Function        Get-StorageBusDisk                                 1.0.0.0    StorageBusCache
Function        Get-StorageChassis                                 2.0.0.0    Storage
Function        Get-StorageDiagnosticInfo                          2.0.0.0    Storage
Function        Get-StorageEnclosure                               2.0.0.0    Storage
Function        Get-StorageEnclosureStorageNodeView                2.0.0.0    Storage
Function        Get-StorageEnclosureVendorData                     2.0.0.0    Storage
Function        Get-StorageExtendedStatus                          2.0.0.0    Storage
Function        Get-StorageFaultDomain                             2.0.0.0    Storage
Function        Get-StorageFileServer                              2.0.0.0    Storage
Function        Get-StorageFirmwareInformation                     2.0.0.0    Storage
Function        Get-StorageHealthAction                            2.0.0.0    Storage
Function        Get-StorageHealthReport                            2.0.0.0    Storage
Function        Get-StorageHealthSetting                           2.0.0.0    Storage
Function        Get-StorageHistory                                 2.0.0.0    Storage
Function        Get-StorageJob                                     2.0.0.0    Storage
Function        Get-StorageNode                                    2.0.0.0    Storage
Function        Get-StoragePool                                    2.0.0.0    Storage
Function        Get-StorageProvider                                2.0.0.0    Storage
Function        Get-StorageRack                                    2.0.0.0    Storage
Function        Get-StorageReliabilityCounter                      2.0.0.0    Storage
Function        Get-StorageScaleUnit                               2.0.0.0    Storage
Function        Get-StorageSetting                                 2.0.0.0    Storage
Function        Get-StorageSite                                    2.0.0.0    Storage
Function        Get-StorageSubSystem                               2.0.0.0    Storage
Function        Get-StorageTier                                    2.0.0.0    Storage
Function        Get-StorageTierSupportedSize                       2.0.0.0    Storage
Function        Get-SupportedClusterSizes                          2.0.0.0    Storage
Function        Get-SupportedFileSystems                           2.0.0.0    Storage
Function        Get-TargetPort                                     2.0.0.0    Storage
Function        Get-TargetPortal                                   2.0.0.0    Storage
Function        Get-TestDriveItem                                  3.4.0      Pester
Function        Get-Verb
Function        Get-VirtualDisk                                    2.0.0.0    Storage
Function        Get-VirtualDiskSupportedSize                       2.0.0.0    Storage
Function        Get-Volume                                         2.0.0.0    Storage
Function        Get-VolumeCorruptionCount                          2.0.0.0    Storage
Function        Get-VolumeScrubPolicy                              2.0.0.0    Storage
Function        Get-VpnConnection                                  2.0.0.0    VpnClient
Function        Get-VpnConnectionTrigger                           2.0.0.0    VpnClient
Function        Get-WdacBidTrace                                   1.0.0.0    Wdac
Function        Get-WindowsUpdateLog                               1.0.0.0    WindowsUpdate
Function        Grant-FileShareAccess                              2.0.0.0    Storage
Function        Grant-SmbShareAccess                               2.0.0.0    SmbShare
Function        H:
Function        help
Function        Hide-VirtualDisk                                   2.0.0.0    Storage
Function        I:
Function        Import-BCCachePackage                              1.0.0.0    BranchCache
Function        Import-BCSecretKey                                 1.0.0.0    BranchCache
Function        Import-IseSnippet                                  1.0.0.0    ISE
Function        Import-PowerShellDataFile                          3.1.0.0    Microsoft.PowerShell.Utility
Function        ImportSystemModules
Function        In                                                 3.4.0      Pester
Function        Initialize-Chocolatey                              0.0        chocolateysetup
Function        Initialize-Disk                                    2.0.0.0    Storage
Function        InModuleScope                                      3.4.0      Pester
Function        Install-7zip
Function        Install-Dtc                                        1.0.0.0    MsDtc
Function        Install-Module                                     1.0.0.1    PowerShellGet
Function        Install-Script                                     1.0.0.1    PowerShellGet
Function        Invoke-AsWorkflow                                  1.0.0.0    PSWorkflowUtility
Function        Invoke-Mock                                        3.4.0      Pester
Function        Invoke-OperationValidation                         1.0.1      Microsoft.PowerShell.Operation.Validation
Function        Invoke-Pester                                      3.4.0      Pester
Function        It                                                 3.4.0      Pester
Function        J:
Function        K:
Function        L:
Function        Lock-BitLocker                                     1.0.0.0    BitLocker
Function        M:
Function        mkdir
Function        Mock                                               3.4.0      Pester
Function        more
Function        Mount-DiskImage                                    2.0.0.0    Storage
Function        Move-SmbWitnessClient                              2.0.0.0    SmbWitness
Function        N:
Function        New-AutologgerConfig                               1.0.0.0    EventTracingManagement
Function        New-DAEntryPointTableItem                          1.0.0.0    DirectAccessClientComponents
Function        New-DscChecksum                                    1.1        PSDesiredStateConfiguration
Function        New-EapConfiguration                               2.0.0.0    VpnClient
Function        New-EtwTraceSession                                1.0.0.0    EventTracingManagement
Function        New-FileShare                                      2.0.0.0    Storage
Function        New-Fixture                                        3.4.0      Pester
Function        New-Guid                                           3.1.0.0    Microsoft.PowerShell.Utility
Function        New-IscsiTargetPortal                              1.0.0.0    iSCSI
Function        New-IseSnippet                                     1.0.0.0    ISE
Function        New-MaskingSet                                     2.0.0.0    Storage
Function        New-NetAdapterAdvancedProperty                     2.0.0.0    NetAdapter
Function        New-NetEventSession                                1.0.0.0    NetEventPacketCapture
Function        New-NetFirewallRule                                2.0.0.0    NetSecurity
Function        New-NetIPAddress                                   1.0.0.0    NetTCPIP
Function        New-NetIPHttpsConfiguration                        1.0.0.0    NetworkTransition
Function        New-NetIPsecDospSetting                            2.0.0.0    NetSecurity
Function        New-NetIPsecMainModeCryptoSet                      2.0.0.0    NetSecurity
Function        New-NetIPsecMainModeRule                           2.0.0.0    NetSecurity
Function        New-NetIPsecPhase1AuthSet                          2.0.0.0    NetSecurity
Function        New-NetIPsecPhase2AuthSet                          2.0.0.0    NetSecurity
Function        New-NetIPsecQuickModeCryptoSet                     2.0.0.0    NetSecurity
Function        New-NetIPsecRule                                   2.0.0.0    NetSecurity
Function        New-NetLbfoTeam                                    2.0.0.0    NetLbfo
Function        New-NetNat                                         1.0.0.0    NetNat
Function        New-NetNatTransitionConfiguration                  1.0.0.0    NetworkTransition
Function        New-NetNeighbor                                    1.0.0.0    NetTCPIP
Function        New-NetQosPolicy                                   2.0.0.0    NetQos
Function        New-NetRoute                                       1.0.0.0    NetTCPIP
Function        New-NetSwitchTeam                                  1.0.0.0    NetSwitchTeam
Function        New-NetTransportFilter                             1.0.0.0    NetTCPIP
Function        New-NetworkSwitchVlan                              1.0.0.0    NetworkSwitchManager
Function        New-Partition                                      2.0.0.0    Storage
Function        New-PesterOption                                   3.4.0      Pester
Function        New-PSWorkflowSession                              2.0.0.0    PSWorkflow
Function        New-ScheduledTask                                  1.0.0.0    ScheduledTasks
Function        New-ScheduledTaskAction                            1.0.0.0    ScheduledTasks
Function        New-ScheduledTaskPrincipal                         1.0.0.0    ScheduledTasks
Function        New-ScheduledTaskSettingsSet                       1.0.0.0    ScheduledTasks
Function        New-ScheduledTaskTrigger                           1.0.0.0    ScheduledTasks
Function        New-ScriptFileInfo                                 1.0.0.1    PowerShellGet
Function        New-SmbGlobalMapping                               2.0.0.0    SmbShare
Function        New-SmbMapping                                     2.0.0.0    SmbShare
Function        New-SmbMultichannelConstraint                      2.0.0.0    SmbShare
Function        New-SmbServerCertificateMapping                    2.0.0.0    SmbShare
Function        New-SmbShare                                       2.0.0.0    SmbShare
Function        New-StorageBusBinding                              1.0.0.0    StorageBusCache
Function        New-StorageBusCacheStore                           1.0.0.0    StorageBusCache
Function        New-StorageFileServer                              2.0.0.0    Storage
Function        New-StoragePool                                    2.0.0.0    Storage
Function        New-StorageSubsystemVirtualDisk                    2.0.0.0    Storage
Function        New-StorageTier                                    2.0.0.0    Storage
Function        New-TemporaryFile                                  3.1.0.0    Microsoft.PowerShell.Utility
Function        New-VirtualDisk                                    2.0.0.0    Storage
Function        New-VirtualDiskClone                               2.0.0.0    Storage
Function        New-VirtualDiskSnapshot                            2.0.0.0    Storage
Function        New-Volume                                         2.0.0.0    Storage
Function        New-VpnServerAddress                               2.0.0.0    VpnClient
Function        O:
Function        Open-NetGPO                                        2.0.0.0    NetSecurity
Function        Optimize-StoragePool                               2.0.0.0    Storage
Function        Optimize-Volume                                    2.0.0.0    Storage
Function        oss
Function        P:
Function        Pause
Function        prompt
Function        PSConsoleHostReadLine                              2.0.0      PSReadline
Function        Publish-BCFileContent                              1.0.0.0    BranchCache
Function        Publish-BCWebContent                               1.0.0.0    BranchCache
Function        Publish-Module                                     1.0.0.1    PowerShellGet
Function        Publish-Script                                     1.0.0.1    PowerShellGet
Function        Q:
Function        R:
Function        Read-PrinterNfcTag                                 1.1        PrintManagement
Function        Register-ClusteredScheduledTask                    1.0.0.0    ScheduledTasks
Function        Register-DnsClient                                 1.0.0.0    DnsClient
Function        Register-IscsiSession                              1.0.0.0    iSCSI
Function        Register-PSRepository                              1.0.0.1    PowerShellGet
Function        Register-ScheduledTask                             1.0.0.0    ScheduledTasks
Function        Register-StorageSubsystem                          2.0.0.0    Storage
Function        Remove-AutologgerConfig                            1.0.0.0    EventTracingManagement
Function        Remove-BCDataCacheExtension                        1.0.0.0    BranchCache
Function        Remove-BitLockerKeyProtector                       1.0.0.0    BitLocker
Function        Remove-DAEntryPointTableItem                       1.0.0.0    DirectAccessClientComponents
Function        Remove-DnsClientNrptRule                           1.0.0.0    DnsClient
Function        Remove-DscConfigurationDocument                    1.1        PSDesiredStateConfiguration
Function        Remove-DtcClusterTMMapping                         1.0.0.0    MsDtc
Function        Remove-EtwTraceProvider                            1.0.0.0    EventTracingManagement
Function        Remove-FileShare                                   2.0.0.0    Storage
Function        Remove-InitiatorId                                 2.0.0.0    Storage
Function        Remove-InitiatorIdFromMaskingSet                   2.0.0.0    Storage
Function        Remove-IscsiTargetPortal                           1.0.0.0    iSCSI
Function        Remove-MaskingSet                                  2.0.0.0    Storage
Function        Remove-MpPreference                                1.0        Defender
Function        Remove-MpThreat                                    1.0        Defender
Function        Remove-NetAdapterAdvancedProperty                  2.0.0.0    NetAdapter
Function        Remove-NetEventNetworkAdapter                      1.0.0.0    NetEventPacketCapture
Function        Remove-NetEventPacketCaptureProvider               1.0.0.0    NetEventPacketCapture
Function        Remove-NetEventProvider                            1.0.0.0    NetEventPacketCapture
Function        Remove-NetEventSession                             1.0.0.0    NetEventPacketCapture
Function        Remove-NetEventVFPProvider                         1.0.0.0    NetEventPacketCapture
Function        Remove-NetEventVmNetworkAdapter                    1.0.0.0    NetEventPacketCapture
Function        Remove-NetEventVmSwitch                            1.0.0.0    NetEventPacketCapture
Function        Remove-NetEventVmSwitchProvider                    1.0.0.0    NetEventPacketCapture
Function        Remove-NetEventWFPCaptureProvider                  1.0.0.0    NetEventPacketCapture
Function        Remove-NetFirewallRule                             2.0.0.0    NetSecurity
Function        Remove-NetIPAddress                                1.0.0.0    NetTCPIP
Function        Remove-NetIPHttpsCertBinding                       1.0.0.0    NetworkTransition
Function        Remove-NetIPHttpsConfiguration                     1.0.0.0    NetworkTransition
Function        Remove-NetIPsecDospSetting                         2.0.0.0    NetSecurity
Function        Remove-NetIPsecMainModeCryptoSet                   2.0.0.0    NetSecurity
Function        Remove-NetIPsecMainModeRule                        2.0.0.0    NetSecurity
Function        Remove-NetIPsecMainModeSA                          2.0.0.0    NetSecurity
Function        Remove-NetIPsecPhase1AuthSet                       2.0.0.0    NetSecurity
Function        Remove-NetIPsecPhase2AuthSet                       2.0.0.0    NetSecurity
Function        Remove-NetIPsecQuickModeCryptoSet                  2.0.0.0    NetSecurity
Function        Remove-NetIPsecQuickModeSA                         2.0.0.0    NetSecurity
Function        Remove-NetIPsecRule                                2.0.0.0    NetSecurity
Function        Remove-NetLbfoTeam                                 2.0.0.0    NetLbfo
Function        Remove-NetLbfoTeamMember                           2.0.0.0    NetLbfo
Function        Remove-NetLbfoTeamNic                              2.0.0.0    NetLbfo
Function        Remove-NetNat                                      1.0.0.0    NetNat
Function        Remove-NetNatExternalAddress                       1.0.0.0    NetNat
Function        Remove-NetNatStaticMapping                         1.0.0.0    NetNat
Function        Remove-NetNatTransitionConfiguration               1.0.0.0    NetworkTransition
Function        Remove-NetNeighbor                                 1.0.0.0    NetTCPIP
Function        Remove-NetQosPolicy                                2.0.0.0    NetQos
Function        Remove-NetRoute                                    1.0.0.0    NetTCPIP
Function        Remove-NetSwitchTeam                               1.0.0.0    NetSwitchTeam
Function        Remove-NetSwitchTeamMember                         1.0.0.0    NetSwitchTeam
Function        Remove-NetTransportFilter                          1.0.0.0    NetTCPIP
Function        Remove-NetworkSwitchEthernetPortIPAddress          1.0.0.0    NetworkSwitchManager
Function        Remove-NetworkSwitchVlan                           1.0.0.0    NetworkSwitchManager
Function        Remove-OdbcDsn                                     1.0.0.0    Wdac
Function        Remove-Partition                                   2.0.0.0    Storage
Function        Remove-PartitionAccessPath                         2.0.0.0    Storage
Function        Remove-PhysicalDisk                                2.0.0.0    Storage
Function        Remove-Printer                                     1.1        PrintManagement
Function        Remove-PrinterDriver                               1.1        PrintManagement
Function        Remove-PrinterPort                                 1.1        PrintManagement
Function        Remove-PrintJob                                    1.1        PrintManagement
Function        Remove-SmbBandwidthLimit                           2.0.0.0    SmbShare
Function        Remove-SMBComponent                                2.0.0.0    SmbShare
Function        Remove-SmbGlobalMapping                            2.0.0.0    SmbShare
Function        Remove-SmbMapping                                  2.0.0.0    SmbShare
Function        Remove-SmbMultichannelConstraint                   2.0.0.0    SmbShare
Function        Remove-SmbServerCertificateMapping                 2.0.0.0    SmbShare
Function        Remove-SmbShare                                    2.0.0.0    SmbShare
Function        Remove-StorageBusBinding                           1.0.0.0    StorageBusCache
Function        Remove-StorageFaultDomain                          2.0.0.0    Storage
Function        Remove-StorageFileServer                           2.0.0.0    Storage
Function        Remove-StorageHealthIntent                         2.0.0.0    Storage
Function        Remove-StorageHealthSetting                        2.0.0.0    Storage
Function        Remove-StoragePool                                 2.0.0.0    Storage
Function        Remove-StorageTier                                 2.0.0.0    Storage
Function        Remove-TargetPortFromMaskingSet                    2.0.0.0    Storage
Function        Remove-VirtualDisk                                 2.0.0.0    Storage
Function        Remove-VirtualDiskFromMaskingSet                   2.0.0.0    Storage
Function        Remove-VpnConnection                               2.0.0.0    VpnClient
Function        Remove-VpnConnectionRoute                          2.0.0.0    VpnClient
Function        Remove-VpnConnectionTriggerApplication             2.0.0.0    VpnClient
Function        Remove-VpnConnectionTriggerDnsConfiguration        2.0.0.0    VpnClient
Function        Remove-VpnConnectionTriggerTrustedNetwork          2.0.0.0    VpnClient
Function        Rename-DAEntryPointTableItem                       1.0.0.0    DirectAccessClientComponents
Function        Rename-MaskingSet                                  2.0.0.0    Storage
Function        Rename-NetAdapter                                  2.0.0.0    NetAdapter
Function        Rename-NetFirewallRule                             2.0.0.0    NetSecurity
Function        Rename-NetIPHttpsConfiguration                     1.0.0.0    NetworkTransition
Function        Rename-NetIPsecMainModeCryptoSet                   2.0.0.0    NetSecurity
Function        Rename-NetIPsecMainModeRule                        2.0.0.0    NetSecurity
Function        Rename-NetIPsecPhase1AuthSet                       2.0.0.0    NetSecurity
Function        Rename-NetIPsecPhase2AuthSet                       2.0.0.0    NetSecurity
Function        Rename-NetIPsecQuickModeCryptoSet                  2.0.0.0    NetSecurity
Function        Rename-NetIPsecRule                                2.0.0.0    NetSecurity
Function        Rename-NetLbfoTeam                                 2.0.0.0    NetLbfo
Function        Rename-NetSwitchTeam                               1.0.0.0    NetSwitchTeam
Function        Rename-Printer                                     1.1        PrintManagement
Function        Repair-FileIntegrity                               2.0.0.0    Storage
Function        Repair-VirtualDisk                                 2.0.0.0    Storage
Function        Repair-Volume                                      2.0.0.0    Storage
Function        Request-File
Function        Request-String
Function        Reset-BC                                           1.0.0.0    BranchCache
Function        Reset-DAClientExperienceConfiguration              1.0.0.0    DirectAccessClientComponents
Function        Reset-DAEntryPointTableItem                        1.0.0.0    DirectAccessClientComponents
Function        Reset-DtcLog                                       1.0.0.0    MsDtc
Function        Reset-NCSIPolicyConfiguration                      1.0.0.0    NetworkConnectivityStatus
Function        Reset-Net6to4Configuration                         1.0.0.0    NetworkTransition
Function        Reset-NetAdapterAdvancedProperty                   2.0.0.0    NetAdapter
Function        Reset-NetDnsTransitionConfiguration                1.0.0.0    NetworkTransition
Function        Reset-NetIPHttpsConfiguration                      1.0.0.0    NetworkTransition
Function        Reset-NetIsatapConfiguration                       1.0.0.0    NetworkTransition
Function        Reset-NetTeredoConfiguration                       1.0.0.0    NetworkTransition
Function        Reset-PhysicalDisk                                 2.0.0.0    Storage
Function        Reset-StorageReliabilityCounter                    2.0.0.0    Storage
Function        Resize-Partition                                   2.0.0.0    Storage
Function        Resize-StorageTier                                 2.0.0.0    Storage
Function        Resize-VirtualDisk                                 2.0.0.0    Storage
Function        Restart-NetAdapter                                 2.0.0.0    NetAdapter
Function        Restart-PcsvDevice                                 1.0.0.0    PcsvDevice
Function        Restart-PrintJob                                   1.1        PrintManagement
Function        Restore-DscConfiguration                           1.1        PSDesiredStateConfiguration
Function        Restore-NetworkSwitchConfiguration                 1.0.0.0    NetworkSwitchManager
Function        Resume-BitLocker                                   1.0.0.0    BitLocker
Function        Resume-PrintJob                                    1.1        PrintManagement
Function        Resume-StorageBusDisk                              1.0.0.0    StorageBusCache
Function        Revoke-FileShareAccess                             2.0.0.0    Storage
Function        Revoke-SmbShareAccess                              2.0.0.0    SmbShare
Function        S:
Function        SafeGetCommand                                     3.4.0      Pester
Function        Save-EtwTraceSession                               1.0.0.0    EventTracingManagement
Function        Save-Module                                        1.0.0.1    PowerShellGet
Function        Save-NetGPO                                        2.0.0.0    NetSecurity
Function        Save-NetworkSwitchConfiguration                    1.0.0.0    NetworkSwitchManager
Function        Save-Script                                        1.0.0.1    PowerShellGet
Function        Send-EtwTraceSession                               1.0.0.0    EventTracingManagement
Function        Set-AssignedAccess                                 1.0.0.0    AssignedAccess
Function        Set-BCAuthentication                               1.0.0.0    BranchCache
Function        Set-BCCache                                        1.0.0.0    BranchCache
Function        Set-BCDataCacheEntryMaxAge                         1.0.0.0    BranchCache
Function        Set-BCMinSMBLatency                                1.0.0.0    BranchCache
Function        Set-BCSecretKey                                    1.0.0.0    BranchCache
Function        Set-ClusteredScheduledTask                         1.0.0.0    ScheduledTasks
Function        Set-DAClientExperienceConfiguration                1.0.0.0    DirectAccessClientComponents
Function        Set-DAEntryPointTableItem                          1.0.0.0    DirectAccessClientComponents
Function        Set-Disk                                           2.0.0.0    Storage
Function        Set-DnsClient                                      1.0.0.0    DnsClient
Function        Set-DnsClientGlobalSetting                         1.0.0.0    DnsClient
Function        Set-DnsClientNrptGlobal                            1.0.0.0    DnsClient
Function        Set-DnsClientNrptRule                              1.0.0.0    DnsClient
Function        Set-DnsClientServerAddress                         1.0.0.0    DnsClient
Function        Set-DtcAdvancedHostSetting                         1.0.0.0    MsDtc
Function        Set-DtcAdvancedSetting                             1.0.0.0    MsDtc
Function        Set-DtcClusterDefault                              1.0.0.0    MsDtc
Function        Set-DtcClusterTMMapping                            1.0.0.0    MsDtc
Function        Set-DtcDefault                                     1.0.0.0    MsDtc
Function        Set-DtcLog                                         1.0.0.0    MsDtc
Function        Set-DtcNetworkSetting                              1.0.0.0    MsDtc
Function        Set-DtcTransaction                                 1.0.0.0    MsDtc
Function        Set-DtcTransactionsTraceSession                    1.0.0.0    MsDtc
Function        Set-DtcTransactionsTraceSetting                    1.0.0.0    MsDtc
Function        Set-DynamicParameterVariables                      3.4.0      Pester
Function        Set-EtwTraceProvider                               1.0.0.0    EventTracingManagement
Function        Set-FileIntegrity                                  2.0.0.0    Storage
Function        Set-FileShare                                      2.0.0.0    Storage
Function        Set-FileStorageTier                                2.0.0.0    Storage
Function        Set-InitiatorPort                                  2.0.0.0    Storage
Function        Set-IscsiChapSecret                                1.0.0.0    iSCSI
Function        Set-LogProperties                                  1.0.0.0    PSDiagnostics
Function        Set-MMAgent                                        1.0        MMAgent
Function        Set-MpPreference                                   1.0        Defender
Function        Set-NCSIPolicyConfiguration                        1.0.0.0    NetworkConnectivityStatus
Function        Set-Net6to4Configuration                           1.0.0.0    NetworkTransition
Function        Set-NetAdapter                                     2.0.0.0    NetAdapter
Function        Set-NetAdapterAdvancedProperty                     2.0.0.0    NetAdapter
Function        Set-NetAdapterBinding                              2.0.0.0    NetAdapter
Function        Set-NetAdapterChecksumOffload                      2.0.0.0    NetAdapter
Function        Set-NetAdapterEncapsulatedPacketTaskOffload        2.0.0.0    NetAdapter
Function        Set-NetAdapterIPsecOffload                         2.0.0.0    NetAdapter
Function        Set-NetAdapterLso                                  2.0.0.0    NetAdapter
Function        Set-NetAdapterPacketDirect                         2.0.0.0    NetAdapter
Function        Set-NetAdapterPowerManagement                      2.0.0.0    NetAdapter
Function        Set-NetAdapterQos                                  2.0.0.0    NetAdapter
Function        Set-NetAdapterRdma                                 2.0.0.0    NetAdapter
Function        Set-NetAdapterRsc                                  2.0.0.0    NetAdapter
Function        Set-NetAdapterRss                                  2.0.0.0    NetAdapter
Function        Set-NetAdapterSriov                                2.0.0.0    NetAdapter
Function        Set-NetAdapterUso                                  2.0.0.0    NetAdapter
Function        Set-NetAdapterVmq                                  2.0.0.0    NetAdapter
Function        Set-NetConnectionProfile                           1.0.0.0    NetConnection
Function        Set-NetDnsTransitionConfiguration                  1.0.0.0    NetworkTransition
Function        Set-NetEventPacketCaptureProvider                  1.0.0.0    NetEventPacketCapture
Function        Set-NetEventProvider                               1.0.0.0    NetEventPacketCapture
Function        Set-NetEventSession                                1.0.0.0    NetEventPacketCapture
Function        Set-NetEventVFPProvider                            1.0.0.0    NetEventPacketCapture
Function        Set-NetEventVmSwitchProvider                       1.0.0.0    NetEventPacketCapture
Function        Set-NetEventWFPCaptureProvider                     1.0.0.0    NetEventPacketCapture
Function        Set-NetFirewallAddressFilter                       2.0.0.0    NetSecurity
Function        Set-NetFirewallApplicationFilter                   2.0.0.0    NetSecurity
Function        Set-NetFirewallInterfaceFilter                     2.0.0.0    NetSecurity
Function        Set-NetFirewallInterfaceTypeFilter                 2.0.0.0    NetSecurity
Function        Set-NetFirewallPortFilter                          2.0.0.0    NetSecurity
Function        Set-NetFirewallProfile                             2.0.0.0    NetSecurity
Function        Set-NetFirewallRule                                2.0.0.0    NetSecurity
Function        Set-NetFirewallSecurityFilter                      2.0.0.0    NetSecurity
Function        Set-NetFirewallServiceFilter                       2.0.0.0    NetSecurity
Function        Set-NetFirewallSetting                             2.0.0.0    NetSecurity
Function        Set-NetIPAddress                                   1.0.0.0    NetTCPIP
Function        Set-NetIPHttpsConfiguration                        1.0.0.0    NetworkTransition
Function        Set-NetIPInterface                                 1.0.0.0    NetTCPIP
Function        Set-NetIPsecDospSetting                            2.0.0.0    NetSecurity
Function        Set-NetIPsecMainModeCryptoSet                      2.0.0.0    NetSecurity
Function        Set-NetIPsecMainModeRule                           2.0.0.0    NetSecurity
Function        Set-NetIPsecPhase1AuthSet                          2.0.0.0    NetSecurity
Function        Set-NetIPsecPhase2AuthSet                          2.0.0.0    NetSecurity
Function        Set-NetIPsecQuickModeCryptoSet                     2.0.0.0    NetSecurity
Function        Set-NetIPsecRule                                   2.0.0.0    NetSecurity
Function        Set-NetIPv4Protocol                                1.0.0.0    NetTCPIP
Function        Set-NetIPv6Protocol                                1.0.0.0    NetTCPIP
Function        Set-NetIsatapConfiguration                         1.0.0.0    NetworkTransition
Function        Set-NetLbfoTeam                                    2.0.0.0    NetLbfo
Function        Set-NetLbfoTeamMember                              2.0.0.0    NetLbfo
Function        Set-NetLbfoTeamNic                                 2.0.0.0    NetLbfo
Function        Set-NetNat                                         1.0.0.0    NetNat
Function        Set-NetNatGlobal                                   1.0.0.0    NetNat
Function        Set-NetNatTransitionConfiguration                  1.0.0.0    NetworkTransition
Function        Set-NetNeighbor                                    1.0.0.0    NetTCPIP
Function        Set-NetOffloadGlobalSetting                        1.0.0.0    NetTCPIP
Function        Set-NetQosPolicy                                   2.0.0.0    NetQos
Function        Set-NetRoute                                       1.0.0.0    NetTCPIP
Function        Set-NetTCPSetting                                  1.0.0.0    NetTCPIP
Function        Set-NetTeredoConfiguration                         1.0.0.0    NetworkTransition
Function        Set-NetUDPSetting                                  1.0.0.0    NetTCPIP
Function        Set-NetworkSwitchEthernetPortIPAddress             1.0.0.0    NetworkSwitchManager
Function        Set-NetworkSwitchPortMode                          1.0.0.0    NetworkSwitchManager
Function        Set-NetworkSwitchPortProperty                      1.0.0.0    NetworkSwitchManager
Function        Set-NetworkSwitchVlanProperty                      1.0.0.0    NetworkSwitchManager
Function        Set-OdbcDriver                                     1.0.0.0    Wdac
Function        Set-OdbcDsn                                        1.0.0.0    Wdac
Function        Set-Partition                                      2.0.0.0    Storage
Function        Set-PcsvDeviceBootConfiguration                    1.0.0.0    PcsvDevice
Function        Set-PcsvDeviceNetworkConfiguration                 1.0.0.0    PcsvDevice
Function        Set-PcsvDeviceUserPassword                         1.0.0.0    PcsvDevice
Function        Set-PhysicalDisk                                   2.0.0.0    Storage
Function        Set-PrintConfiguration                             1.1        PrintManagement
Function        Set-Printer                                        1.1        PrintManagement
Function        Set-PrinterProperty                                1.1        PrintManagement
Function        Set-PSConsoleWriter
Function        Set-PSRepository                                   1.0.0.1    PowerShellGet
Function        Set-ResiliencySetting                              2.0.0.0    Storage
Function        Set-ScheduledTask                                  1.0.0.0    ScheduledTasks
Function        Set-SmbBandwidthLimit                              2.0.0.0    SmbShare
Function        Set-SmbClientConfiguration                         2.0.0.0    SmbShare
Function        Set-SmbPathAcl                                     2.0.0.0    SmbShare
Function        Set-SmbServerConfiguration                         2.0.0.0    SmbShare
Function        Set-SmbShare                                       2.0.0.0    SmbShare
Function        Set-StorageBusProfile                              1.0.0.0    StorageBusCache
Function        Set-StorageFileServer                              2.0.0.0    Storage
Function        Set-StorageHealthSetting                           2.0.0.0    Storage
Function        Set-StoragePool                                    2.0.0.0    Storage
Function        Set-StorageProvider                                2.0.0.0    Storage
Function        Set-StorageSetting                                 2.0.0.0    Storage
Function        Set-StorageSubSystem                               2.0.0.0    Storage
Function        Set-StorageTier                                    2.0.0.0    Storage
Function        Set-TestInconclusive                               3.4.0      Pester
Function        Setup                                              3.4.0      Pester
Function        Set-VirtualDisk                                    2.0.0.0    Storage
Function        Set-Volume                                         2.0.0.0    Storage
Function        Set-VolumeScrubPolicy                              2.0.0.0    Storage
Function        Set-VpnConnection                                  2.0.0.0    VpnClient
Function        Set-VpnConnectionIPsecConfiguration                2.0.0.0    VpnClient
Function        Set-VpnConnectionProxy                             2.0.0.0    VpnClient
Function        Set-VpnConnectionTriggerDnsConfiguration           2.0.0.0    VpnClient
Function        Set-VpnConnectionTriggerTrustedNetwork             2.0.0.0    VpnClient
Function        Should                                             3.4.0      Pester
Function        Show-NetFirewallRule                               2.0.0.0    NetSecurity
Function        Show-NetIPsecRule                                  2.0.0.0    NetSecurity
Function        Show-StorageHistory                                2.0.0.0    Storage
Function        Show-VirtualDisk                                   2.0.0.0    Storage
Function        Start-AppBackgroundTask                            1.0.0.0    AppBackgroundTask
Function        Start-AppvVirtualProcess                           1.0.0.0    AppvClient
Function        Start-AutologgerConfig                             1.0.0.0    EventTracingManagement
Function        Start-Dtc                                          1.0.0.0    MsDtc
Function        Start-DtcTransactionsTraceSession                  1.0.0.0    MsDtc
Function        Start-EtwTraceSession                              1.0.0.0    EventTracingManagement
Function        Start-MpScan                                       1.0        Defender
Function        Start-MpWDOScan                                    1.0        Defender
Function        Start-NetEventSession                              1.0.0.0    NetEventPacketCapture
Function        Start-PcsvDevice                                   1.0.0.0    PcsvDevice
Function        Start-ScheduledTask                                1.0.0.0    ScheduledTasks
Function        Start-StorageDiagnosticLog                         2.0.0.0    Storage
Function        Start-Trace                                        1.0.0.0    PSDiagnostics
Function        Stop-DscConfiguration                              1.1        PSDesiredStateConfiguration
Function        Stop-Dtc                                           1.0.0.0    MsDtc
Function        Stop-DtcTransactionsTraceSession                   1.0.0.0    MsDtc
Function        Stop-EtwTraceSession                               1.0.0.0    EventTracingManagement
Function        Stop-NetEventSession                               1.0.0.0    NetEventPacketCapture
Function        Stop-PcsvDevice                                    1.0.0.0    PcsvDevice
Function        Stop-ScheduledTask                                 1.0.0.0    ScheduledTasks
Function        Stop-StorageDiagnosticLog                          2.0.0.0    Storage
Function        Stop-StorageJob                                    2.0.0.0    Storage
Function        Stop-Trace                                         1.0.0.0    PSDiagnostics
Function        Suspend-BitLocker                                  1.0.0.0    BitLocker
Function        Suspend-PrintJob                                   1.1        PrintManagement
Function        Suspend-StorageBusDisk                             1.0.0.0    StorageBusCache
Function        Sync-NetIPsecRule                                  2.0.0.0    NetSecurity
Function        T:
Function        TabExpansion2
Function        Test-ChocolateyInstalled
Function        Test-Dtc                                           1.0.0.0    MsDtc
Function        Test-NetConnection                                 1.0.0.0    NetTCPIP
Function        Test-ScriptFileInfo                                1.0.0.1    PowerShellGet
Function        U:
Function        Unblock-FileShareAccess                            2.0.0.0    Storage
Function        Unblock-SmbShareAccess                             2.0.0.0    SmbShare
Function        Uninstall-Dtc                                      1.0.0.0    MsDtc
Function        Uninstall-Module                                   1.0.0.1    PowerShellGet
Function        Uninstall-Script                                   1.0.0.1    PowerShellGet
Function        Unlock-BitLocker                                   1.0.0.0    BitLocker
Function        Unregister-AppBackgroundTask                       1.0.0.0    AppBackgroundTask
Function        Unregister-ClusteredScheduledTask                  1.0.0.0    ScheduledTasks
Function        Unregister-IscsiSession                            1.0.0.0    iSCSI
Function        Unregister-PSRepository                            1.0.0.1    PowerShellGet
Function        Unregister-ScheduledTask                           1.0.0.0    ScheduledTasks
Function        Unregister-StorageSubsystem                        2.0.0.0    Storage
Function        Update-AutologgerConfig                            1.0.0.0    EventTracingManagement
Function        Update-Disk                                        2.0.0.0    Storage
Function        Update-DscConfiguration                            1.1        PSDesiredStateConfiguration
Function        Update-EtwTraceSession                             1.0.0.0    EventTracingManagement
Function        Update-HostStorageCache                            2.0.0.0    Storage
Function        Update-IscsiTarget                                 1.0.0.0    iSCSI
Function        Update-IscsiTargetPortal                           1.0.0.0    iSCSI
Function        Update-Module                                      1.0.0.1    PowerShellGet
Function        Update-ModuleManifest                              1.0.0.1    PowerShellGet
Function        Update-MpSignature                                 1.0        Defender
Function        Update-NetIPsecRule                                2.0.0.0    NetSecurity
Function        Update-Script                                      1.0.0.1    PowerShellGet
Function        Update-ScriptFileInfo                              1.0.0.1    PowerShellGet
Function        Update-SmbMultichannelConnection                   2.0.0.0    SmbShare
Function        Update-StorageFirmware                             2.0.0.0    Storage
Function        Update-StoragePool                                 2.0.0.0    Storage
Function        Update-StorageProviderCache                        2.0.0.0    Storage
Function        V:
Function        W:
Function        Write-DtcTransactionsTraceSession                  1.0.0.0    MsDtc
Function        Write-PrinterNfcTag                                1.1        PrintManagement
Function        Write-VolumeCache                                  2.0.0.0    Storage
Function        X:
Function        Y:
Function        Z:
Cmdlet          Add-AppvClientConnectionGroup                      1.0.0.0    AppvClient
Cmdlet          Add-AppvClientPackage                              1.0.0.0    AppvClient
Cmdlet          Add-AppvPublishingServer                           1.0.0.0    AppvClient
Cmdlet          Add-AppxPackage                                    2.0.1.0    Appx
Cmdlet          Add-AppxProvisionedPackage                         3.0        Dism
Cmdlet          Add-AppxVolume                                     2.0.1.0    Appx
Cmdlet          Add-BitsFile                                       2.0.0.0    BitsTransfer
Cmdlet          Add-CertificateEnrollmentPolicyServer              1.0.0.0    PKI
Cmdlet          Add-Computer                                       3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Add-Content                                        3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Add-History                                        3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Add-JobTrigger                                     1.1.0.0    PSScheduledJob
Cmdlet          Add-KdsRootKey                                     1.0.0.0    Kds
Cmdlet          Add-LocalGroupMember                               1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          Add-Member                                         3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Add-PSSnapin                                       3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Add-SignerRule                                     1.0        ConfigCI
Cmdlet          Add-Type                                           3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Add-WindowsCapability                              3.0        Dism
Cmdlet          Add-WindowsDriver                                  3.0        Dism
Cmdlet          Add-WindowsImage                                   3.0        Dism
Cmdlet          Add-WindowsPackage                                 3.0        Dism
Cmdlet          Checkpoint-Computer                                3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Clear-Content                                      3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Clear-EventLog                                     3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Clear-History                                      3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Clear-Item                                         3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Clear-ItemProperty                                 3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Clear-KdsCache                                     1.0.0.0    Kds
Cmdlet          Clear-RecycleBin                                   3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Clear-Tpm                                          2.0.0.0    TrustedPlatformModule
Cmdlet          Clear-UevAppxPackage                               2.1.639.0  UEV
Cmdlet          Clear-UevConfiguration                             2.1.639.0  UEV
Cmdlet          Clear-Variable                                     3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Clear-WindowsCorruptMountPoint                     3.0        Dism
Cmdlet          Compare-Object                                     3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Complete-BitsTransfer                              2.0.0.0    BitsTransfer
Cmdlet          Complete-DtcDiagnosticTransaction                  1.0.0.0    MsDtc
Cmdlet          Complete-Transaction                               3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Confirm-SecureBootUEFI                             2.0.0.0    SecureBoot
Cmdlet          Connect-PSSession                                  3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Connect-WSMan                                      3.0.0.0    Microsoft.WSMan.Management
Cmdlet          ConvertFrom-CIPolicy                               1.0        ConfigCI
Cmdlet          ConvertFrom-Csv                                    3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          ConvertFrom-Json                                   3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          ConvertFrom-SecureString                           3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          ConvertFrom-String                                 3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          ConvertFrom-StringData                             3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Convert-Path                                       3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Convert-String                                     3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          ConvertTo-Csv                                      3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          ConvertTo-Html                                     3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          ConvertTo-Json                                     3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          ConvertTo-ProcessMitigationPolicy                  1.0.12     ProcessMitigations
Cmdlet          ConvertTo-SecureString                             3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          ConvertTo-TpmOwnerAuth                             2.0.0.0    TrustedPlatformModule
Cmdlet          ConvertTo-Xml                                      3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Copy-Item                                          3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Copy-ItemProperty                                  3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Debug-Job                                          3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Debug-Process                                      3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Debug-Runspace                                     3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Delete-DeliveryOptimizationCache                   1.0.2.0    DeliveryOptimization
Cmdlet          Disable-AppBackgroundTaskDiagnosticLog             1.0.0.0    AppBackgroundTask
Cmdlet          Disable-Appv                                       1.0.0.0    AppvClient
Cmdlet          Disable-AppvClientConnectionGroup                  1.0.0.0    AppvClient
Cmdlet          Disable-ComputerRestore                            3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Disable-JobTrigger                                 1.1.0.0    PSScheduledJob
Cmdlet          Disable-LocalUser                                  1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          Disable-PSBreakpoint                               3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Disable-PSRemoting                                 3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Disable-PSSessionConfiguration                     3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Disable-RunspaceDebug                              3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Disable-ScheduledJob                               1.1.0.0    PSScheduledJob
Cmdlet          Disable-TlsCipherSuite                             2.0.0.0    TLS
Cmdlet          Disable-TlsEccCurve                                2.0.0.0    TLS
Cmdlet          Disable-TlsSessionTicketKey                        2.0.0.0    TLS
Cmdlet          Disable-TpmAutoProvisioning                        2.0.0.0    TrustedPlatformModule
Cmdlet          Disable-Uev                                        2.1.639.0  UEV
Cmdlet          Disable-UevAppxPackage                             2.1.639.0  UEV
Cmdlet          Disable-UevTemplate                                2.1.639.0  UEV
Cmdlet          Disable-WindowsErrorReporting                      1.0        WindowsErrorReporting
Cmdlet          Disable-WindowsOptionalFeature                     3.0        Dism
Cmdlet          Disable-WSManCredSSP                               3.0.0.0    Microsoft.WSMan.Management
Cmdlet          Disconnect-PSSession                               3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Disconnect-WSMan                                   3.0.0.0    Microsoft.WSMan.Management
Cmdlet          Dismount-AppxVolume                                2.0.1.0    Appx
Cmdlet          Dismount-WindowsImage                              3.0        Dism
Cmdlet          Edit-CIPolicyRule                                  1.0        ConfigCI
Cmdlet          Enable-AppBackgroundTaskDiagnosticLog              1.0.0.0    AppBackgroundTask
Cmdlet          Enable-Appv                                        1.0.0.0    AppvClient
Cmdlet          Enable-AppvClientConnectionGroup                   1.0.0.0    AppvClient
Cmdlet          Enable-ComputerRestore                             3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Enable-JobTrigger                                  1.1.0.0    PSScheduledJob
Cmdlet          Enable-LocalUser                                   1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          Enable-PSBreakpoint                                3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Enable-PSRemoting                                  3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Enable-PSSessionConfiguration                      3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Enable-RunspaceDebug                               3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Enable-ScheduledJob                                1.1.0.0    PSScheduledJob
Cmdlet          Enable-TlsCipherSuite                              2.0.0.0    TLS
Cmdlet          Enable-TlsEccCurve                                 2.0.0.0    TLS
Cmdlet          Enable-TlsSessionTicketKey                         2.0.0.0    TLS
Cmdlet          Enable-TpmAutoProvisioning                         2.0.0.0    TrustedPlatformModule
Cmdlet          Enable-Uev                                         2.1.639.0  UEV
Cmdlet          Enable-UevAppxPackage                              2.1.639.0  UEV
Cmdlet          Enable-UevTemplate                                 2.1.639.0  UEV
Cmdlet          Enable-WindowsErrorReporting                       1.0        WindowsErrorReporting
Cmdlet          Enable-WindowsOptionalFeature                      3.0        Dism
Cmdlet          Enable-WSManCredSSP                                3.0.0.0    Microsoft.WSMan.Management
Cmdlet          Enter-PSHostProcess                                3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Enter-PSSession                                    3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Exit-PSHostProcess                                 3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Exit-PSSession                                     3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Expand-WindowsCustomDataImage                      3.0        Dism
Cmdlet          Expand-WindowsImage                                3.0        Dism
Cmdlet          Export-Alias                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Export-BinaryMiLog                                 1.0.0.0    CimCmdlets
Cmdlet          Export-Certificate                                 1.0.0.0    PKI
Cmdlet          Export-Clixml                                      3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Export-Console                                     3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Export-Counter                                     3.0.0.0    Microsoft.PowerShell.Diagnostics
Cmdlet          Export-Csv                                         3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Export-FormatData                                  3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Export-ModuleMember                                3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Export-PfxCertificate                              1.0.0.0    PKI
Cmdlet          Export-ProvisioningPackage                         3.0        Provisioning
Cmdlet          Export-PSSession                                   3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Export-StartLayout                                 1.0.0.1    StartLayout
Cmdlet          Export-StartLayoutEdgeAssets                       1.0.0.1    StartLayout
Cmdlet          Export-TlsSessionTicketKey                         2.0.0.0    TLS
Cmdlet          Export-Trace                                       3.0        Provisioning
Cmdlet          Export-UevConfiguration                            2.1.639.0  UEV
Cmdlet          Export-UevPackage                                  2.1.639.0  UEV
Cmdlet          Export-WindowsCapabilitySource                     3.0        Dism
Cmdlet          Export-WindowsDriver                               3.0        Dism
Cmdlet          Export-WindowsImage                                3.0        Dism
Cmdlet          Find-Package                                       1.0.0.1    PackageManagement
Cmdlet          Find-PackageProvider                               1.0.0.1    PackageManagement
Cmdlet          ForEach-Object                                     3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Format-Custom                                      3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Format-List                                        3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Format-SecureBootUEFI                              2.0.0.0    SecureBoot
Cmdlet          Format-Table                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Format-Wide                                        3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-Acl                                            3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Get-Alias                                          3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-AppLockerFileInformation                       2.0.0.0    AppLocker
Cmdlet          Get-AppLockerPolicy                                2.0.0.0    AppLocker
Cmdlet          Get-AppvClientApplication                          1.0.0.0    AppvClient
Cmdlet          Get-AppvClientConfiguration                        1.0.0.0    AppvClient
Cmdlet          Get-AppvClientConnectionGroup                      1.0.0.0    AppvClient
Cmdlet          Get-AppvClientMode                                 1.0.0.0    AppvClient
Cmdlet          Get-AppvClientPackage                              1.0.0.0    AppvClient
Cmdlet          Get-AppvPublishingServer                           1.0.0.0    AppvClient
Cmdlet          Get-AppvStatus                                     1.0.0.0    AppvClient
Cmdlet          Get-AppxDefaultVolume                              2.0.1.0    Appx
Cmdlet          Get-AppxPackage                                    2.0.1.0    Appx
Cmdlet          Get-AppxPackageManifest                            2.0.1.0    Appx
Cmdlet          Get-AppxProvisionedPackage                         3.0        Dism
Cmdlet          Get-AppxVolume                                     2.0.1.0    Appx
Cmdlet          Get-AuthenticodeSignature                          3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Get-BitsTransfer                                   2.0.0.0    BitsTransfer
Cmdlet          Get-Certificate                                    1.0.0.0    PKI
Cmdlet          Get-CertificateAutoEnrollmentPolicy                1.0.0.0    PKI
Cmdlet          Get-CertificateEnrollmentPolicyServer              1.0.0.0    PKI
Cmdlet          Get-CertificateNotificationTask                    1.0.0.0    PKI
Cmdlet          Get-ChildItem                                      3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-CimAssociatedInstance                          1.0.0.0    CimCmdlets
Cmdlet          Get-CimClass                                       1.0.0.0    CimCmdlets
Cmdlet          Get-CimInstance                                    1.0.0.0    CimCmdlets
Cmdlet          Get-CimSession                                     1.0.0.0    CimCmdlets
Cmdlet          Get-CIPolicy                                       1.0        ConfigCI
Cmdlet          Get-CIPolicyIdInfo                                 1.0        ConfigCI
Cmdlet          Get-CIPolicyInfo                                   1.0        ConfigCI
Cmdlet          Get-Clipboard                                      3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-CmsMessage                                     3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Get-Command                                        3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Get-ComputerInfo                                   3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-ComputerRestorePoint                           3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-Content                                        3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-ControlPanelItem                               3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-Counter                                        3.0.0.0    Microsoft.PowerShell.Diagnostics
Cmdlet          Get-Credential                                     3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Get-Culture                                        3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-DAPolicyChange                                 2.0.0.0    NetSecurity
Cmdlet          Get-Date                                           3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-DeliveryOptimizationLog                        1.0.2.0    DeliveryOptimization
Cmdlet          Get-DeliveryOptimizationLogAnalysis                1.0.2.0    DeliveryOptimization
Cmdlet          Get-Event                                          3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-EventLog                                       3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-EventSubscriber                                3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-ExecutionPolicy                                3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Get-FormatData                                     3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-Help                                           3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Get-History                                        3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Get-Host                                           3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-HotFix                                         3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-Item                                           3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-ItemProperty                                   3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-ItemPropertyValue                              3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-Job                                            3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Get-JobTrigger                                     1.1.0.0    PSScheduledJob
Cmdlet          Get-KdsConfiguration                               1.0.0.0    Kds
Cmdlet          Get-KdsRootKey                                     1.0.0.0    Kds
Cmdlet          Get-LocalGroup                                     1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          Get-LocalGroupMember                               1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          Get-LocalUser                                      1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          Get-Location                                       3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-Member                                         3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-Module                                         3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Get-NonRemovableAppsPolicy                         3.0        Dism
Cmdlet          Get-Package                                        1.0.0.1    PackageManagement
Cmdlet          Get-PackageProvider                                1.0.0.1    PackageManagement
Cmdlet          Get-PackageSource                                  1.0.0.1    PackageManagement
Cmdlet          Get-PfxCertificate                                 3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Get-PfxData                                        1.0.0.0    PKI
Cmdlet          Get-PmemDisk                                       1.0.0.0    PersistentMemory
Cmdlet          Get-PmemPhysicalDevice                             1.0.0.0    PersistentMemory
Cmdlet          Get-PmemUnusedRegion                               1.0.0.0    PersistentMemory
Cmdlet          Get-Process                                        3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-ProcessMitigation                              1.0.12     ProcessMitigations
Cmdlet          Get-ProvisioningPackage                            3.0        Provisioning
Cmdlet          Get-PSBreakpoint                                   3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-PSCallStack                                    3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-PSDrive                                        3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-PSHostProcessInfo                              3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Get-PSProvider                                     3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-PSReadLineKeyHandler                           2.0.0      PSReadline
Cmdlet          Get-PSReadLineOption                               2.0.0      PSReadline
Cmdlet          Get-PSSession                                      3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Get-PSSessionCapability                            3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Get-PSSessionConfiguration                         3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Get-PSSnapin                                       3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Get-Random                                         3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-Runspace                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-RunspaceDebug                                  3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-ScheduledJob                                   1.1.0.0    PSScheduledJob
Cmdlet          Get-ScheduledJobOption                             1.1.0.0    PSScheduledJob
Cmdlet          Get-SecureBootPolicy                               2.0.0.0    SecureBoot
Cmdlet          Get-SecureBootUEFI                                 2.0.0.0    SecureBoot
Cmdlet          Get-Service                                        3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-SystemDriver                                   1.0        ConfigCI
Cmdlet          Get-TimeZone                                       3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-TlsCipherSuite                                 2.0.0.0    TLS
Cmdlet          Get-TlsEccCurve                                    2.0.0.0    TLS
Cmdlet          Get-Tpm                                            2.0.0.0    TrustedPlatformModule
Cmdlet          Get-TpmEndorsementKeyInfo                          2.0.0.0    TrustedPlatformModule
Cmdlet          Get-TpmSupportedFeature                            2.0.0.0    TrustedPlatformModule
Cmdlet          Get-TraceSource                                    3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-Transaction                                    3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-TroubleshootingPack                            1.0.0.0    TroubleshootingPack
Cmdlet          Get-TrustedProvisioningCertificate                 3.0        Provisioning
Cmdlet          Get-TypeData                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-UevAppxPackage                                 2.1.639.0  UEV
Cmdlet          Get-UevConfiguration                               2.1.639.0  UEV
Cmdlet          Get-UevStatus                                      2.1.639.0  UEV
Cmdlet          Get-UevTemplate                                    2.1.639.0  UEV
Cmdlet          Get-UevTemplateProgram                             2.1.639.0  UEV
Cmdlet          Get-UICulture                                      3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-Unique                                         3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-Variable                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Get-WheaMemoryPolicy                               2.0.0.0    Whea
Cmdlet          Get-WIMBootEntry                                   3.0        Dism
Cmdlet          Get-WinAcceptLanguageFromLanguageListOptOut        2.0.0.0    International
Cmdlet          Get-WinCultureFromLanguageListOptOut               2.0.0.0    International
Cmdlet          Get-WinDefaultInputMethodOverride                  2.0.0.0    International
Cmdlet          Get-WindowsCapability                              3.0        Dism
Cmdlet          Get-WindowsDeveloperLicense                        1.0.0.0    WindowsDeveloperLicense
Cmdlet          Get-WindowsDriver                                  3.0        Dism
Cmdlet          Get-WindowsEdition                                 3.0        Dism
Cmdlet          Get-WindowsErrorReporting                          1.0        WindowsErrorReporting
Cmdlet          Get-WindowsImage                                   3.0        Dism
Cmdlet          Get-WindowsImageContent                            3.0        Dism
Cmdlet          Get-WindowsOptionalFeature                         3.0        Dism
Cmdlet          Get-WindowsPackage                                 3.0        Dism
Cmdlet          Get-WindowsReservedStorageState                    3.0        Dism
Cmdlet          Get-WindowsSearchSetting                           1.0.0.0    WindowsSearch
Cmdlet          Get-WinEvent                                       3.0.0.0    Microsoft.PowerShell.Diagnostics
Cmdlet          Get-WinHomeLocation                                2.0.0.0    International
Cmdlet          Get-WinLanguageBarOption                           2.0.0.0    International
Cmdlet          Get-WinSystemLocale                                2.0.0.0    International
Cmdlet          Get-WinUILanguageOverride                          2.0.0.0    International
Cmdlet          Get-WinUserLanguageList                            2.0.0.0    International
Cmdlet          Get-WmiObject                                      3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-WSManCredSSP                                   3.0.0.0    Microsoft.WSMan.Management
Cmdlet          Get-WSManInstance                                  3.0.0.0    Microsoft.WSMan.Management
Cmdlet          Group-Object                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Import-Alias                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Import-BinaryMiLog                                 1.0.0.0    CimCmdlets
Cmdlet          Import-Certificate                                 1.0.0.0    PKI
Cmdlet          Import-Clixml                                      3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Import-Counter                                     3.0.0.0    Microsoft.PowerShell.Diagnostics
Cmdlet          Import-Csv                                         3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Import-LocalizedData                               3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Import-Module                                      3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Import-PackageProvider                             1.0.0.1    PackageManagement
Cmdlet          Import-PfxCertificate                              1.0.0.0    PKI
Cmdlet          Import-PSSession                                   3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Import-StartLayout                                 1.0.0.1    StartLayout
Cmdlet          Import-TpmOwnerAuth                                2.0.0.0    TrustedPlatformModule
Cmdlet          Import-UevConfiguration                            2.1.639.0  UEV
Cmdlet          Initialize-PmemPhysicalDevice                      1.0.0.0    PersistentMemory
Cmdlet          Initialize-Tpm                                     2.0.0.0    TrustedPlatformModule
Cmdlet          Install-Package                                    1.0.0.1    PackageManagement
Cmdlet          Install-PackageProvider                            1.0.0.1    PackageManagement
Cmdlet          Install-ProvisioningPackage                        3.0        Provisioning
Cmdlet          Install-TrustedProvisioningCertificate             3.0        Provisioning
Cmdlet          Invoke-CimMethod                                   1.0.0.0    CimCmdlets
Cmdlet          Invoke-Command                                     3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Invoke-CommandInDesktopPackage                     2.0.1.0    Appx
Cmdlet          Invoke-DscResource                                 1.1        PSDesiredStateConfiguration
Cmdlet          Invoke-Expression                                  3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Invoke-History                                     3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Invoke-Item                                        3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Invoke-RestMethod                                  3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Invoke-TroubleshootingPack                         1.0.0.0    TroubleshootingPack
Cmdlet          Invoke-WebRequest                                  3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Invoke-WmiMethod                                   3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Invoke-WSManAction                                 3.0.0.0    Microsoft.WSMan.Management
Cmdlet          Join-DtcDiagnosticResourceManager                  1.0.0.0    MsDtc
Cmdlet          Join-Path                                          3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Limit-EventLog                                     3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Measure-Command                                    3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Measure-Object                                     3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Merge-CIPolicy                                     1.0        ConfigCI
Cmdlet          Mount-AppvClientConnectionGroup                    1.0.0.0    AppvClient
Cmdlet          Mount-AppvClientPackage                            1.0.0.0    AppvClient
Cmdlet          Mount-AppxVolume                                   2.0.1.0    Appx
Cmdlet          Mount-WindowsImage                                 3.0        Dism
Cmdlet          Move-AppxPackage                                   2.0.1.0    Appx
Cmdlet          Move-Item                                          3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Move-ItemProperty                                  3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          New-Alias                                          3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          New-AppLockerPolicy                                2.0.0.0    AppLocker
Cmdlet          New-CertificateNotificationTask                    1.0.0.0    PKI
Cmdlet          New-CimInstance                                    1.0.0.0    CimCmdlets
Cmdlet          New-CimSession                                     1.0.0.0    CimCmdlets
Cmdlet          New-CimSessionOption                               1.0.0.0    CimCmdlets
Cmdlet          New-CIPolicy                                       1.0        ConfigCI
Cmdlet          New-CIPolicyRule                                   1.0        ConfigCI
Cmdlet          New-DtcDiagnosticTransaction                       1.0.0.0    MsDtc
Cmdlet          New-Event                                          3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          New-EventLog                                       3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          New-FileCatalog                                    3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          New-Item                                           3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          New-ItemProperty                                   3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          New-JobTrigger                                     1.1.0.0    PSScheduledJob
Cmdlet          New-LocalGroup                                     1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          New-LocalUser                                      1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          New-Module                                         3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          New-ModuleManifest                                 3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          New-NetIPsecAuthProposal                           2.0.0.0    NetSecurity
Cmdlet          New-NetIPsecMainModeCryptoProposal                 2.0.0.0    NetSecurity
Cmdlet          New-NetIPsecQuickModeCryptoProposal                2.0.0.0    NetSecurity
Cmdlet          New-Object                                         3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          New-PmemDisk                                       1.0.0.0    PersistentMemory
Cmdlet          New-ProvisioningRepro                              3.0        Provisioning
Cmdlet          New-PSDrive                                        3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          New-PSRoleCapabilityFile                           3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          New-PSSession                                      3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          New-PSSessionConfigurationFile                     3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          New-PSSessionOption                                3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          New-PSTransportOption                              3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          New-PSWorkflowExecutionOption                      2.0.0.0    PSWorkflow
Cmdlet          New-ScheduledJobOption                             1.1.0.0    PSScheduledJob
Cmdlet          New-SelfSignedCertificate                          1.0.0.0    PKI
Cmdlet          New-Service                                        3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          New-TimeSpan                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          New-TlsSessionTicketKey                            2.0.0.0    TLS
Cmdlet          New-Variable                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          New-WebServiceProxy                                3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          New-WindowsCustomImage                             3.0        Dism
Cmdlet          New-WindowsImage                                   3.0        Dism
Cmdlet          New-WinEvent                                       3.0.0.0    Microsoft.PowerShell.Diagnostics
Cmdlet          New-WinUserLanguageList                            2.0.0.0    International
Cmdlet          New-WSManInstance                                  3.0.0.0    Microsoft.WSMan.Management
Cmdlet          New-WSManSessionOption                             3.0.0.0    Microsoft.WSMan.Management
Cmdlet          Optimize-AppxProvisionedPackages                   3.0        Dism
Cmdlet          Optimize-WindowsImage                              3.0        Dism
Cmdlet          Out-Default                                        3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Out-File                                           3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Out-GridView                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Out-Host                                           3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Out-Null                                           3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Out-Printer                                        3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Out-String                                         3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Pop-Location                                       3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Protect-CmsMessage                                 3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Publish-AppvClientPackage                          1.0.0.0    AppvClient
Cmdlet          Publish-DscConfiguration                           1.1        PSDesiredStateConfiguration
Cmdlet          Push-Location                                      3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Read-Host                                          3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Receive-DtcDiagnosticTransaction                   1.0.0.0    MsDtc
Cmdlet          Receive-Job                                        3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Receive-PSSession                                  3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Register-ArgumentCompleter                         3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Register-CimIndicationEvent                        1.0.0.0    CimCmdlets
Cmdlet          Register-EngineEvent                               3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Register-ObjectEvent                               3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Register-PackageSource                             1.0.0.1    PackageManagement
Cmdlet          Register-PSSessionConfiguration                    3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Register-ScheduledJob                              1.1.0.0    PSScheduledJob
Cmdlet          Register-UevTemplate                               2.1.639.0  UEV
Cmdlet          Register-WmiEvent                                  3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Remove-AppvClientConnectionGroup                   1.0.0.0    AppvClient
Cmdlet          Remove-AppvClientPackage                           1.0.0.0    AppvClient
Cmdlet          Remove-AppvPublishingServer                        1.0.0.0    AppvClient
Cmdlet          Remove-AppxPackage                                 2.0.1.0    Appx
Cmdlet          Remove-AppxProvisionedPackage                      3.0        Dism
Cmdlet          Remove-AppxVolume                                  2.0.1.0    Appx
Cmdlet          Remove-BitsTransfer                                2.0.0.0    BitsTransfer
Cmdlet          Remove-CertificateEnrollmentPolicyServer           1.0.0.0    PKI
Cmdlet          Remove-CertificateNotificationTask                 1.0.0.0    PKI
Cmdlet          Remove-CimInstance                                 1.0.0.0    CimCmdlets
Cmdlet          Remove-CimSession                                  1.0.0.0    CimCmdlets
Cmdlet          Remove-CIPolicyRule                                1.0        ConfigCI
Cmdlet          Remove-Computer                                    3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Remove-Event                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Remove-EventLog                                    3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Remove-Item                                        3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Remove-ItemProperty                                3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Remove-Job                                         3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Remove-JobTrigger                                  1.1.0.0    PSScheduledJob
Cmdlet          Remove-LocalGroup                                  1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          Remove-LocalGroupMember                            1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          Remove-LocalUser                                   1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          Remove-Module                                      3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Remove-PmemDisk                                    1.0.0.0    PersistentMemory
Cmdlet          Remove-PSBreakpoint                                3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Remove-PSDrive                                     3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Remove-PSReadLineKeyHandler                        2.0.0      PSReadline
Cmdlet          Remove-PSSession                                   3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Remove-PSSnapin                                    3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Remove-TypeData                                    3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Remove-Variable                                    3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Remove-WindowsCapability                           3.0        Dism
Cmdlet          Remove-WindowsDriver                               3.0        Dism
Cmdlet          Remove-WindowsImage                                3.0        Dism
Cmdlet          Remove-WindowsPackage                              3.0        Dism
Cmdlet          Remove-WmiObject                                   3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Remove-WSManInstance                               3.0.0.0    Microsoft.WSMan.Management
Cmdlet          Rename-Computer                                    3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Rename-Item                                        3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Rename-ItemProperty                                3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Rename-LocalGroup                                  1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          Rename-LocalUser                                   1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          Repair-AppvClientConnectionGroup                   1.0.0.0    AppvClient
Cmdlet          Repair-AppvClientPackage                           1.0.0.0    AppvClient
Cmdlet          Repair-UevTemplateIndex                            2.1.639.0  UEV
Cmdlet          Repair-WindowsImage                                3.0        Dism
Cmdlet          Reset-ComputerMachinePassword                      3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Resolve-DnsName                                    1.0.0.0    DnsClient
Cmdlet          Resolve-Path                                       3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Restart-Computer                                   3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Restart-Service                                    3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Restore-Computer                                   3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Restore-UevBackup                                  2.1.639.0  UEV
Cmdlet          Restore-UevUserSetting                             2.1.639.0  UEV
Cmdlet          Resume-BitsTransfer                                2.0.0.0    BitsTransfer
Cmdlet          Resume-Job                                         3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Resume-ProvisioningSession                         3.0        Provisioning
Cmdlet          Resume-Service                                     3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Save-Help                                          3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Save-Package                                       1.0.0.1    PackageManagement
Cmdlet          Save-WindowsImage                                  3.0        Dism
Cmdlet          Select-Object                                      3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Select-String                                      3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Select-Xml                                         3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Send-AppvClientReport                              1.0.0.0    AppvClient
Cmdlet          Send-DtcDiagnosticTransaction                      1.0.0.0    MsDtc
Cmdlet          Send-MailMessage                                   3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Set-Acl                                            3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Set-Alias                                          3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Set-AppBackgroundTaskResourcePolicy                1.0.0.0    AppBackgroundTask
Cmdlet          Set-AppLockerPolicy                                2.0.0.0    AppLocker
Cmdlet          Set-AppvClientConfiguration                        1.0.0.0    AppvClient
Cmdlet          Set-AppvClientMode                                 1.0.0.0    AppvClient
Cmdlet          Set-AppvClientPackage                              1.0.0.0    AppvClient
Cmdlet          Set-AppvPublishingServer                           1.0.0.0    AppvClient
Cmdlet          Set-AppxDefaultVolume                              2.0.1.0    Appx
Cmdlet          Set-AppXProvisionedDataFile                        3.0        Dism
Cmdlet          Set-AuthenticodeSignature                          3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Set-BitsTransfer                                   2.0.0.0    BitsTransfer
Cmdlet          Set-CertificateAutoEnrollmentPolicy                1.0.0.0    PKI
Cmdlet          Set-CimInstance                                    1.0.0.0    CimCmdlets
Cmdlet          Set-CIPolicyIdInfo                                 1.0        ConfigCI
Cmdlet          Set-CIPolicySetting                                1.0        ConfigCI
Cmdlet          Set-CIPolicyVersion                                1.0        ConfigCI
Cmdlet          Set-Clipboard                                      3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Set-Content                                        3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Set-Culture                                        2.0.0.0    International
Cmdlet          Set-Date                                           3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Set-DeliveryOptimizationStatus                     1.0.2.0    DeliveryOptimization
Cmdlet          Set-DODownloadMode                                 1.0.2.0    DeliveryOptimization
Cmdlet          Set-DOPercentageMaxBackgroundBandwidth             1.0.2.0    DeliveryOptimization
Cmdlet          Set-DOPercentageMaxForegroundBandwidth             1.0.2.0    DeliveryOptimization
Cmdlet          Set-DscLocalConfigurationManager                   1.1        PSDesiredStateConfiguration
Cmdlet          Set-ExecutionPolicy                                3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Set-HVCIOptions                                    1.0        ConfigCI
Cmdlet          Set-Item                                           3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Set-ItemProperty                                   3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Set-JobTrigger                                     1.1.0.0    PSScheduledJob
Cmdlet          Set-KdsConfiguration                               1.0.0.0    Kds
Cmdlet          Set-LocalGroup                                     1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          Set-LocalUser                                      1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          Set-Location                                       3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Set-NonRemovableAppsPolicy                         3.0        Dism
Cmdlet          Set-PackageSource                                  1.0.0.1    PackageManagement
Cmdlet          Set-ProcessMitigation                              1.0.12     ProcessMitigations
Cmdlet          Set-PSBreakpoint                                   3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Set-PSDebug                                        3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Set-PSReadLineKeyHandler                           2.0.0      PSReadline
Cmdlet          Set-PSReadLineOption                               2.0.0      PSReadline
Cmdlet          Set-PSSessionConfiguration                         3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Set-RuleOption                                     1.0        ConfigCI
Cmdlet          Set-ScheduledJob                                   1.1.0.0    PSScheduledJob
Cmdlet          Set-ScheduledJobOption                             1.1.0.0    PSScheduledJob
Cmdlet          Set-SecureBootUEFI                                 2.0.0.0    SecureBoot
Cmdlet          Set-Service                                        3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Set-StrictMode                                     3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Set-TimeZone                                       3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Set-TpmOwnerAuth                                   2.0.0.0    TrustedPlatformModule
Cmdlet          Set-TraceSource                                    3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Set-UevConfiguration                               2.1.639.0  UEV
Cmdlet          Set-UevTemplateProfile                             2.1.639.0  UEV
Cmdlet          Set-Variable                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Set-WheaMemoryPolicy                               2.0.0.0    Whea
Cmdlet          Set-WinAcceptLanguageFromLanguageListOptOut        2.0.0.0    International
Cmdlet          Set-WinCultureFromLanguageListOptOut               2.0.0.0    International
Cmdlet          Set-WinDefaultInputMethodOverride                  2.0.0.0    International
Cmdlet          Set-WindowsEdition                                 3.0        Dism
Cmdlet          Set-WindowsProductKey                              3.0        Dism
Cmdlet          Set-WindowsReservedStorageState                    3.0        Dism
Cmdlet          Set-WindowsSearchSetting                           1.0.0.0    WindowsSearch
Cmdlet          Set-WinHomeLocation                                2.0.0.0    International
Cmdlet          Set-WinLanguageBarOption                           2.0.0.0    International
Cmdlet          Set-WinSystemLocale                                2.0.0.0    International
Cmdlet          Set-WinUILanguageOverride                          2.0.0.0    International
Cmdlet          Set-WinUserLanguageList                            2.0.0.0    International
Cmdlet          Set-WmiInstance                                    3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Set-WSManInstance                                  3.0.0.0    Microsoft.WSMan.Management
Cmdlet          Set-WSManQuickConfig                               3.0.0.0    Microsoft.WSMan.Management
Cmdlet          Show-Command                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Show-ControlPanelItem                              3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Show-EventLog                                      3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Show-WindowsDeveloperLicenseRegistration           1.0.0.0    WindowsDeveloperLicense
Cmdlet          Sort-Object                                        3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Split-Path                                         3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Split-WindowsImage                                 3.0        Dism
Cmdlet          Start-BitsTransfer                                 2.0.0.0    BitsTransfer
Cmdlet          Start-DscConfiguration                             1.1        PSDesiredStateConfiguration
Cmdlet          Start-DtcDiagnosticResourceManager                 1.0.0.0    MsDtc
Cmdlet          Start-Job                                          3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Start-OSUninstall                                  3.0        Dism
Cmdlet          Start-Process                                      3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Start-Service                                      3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Start-Sleep                                        3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Start-Transaction                                  3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Start-Transcript                                   3.0.0.0    Microsoft.PowerShell.Host
Cmdlet          Stop-AppvClientConnectionGroup                     1.0.0.0    AppvClient
Cmdlet          Stop-AppvClientPackage                             1.0.0.0    AppvClient
Cmdlet          Stop-Computer                                      3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Stop-DtcDiagnosticResourceManager                  1.0.0.0    MsDtc
Cmdlet          Stop-Job                                           3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Stop-Process                                       3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Stop-Service                                       3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Stop-Transcript                                    3.0.0.0    Microsoft.PowerShell.Host
Cmdlet          Suspend-BitsTransfer                               2.0.0.0    BitsTransfer
Cmdlet          Suspend-Job                                        3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Suspend-Service                                    3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Switch-Certificate                                 1.0.0.0    PKI
Cmdlet          Sync-AppvPublishingServer                          1.0.0.0    AppvClient
Cmdlet          Tee-Object                                         3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Test-AppLockerPolicy                               2.0.0.0    AppLocker
Cmdlet          Test-Certificate                                   1.0.0.0    PKI
Cmdlet          Test-ComputerSecureChannel                         3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Test-Connection                                    3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Test-DscConfiguration                              1.1        PSDesiredStateConfiguration
Cmdlet          Test-FileCatalog                                   3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Test-KdsRootKey                                    1.0.0.0    Kds
Cmdlet          Test-ModuleManifest                                3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Test-Path                                          3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Test-PSSessionConfigurationFile                    3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Test-UevTemplate                                   2.1.639.0  UEV
Cmdlet          Test-WSMan                                         3.0.0.0    Microsoft.WSMan.Management
Cmdlet          Trace-Command                                      3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Unblock-File                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Unblock-Tpm                                        2.0.0.0    TrustedPlatformModule
Cmdlet          Undo-DtcDiagnosticTransaction                      1.0.0.0    MsDtc
Cmdlet          Undo-Transaction                                   3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Uninstall-Package                                  1.0.0.1    PackageManagement
Cmdlet          Uninstall-ProvisioningPackage                      3.0        Provisioning
Cmdlet          Uninstall-TrustedProvisioningCertificate           3.0        Provisioning
Cmdlet          Unprotect-CmsMessage                               3.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Unpublish-AppvClientPackage                        1.0.0.0    AppvClient
Cmdlet          Unregister-Event                                   3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Unregister-PackageSource                           1.0.0.1    PackageManagement
Cmdlet          Unregister-PSSessionConfiguration                  3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Unregister-ScheduledJob                            1.1.0.0    PSScheduledJob
Cmdlet          Unregister-UevTemplate                             2.1.639.0  UEV
Cmdlet          Unregister-WindowsDeveloperLicense                 1.0.0.0    WindowsDeveloperLicense
Cmdlet          Update-FormatData                                  3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Update-Help                                        3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Update-List                                        3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Update-TypeData                                    3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Update-UevTemplate                                 2.1.639.0  UEV
Cmdlet          Update-WIMBootEntry                                3.0        Dism
Cmdlet          Use-Transaction                                    3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Use-WindowsUnattend                                3.0        Dism
Cmdlet          Wait-Debugger                                      3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Wait-Event                                         3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Wait-Job                                           3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Wait-Process                                       3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Where-Object                                       3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Write-Debug                                        3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Write-Error                                        3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Write-EventLog                                     3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Write-Host                                         3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Write-Information                                  3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Write-Output                                       3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Write-Progress                                     3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Write-Verbose                                      3.1.0.0    Microsoft.PowerShell.Utility
Cmdlet          Write-Warning                                      3.1.0.0    Microsoft.PowerShell.Utility
```

7. Toon een overzicht van alle commando’s die beginnen met Get- en ergens User in de naam hebben
```
PS C:\git\WindowsServer1\opdracht1_inleiding> Get-Command get-*user*

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Cmdlet          Get-LocalUser                                      1.0.0.0    Microsoft.PowerShell.LocalAccounts
Cmdlet          Get-WinUserLanguageList                            2.0.0.0    International
```

8. Toon een overzicht van alle PowerShell providers die momenteel ingeladen zijn
```
PS C:\git\WindowsServer1\opdracht1_inleiding> Get-PSProvider

Name                 Capabilities                                             Drives
----                 ------------                                             ------
Registry             ShouldProcess, Transactions                              {HKLM, HKCU}
Alias                ShouldProcess                                            {Alias}
Environment          ShouldProcess                                            {Env}
FileSystem           Filter, ShouldProcess, Credentials                       {C, D}
Function             ShouldProcess                                            {Function}
Variable             ShouldProcess                                            {Variable}
Certificate          ShouldProcess                                            {Cert}
```

De pipeline (“|”) kan gebruikt worden om het resultaat van een commando door te geven aan een volgend commando. De pipeline is bijvoorbeeld heel nuttig om te filteren op bepaalde waarden van properties door gebruik te maken van where. Een fictief voorbeeld:
```
Get-... | where {$_.someproperty -eq ‘abc’}
```
Bij uitvoeren van dit commando zullen enkel de objecten getoond worden waarbij someproperty de waarde abc heeft.

9. Maak gebruik van de pipeline in combinatie met where om enkel werkwoorden te tonen uit de common groep.
```
PS C:\git\WindowsServer1\opdracht1_inleiding> get-verb | Get-Member


   TypeName: Selected.Microsoft.PowerShell.Commands.MemberDefinition

Name        MemberType   Definition
----        ----------   ----------
Equals      Method       bool Equals(System.Object obj)
GetHashCode Method       int GetHashCode()
GetType     Method       type GetType()
ToString    Method       string ToString()
Group       NoteProperty System.String Group=Common
Verb        NoteProperty System.String Verb=Add


PS C:\git\WindowsServer1\opdracht1_inleiding> get-verb | where {$_.group -eq 'common'}

Verb     Group
----     -----
Add      Common
Clear    Common
Close    Common
Copy     Common
Enter    Common
Exit     Common
Find     Common
Format   Common
Get      Common
Hide     Common
Join     Common
Lock     Common
Move     Common
New      Common
Open     Common
Optimize Common
Pop      Common
Push     Common
Redo     Common
Remove   Common
Rename   Common
Reset    Common
Resize   Common
Search   Common
Select   Common
Set      Common
Show     Common
Skip     Common
Split    Common
Step     Common
Switch   Common
Undo     Common
Unlock   Common
Watch    Common
```

10. Geef een overzicht van alle commando’s die als CommandType de waarde Alias hebben.
```
PS C:\git\WindowsServer1\opdracht1_inleiding> get-command | get-member


   TypeName: System.Management.Automation.AliasInfo

Name                MemberType     Definition
----                ----------     ----------
Equals              Method         bool Equals(System.Object obj)
GetHashCode         Method         int GetHashCode()
GetType             Method         type GetType()
ResolveParameter    Method         System.Management.Automation.ParameterMetadata ResolveParameter(string name)
ToString            Method         string ToString()
CommandType         Property       System.Management.Automation.CommandTypes CommandType {get;}
Definition          Property       string Definition {get;}
Description         Property       string Description {get;set;}
Module              Property       psmoduleinfo Module {get;}
ModuleName          Property       string ModuleName {get;}
Name                Property       string Name {get;}
Options             Property       System.Management.Automation.ScopedItemOptions Options {get;set;}
OutputType          Property       System.Collections.ObjectModel.ReadOnlyCollection[System.Management.Automation.PSTypeName] Outp...
Parameters          Property       System.Collections.Generic.Dictionary[string,System.Management.Automation.ParameterMetadata] Pa...
ParameterSets       Property       System.Collections.ObjectModel.ReadOnlyCollection[System.Management.Automation.CommandParameter...
ReferencedCommand   Property       System.Management.Automation.CommandInfo ReferencedCommand {get;}
RemotingCapability  Property       System.Management.Automation.RemotingCapability RemotingCapability {get;}
ResolvedCommand     Property       System.Management.Automation.CommandInfo ResolvedCommand {get;}
Source              Property       string Source {get;}
Version             Property       version Version {get;}
Visibility          Property       System.Management.Automation.SessionStateEntryVisibility Visibility {get;set;}
DisplayName         ScriptProperty System.Object DisplayName {get=if ($this.Name.IndexOf('-') -lt 0)...
HelpUri             ScriptProperty System.Object HelpUri {get=$oldProgressPreference = $ProgressPreference...
ResolvedCommandName ScriptProperty System.Object ResolvedCommandName {get=$this.ResolvedCommand.Name;}


   TypeName: System.Management.Automation.FunctionInfo

Name                MemberType     Definition
----                ----------     ----------
Equals              Method         bool Equals(System.Object obj)
GetHashCode         Method         int GetHashCode()
GetType             Method         type GetType()
ResolveParameter    Method         System.Management.Automation.ParameterMetadata ResolveParameter(string name)
ToString            Method         string ToString()
CmdletBinding       Property       bool CmdletBinding {get;}
CommandType         Property       System.Management.Automation.CommandTypes CommandType {get;}
DefaultParameterSet Property       string DefaultParameterSet {get;}
Definition          Property       string Definition {get;}
Description         Property       string Description {get;set;}
HelpFile            Property       string HelpFile {get;}
Module              Property       psmoduleinfo Module {get;}
ModuleName          Property       string ModuleName {get;}
Name                Property       string Name {get;}
Noun                Property       string Noun {get;}
Options             Property       System.Management.Automation.ScopedItemOptions Options {get;set;}
OutputType          Property       System.Collections.ObjectModel.ReadOnlyCollection[System.Management.Automation.PSTypeName] Outp...
Parameters          Property       System.Collections.Generic.Dictionary[string,System.Management.Automation.ParameterMetadata] Pa...
ParameterSets       Property       System.Collections.ObjectModel.ReadOnlyCollection[System.Management.Automation.CommandParameter...
RemotingCapability  Property       System.Management.Automation.RemotingCapability RemotingCapability {get;}
ScriptBlock         Property       scriptblock ScriptBlock {get;}
Source              Property       string Source {get;}
Verb                Property       string Verb {get;}
Version             Property       version Version {get;}
Visibility          Property       System.Management.Automation.SessionStateEntryVisibility Visibility {get;set;}
HelpUri             ScriptProperty System.Object HelpUri {get=$oldProgressPreference = $ProgressPreference...


   TypeName: System.Management.Automation.CmdletInfo

Name                MemberType     Definition
----                ----------     ----------
Equals              Method         bool Equals(System.Object obj)
GetHashCode         Method         int GetHashCode()
GetType             Method         type GetType()
ResolveParameter    Method         System.Management.Automation.ParameterMetadata ResolveParameter(string name)
ToString            Method         string ToString()
CommandType         Property       System.Management.Automation.CommandTypes CommandType {get;}
DefaultParameterSet Property       string DefaultParameterSet {get;}
Definition          Property       string Definition {get;}
HelpFile            Property       string HelpFile {get;}
ImplementingType    Property       type ImplementingType {get;}
Module              Property       psmoduleinfo Module {get;}
ModuleName          Property       string ModuleName {get;}
Name                Property       string Name {get;}
Noun                Property       string Noun {get;}
Options             Property       System.Management.Automation.ScopedItemOptions Options {get;set;}
OutputType          Property       System.Collections.ObjectModel.ReadOnlyCollection[System.Management.Automation.PSTypeName] Outp...
Parameters          Property       System.Collections.Generic.Dictionary[string,System.Management.Automation.ParameterMetadata] Pa...
ParameterSets       Property       System.Collections.ObjectModel.ReadOnlyCollection[System.Management.Automation.CommandParameter...
PSSnapIn            Property       System.Management.Automation.PSSnapInInfo PSSnapIn {get;}
RemotingCapability  Property       System.Management.Automation.RemotingCapability RemotingCapability {get;}
Source              Property       string Source {get;}
Verb                Property       string Verb {get;}
Version             Property       version Version {get;}
Visibility          Property       System.Management.Automation.SessionStateEntryVisibility Visibility {get;set;}
DLL                 ScriptProperty System.Object DLL {get=$this.ImplementingType.Assembly.Location;}
HelpUri             ScriptProperty System.Object HelpUri {get=$oldProgressPreference = $ProgressPreference...


PS C:\git\WindowsServer1\opdracht1_inleiding> get-command | where {$_.CommandType -eq 'alias'}

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           Add-AppPackage                                     2.0.1.0    Appx
Alias           Add-AppPackageVolume                               2.0.1.0    Appx
Alias           Add-AppProvisionedPackage                          3.0        Dism
Alias           Add-ProvisionedAppPackage                          3.0        Dism
Alias           Add-ProvisionedAppxPackage                         3.0        Dism
Alias           Add-ProvisioningPackage                            3.0        Provisioning
Alias           Add-TrustedProvisioningCertificate                 3.0        Provisioning
Alias           Apply-WindowsUnattend                              3.0        Dism
Alias           Disable-PhysicalDiskIndication                     2.0.0.0    Storage
Alias           Disable-StorageDiagnosticLog                       2.0.0.0    Storage
Alias           Dismount-AppPackageVolume                          2.0.1.0    Appx
Alias           Enable-PhysicalDiskIndication                      2.0.0.0    Storage
Alias           Enable-StorageDiagnosticLog                        2.0.0.0    Storage
Alias           Flush-Volume                                       2.0.0.0    Storage
Alias           Get-AppPackage                                     2.0.1.0    Appx
Alias           Get-AppPackageDefaultVolume                        2.0.1.0    Appx
Alias           Get-AppPackageLastError                            2.0.1.0    Appx
Alias           Get-AppPackageLog                                  2.0.1.0    Appx
Alias           Get-AppPackageManifest                             2.0.1.0    Appx
Alias           Get-AppPackageVolume                               2.0.1.0    Appx
Alias           Get-AppProvisionedPackage                          3.0        Dism
Alias           Get-BinRoot                                        0.0        chocolateyInstaller
Alias           Get-DiskSNV                                        2.0.0.0    Storage
Alias           Get-PackageParameters                              0.0        chocolateyInstaller
Alias           Get-PhysicalDiskSNV                                2.0.0.0    Storage
Alias           Get-ProvisionedAppPackage                          3.0        Dism
Alias           Get-ProvisionedAppxPackage                         3.0        Dism
Alias           Get-StorageEnclosureSNV                            2.0.0.0    Storage
Alias           Initialize-Volume                                  2.0.0.0    Storage
Alias           Mount-AppPackageVolume                             2.0.1.0    Appx
Alias           Move-AppPackage                                    2.0.1.0    Appx
Alias           Move-SmbClient                                     2.0.0.0    SmbWitness
Alias           Optimize-AppProvisionedPackages                    3.0        Dism
Alias           Optimize-ProvisionedAppPackages                    3.0        Dism
Alias           Optimize-ProvisionedAppxPackages                   3.0        Dism
Alias           Remove-AppPackage                                  2.0.1.0    Appx
Alias           Remove-AppPackageVolume                            2.0.1.0    Appx
Alias           Remove-AppProvisionedPackage                       3.0        Dism
Alias           Remove-EtwTraceSession                             1.0.0.0    EventTracingManagement
Alias           Remove-ProvisionedAppPackage                       3.0        Dism
Alias           Remove-ProvisionedAppxPackage                      3.0        Dism
Alias           Remove-ProvisioningPackage                         3.0        Provisioning
Alias           Remove-TrustedProvisioningCertificate              3.0        Provisioning
Alias           Set-AppPackageDefaultVolume                        2.0.1.0    Appx
Alias           Set-AppPackageProvisionedDataFile                  3.0        Dism
Alias           Set-AutologgerConfig                               1.0.0.0    EventTracingManagement
Alias           Set-EtwTraceSession                                1.0.0.0    EventTracingManagement
Alias           Set-ProvisionedAppPackageDataFile                  3.0        Dism
Alias           Set-ProvisionedAppXDataFile                        3.0        Dism
Alias           Write-FileSystemCache                              2.0.0.0    Storage
```

11. Vraag een overzicht op van alle commando’s die je reeds uitgevoerd hebt.
```
PS C:\git\WindowsServer1\opdracht1_inleiding> Get-History

  Id CommandLine
  -- -----------
   1 Get-ExecutionPolicy
   2 Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePoi...
   3 choco install git
   4 choco install vscode
   5 cd .\WindowsServer1\
   6 cd .\opdracht1_inleiding\
   7 get-help
   8 get-help get-help -online
   9 Update-help
  10 get-help get-alias
  11 get-help get-alias -full
  12 get-verb
  13 get-verb *x*
  14 get-command
  15 Get-Command get-*user*
  16 Get-PSProvider
  17 get-verb | where {$_.group -eq 'common'}
  18 get-verb | Get-Member
  19 get-command | get-member
  20 get-command | where {$_.CommandType -eq 'alias'}
```

## B. Getters en Setters

1. Vraag de huidige werkdirectory op via een Get commando.
```
PS C:\git\WindowsServer1\opdracht1_inleiding> get-location

Path
----
C:\git\WindowsServer1\opdracht1_inleiding
```

2. Wijzig de huidige werkdirectory naar C:\Users via een Set commando.
```
PS C:\git\WindowsServer1\opdracht1_inleiding> Set-Location c:\users
PS C:\users>
```

3. Vraag de huidige datum en tijdstip op via een Get commando.
```
PS C:\users> get-date

Tuesday, November 22, 2022 5:31:08 PM
```

4. Idem als de vorige vraag, maar in het jaar 2019.
```
PS C:\users> get-date -Year 2019

Friday, November 22, 2019 5:32:26 PM
```

5. Gebruik hetzelfde Get commando om na te gaan welke dag van de week 1/1/2000 was.
```
PS C:\users> Get-Date -Day 1 -Month 1 -Year 2000

Saturday, January 1, 2000 5:33:56 PM


PS C:\users> get-date 2000-01-01

Saturday, January 1, 2000 12:00:00 AM
```

6. Vraag een overzicht op van alle disks die gekend zijn binnen Windows.
```
PS C:\users> Get-Disk

Number Friendly Name               Serial Number                    HealthStatus         OperationalStatus      Total Size Partition
                                                                                                                           Style
------ -------------               -------------                    ------------         -----------------      ---------- ----------
0      VBOX HARDDISK               VBb56399c0-3b0e80c9              Healthy              Online                     100 GB MBR
```

7. Vraag een overzicht op van alle partities die gekend zijn binnen Windows.
```
PS C:\users> Get-Partition


   DiskPath: \\?\scsi#disk&ven_vbox&prod_harddisk#4&3554261f&0&000000#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}

PartitionNumber  DriveLetter Offset                                               Size Type
---------------  ----------- ------                                               ---- ----
1                           1048576                                             50 MB IFS
2                C           53477376                                         58.05 GB IFS
3                           62388174848                                        501 MB Unknown
```

8. Vraag een overzicht op van alle lokale gebruikers.
```
PS C:\users> Get-LocalUser

Name               Enabled Description
----               ------- -----------
Administrator      False   Built-in account for administering the computer/domain
DefaultAccount     False   A user account managed by the system.
Guest              False   Built-in account for guest access to the computer/domain
Student            True
WDAGUtilityAccount False   A user account managed and used by the system for Windows Defender Application Guard scenarios.
```

9. Vraag een overzicht op van alle lokale gebruikers die niet actief zijn.
```
PS C:\users> Get-LocalUser | where {$_.enabled -eq ${False} }

Name               Enabled Description
----               ------- -----------
Administrator      False   Built-in account for administering the computer/domain
DefaultAccount     False   A user account managed by the system.
Guest              False   Built-in account for guest access to the computer/domain
WDAGUtilityAccount False   A user account managed and used by the system for Windows Defender Application Guard scenarios.
```
**`OPGELET:`**
```
PS C:\users> Get-LocalUser | where {$_.enabled -eq 'False' }

Name    Enabled Description
----    ------- -----------
Student True
```

10. Vraag een overzicht op van alle IP-adressen die gebruikt worden op jouw VM.
```
PS C:\users> (Get-NetIPAddress).IPAddress
fe80::3411:8845:f0d4:1e6e%7
::1
10.0.2.15
127.0.0.1
PS C:\users> (Get-NetIPAddress | where {$_.AddressFamily -eq 'IPv4'}).IPAddress
10.0.2.15
127.0.0.1
PS C:\users> write-host (Get-NetIPAddress | where {$_.AddressFamily -eq 'IPv4'}).IPAddress
10.0.2.15 127.0.0.1
PS C:\users> Get-NetIPAddress


IPAddress         : fe80::3411:8845:f0d4:1e6e%7
InterfaceIndex    : 7
InterfaceAlias    : Ethernet
AddressFamily     : IPv6
Type              : Unicast
PrefixLength      : 64
PrefixOrigin      : WellKnown
SuffixOrigin      : Link
AddressState      : Preferred
ValidLifetime     : Infinite ([TimeSpan]::MaxValue)
PreferredLifetime : Infinite ([TimeSpan]::MaxValue)
SkipAsSource      : False
PolicyStore       : ActiveStore

IPAddress         : ::1
InterfaceIndex    : 1
InterfaceAlias    : Loopback Pseudo-Interface 1
AddressFamily     : IPv6
Type              : Unicast
PrefixLength      : 128
PrefixOrigin      : WellKnown
SuffixOrigin      : WellKnown
AddressState      : Preferred
ValidLifetime     : Infinite ([TimeSpan]::MaxValue)
PreferredLifetime : Infinite ([TimeSpan]::MaxValue)
SkipAsSource      : False
PolicyStore       : ActiveStore

IPAddress         : 10.0.2.15
InterfaceIndex    : 7
InterfaceAlias    : Ethernet
AddressFamily     : IPv4
Type              : Unicast
PrefixLength      : 24
PrefixOrigin      : Dhcp
SuffixOrigin      : Dhcp
AddressState      : Preferred
ValidLifetime     : 20:21:03
PreferredLifetime : 20:21:03
SkipAsSource      : False
PolicyStore       : ActiveStore

IPAddress         : 127.0.0.1
InterfaceIndex    : 1
InterfaceAlias    : Loopback Pseudo-Interface 1
AddressFamily     : IPv4
Type              : Unicast
PrefixLength      : 8
PrefixOrigin      : WellKnown
SuffixOrigin      : WellKnown
AddressState      : Preferred
ValidLifetime     : Infinite ([TimeSpan]::MaxValue)
PreferredLifetime : Infinite ([TimeSpan]::MaxValue)
SkipAsSource      : False
PolicyStore       : ActiveStore
```

11. Vraag een overzicht op van alle netwerkkaarten in jouw VM.
```
PS C:\users> Get-NetAdapter

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  Intel(R) PRO/1000 MT Desktop Adapter          7 Up           08-00-27-ED-19-18         1 Gbps
```

12. Idem als de vorige vraag, maar sorteer deze op basis van het MAC adres. Gebruik hiervoor een pipeline in combinatie met Sort.
```
PS C:\users> Get-NetAdapter| Sort MacAddress

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  Intel(R) PRO/1000 MT Desktop Adapter          7 Up           08-00-27-ED-19-18         1 Gbps
```
**`een beter voorbeeld:`**
```
PS C:\users> Get-LocalUser| sort Enabled

Name               Enabled Description
----               ------- -----------
Guest              False   Built-in account for guest access to the computer/domain
WDAGUtilityAccount False   A user account managed and used by the system for Windows Defender Application Guard scenarios.
Administrator      False   Built-in account for administering the computer/domain
DefaultAccount     False   A user account managed by the system.
Student            True
```

13. Idem als de vorige vraag, maar sorteer de interfaces op basis van de ifIndex in aflopende volgorde.
**`een beter voorbeeld:`**
```
PS C:\users> Get-LocalUser| sort Name -Descending

Name               Enabled Description
----               ------- -----------
WDAGUtilityAccount False   A user account managed and used by the system for Windows Defender Application Guard scenarios.
Student            True
Guest              False   Built-in account for guest access to the computer/domain
DefaultAccount     False   A user account managed by the system.
Administrator      False   Built-in account for administering the computer/domain
```