# Inleiding PowerShell
In deze eerste reeks zullen we de commando’s van PowerShell verkennen. We gebruiken hiervoor de VM met Windows 10 die we aangemaakt hebben in het eerste labo van Windows Server I.

Je mag voor deze reeks rechtstreeks werken in een PowerShell prompt (dus geen PowerShell ISE nodig).

## A. Basisconcepten

1. Voer het commando Get-Help uit (zonder parameters). Welke parameter kan je gebruiken bij dit commando om de Online versie van een helppagina in de browser te openen? Test dit uit.
```powershell
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
PS C:\git\WindowsServer1\opdracht1_inleiding>

 ```

2. Ga op zoek naar het commando uit om de help files van het internet te downloaden en installeren. Voer dit commando uit.
```powershell
PS C:\git\WindowsServer1\opdracht1_inleiding> Update-help
Update-help : Failed to update Help for the module(s) 'PSReadline' with UI culture(s) {en-US} : Unable to retrieve the HelpInfo XML
file for UI culture en-US. Make sure the HelpInfoUri property in the module manifest is valid or check your network connection and
then try the command again.
At line:1 char:1
+ Update-help
+ ~~~~~~~~~~~
    + CategoryInfo          : ResourceUnavailable: (:) [Update-Help], Exception
    + FullyQualifiedErrorId : UnableToRetrieveHelpInfoXml,Microsoft.PowerShell.Commands.UpdateHelpCommand

PS C:\git\WindowsServer1\opdracht1_inleiding>
```

3. Toon de Help voor het commando Get-Alias (output in terminal). Toon hierbij de volledige (“full”) output inclusief voorbeelden. Welke parameters zijn verplicht bij gebruik van het commando Get-Alias?
```powershell
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


PS C:\git\WindowsServer1\opdracht1_inleiding>
```
**`geen verplichte argumenten`**
```powershell
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



PS C:\git\WindowsServer1\opdracht1_inleiding>
```

4. Toon een overzicht van alle werkwoorden die gebruikt worden binnen commando’s in PowerShell.

5. Idem als vorige vraag, maar toon enkel werkwoorden die ergens de letter X in de naam hebben

6. Toon een overzicht van alle commando’s die ingeladen zijn.

7. Toon een overzicht van alle commando’s die beginnen met Get- en ergens User in de naam hebben

8. Toon een overzicht van alle PowerShell providers die momenteel ingeladen zijn

De pipeline (“|”) kan gebruikt worden om het resultaat van een commando door te geven aan een volgend commando. De pipeline is bijvoorbeeld heel nuttig om te filteren op bepaalde waarden van properties door gebruik te maken van where. Een fictief voorbeeld:
```powershell
Get-... | where {$_.someproperty -eq ‘abc’}
```
Bij uitvoeren van dit commando zullen enkel de objecten getoond worden waarbij someproperty de waarde abc heeft.

9. Maak gebruik van de pipeline in combinatie met where om enkel werkwoorden te tonen uit de common groep.

10. Geef een overzicht van alle commando’s die als CommandType de waarde Alias hebben.

11. Vraag een overzicht op van alle commando’s die je reeds uitgevoerd hebt.

## B. Getters en Setters

1. Vraag de huidige werkdirectory op via een Get commando.

2. Wijzig de huidige werkdirectory naar C:\Users via een Set commando.

3. Vraag de huidige datum en tijdstip op via een Get commando.

4. Idem als de vorige vraag, maar in het jaar 2019.

5. Gebruik hetzelfde Get commando om na te gaan welke dag van de week 1/1/2000 was.

6. Vraag een overzicht op van alle disks die gekend zijn binnen Windows.

7. Vraag een overzicht op van alle partities die gekend zijn binnen Windows.

8. Vraag een overzicht op van alle lokale gebruikers.

9. Vraag een overzicht op van alle lokale gebruikers die niet actief zijn.

10. Vraag een overzicht op van alle IP-adressen die gebruikt worden op jouw VM.

11. Vraag een overzicht op van alle netwerkkaarten in jouw VM.

12. Idem als de vorige vraag, maar sorteer deze op basis van het MAC adres. Gebruik hiervoor een pipeline in combinatie met Sort.

13. Idem als de vorige vraag, maar sorteer de interfaces op basis van de ifIndex in aflopende volgorde.