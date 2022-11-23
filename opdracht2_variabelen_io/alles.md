# Variabelen, invoer en uitvoer
In deze tweede reeks zullen we enkele oefeningen maken op het gebruik van variabelen, invoer en uitvoer. We gebruiken hiervoor de VM met Windows 10 die we aangemaakt hebben in het eerste labo van Windows Server I.

Je mag voor deze reeks rechtstreeks werken in een PowerShell prompt (dus geen PowerShell ISE nodig).

## A. Variabelen

1. Maak een variabele aan die alle lokale gebruikers bevat. Gebruik nadien deze variabele om na te gaan hoeveel lokale gebruikers er bestaan binnen jouw Windows omgeving.
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $gebruikers = Get-LocalUser
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> echo ${gebruikers}

Name               Enabled Description
----               ------- -----------
Administrator      False   Built-in account for administering the computer/domain
DefaultAccount     False   A user account managed by the system.
Guest              False   Built-in account for guest access to the computer/domain
Student            True
WDAGUtilityAccount False   A user account managed and used by the system for Windows Defender Application Guard scenarios.


PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Write-Host $gebruikers
Administrator DefaultAccount Guest Student WDAGUtilityAccount
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $gebruikers.Count
5
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Get-Member -InputObject $gebruikers


   TypeName: System.Object[]

Name           MemberType            Definition
----           ----------            ----------
Count          AliasProperty         Count = Length
Add            Method                int IList.Add(System.Object value)
Address        Method                System.Object&, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 A...
Clear          Method                void IList.Clear()
Clone          Method                System.Object Clone(), System.Object ICloneable.Clone()
CompareTo      Method                int IStructuralComparable.CompareTo(System.Object other, System.Collections.IComparer comparer)
Contains       Method                bool IList.Contains(System.Object value)
CopyTo         Method                void CopyTo(array array, int index), void CopyTo(array array, long index), void ICollection.C...
Equals         Method                bool Equals(System.Object obj), bool IStructuralEquatable.Equals(System.Object other, System....
Get            Method                System.Object Get(int )
GetEnumerator  Method                System.Collections.IEnumerator GetEnumerator(), System.Collections.IEnumerator IEnumerable.Ge...
GetHashCode    Method                int GetHashCode(), int IStructuralEquatable.GetHashCode(System.Collections.IEqualityComparer ...
GetLength      Method                int GetLength(int dimension)
GetLongLength  Method                long GetLongLength(int dimension)
GetLowerBound  Method                int GetLowerBound(int dimension)
GetType        Method                type GetType()
GetUpperBound  Method                int GetUpperBound(int dimension)
GetValue       Method                System.Object GetValue(Params int[] indices), System.Object GetValue(int index), System.Objec...
IndexOf        Method                int IList.IndexOf(System.Object value)
Initialize     Method                void Initialize()
Insert         Method                void IList.Insert(int index, System.Object value)
Remove         Method                void IList.Remove(System.Object value)
RemoveAt       Method                void IList.RemoveAt(int index)
Set            Method                void Set(int , System.Object )
SetValue       Method                void SetValue(System.Object value, int index), void SetValue(System.Object value, int index1,...
ToString       Method                string ToString()
Item           ParameterizedProperty System.Object IList.Item(int index) {get;set;}
IsFixedSize    Property              bool IsFixedSize {get;}
IsReadOnly     Property              bool IsReadOnly {get;}
IsSynchronized Property              bool IsSynchronized {get;}
Length         Property              int Length {get;}
LongLength     Property              long LongLength {get;}
Rank           Property              int Rank {get;}
SyncRoot       Property              System.Object SyncRoot {get;}


PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $gebruikers.Length
5
```

2. Maak twee variabelen en geef deze als waarde een random getal tussen 0 en 99 (grenzen inbegrepen) – gebruik hiervoor het commando Get-Random. Bereken nadien de som en het product van deze twee getallen.
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $varA = Get-Random -Maximum 100
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $varB = Get-Random -Maximum 100
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Write-Host "${varA} + ${varB} = $(${varA} + ${varB})"
59 + 2 = 61
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Write-Host "${varA} * ${varB} = $(${varA} * ${varB})"
59 * 2 = 118
```

3. Vraag een lijst op van alle variabelen. Verwijder alle variabelen die je aangemaakt hebt in de vorige twee vragen. Controleer nadien of de variabelen inderdaad verdwenen zijn uit de lijst.
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Get-Variable var*,gebr*

Name                           Value
----                           -----
varA                           60
varB                           4
gebruikers                     {Administrator, DefaultAccount, Guest, Student...}

PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> ls variable:var*,variable:gebr*

Name                           Value
----                           -----
varB                           4
varA                           60
gebruikers                     {Administrator, DefaultAccount, Guest, Student...}

PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> del Variable:varA
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Remove-Variable varB
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Remove-Variable -name gebruikers
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> ls variable:var*,variable:gebr*
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io>
```

4. Maak twee variabelen aan, geef de eerste variabele een random waarde tussen 50 en 99 en de tweede variabele een random waarde tussen 5 en 9 (telkens grenzen inbegrepen). Bereken de rest bij deling van de waarde van de eerste variabele gedeeld door de waarde van de tweede variabele.
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $var1 = Get-Random -Minimum 50 -Maximum 100
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $var12 = Get-Random -Minimum 5 -Maximum 10
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Write-Host "rest = ${var1} % ${var2} = $(${var1} % ${var2})"
rest = 61 % 7 = 5
```

5. Hergebruik de twee variabelen van de vorige oefening. Controleer via powershell of de eerste variabele strikt groter is dan de tweede variabele.
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $var1 -gt $var2
True
```

## B. Invoer en uitvoer

1. Vraag de gebruiker om zijn naam in te geven, en bewaar deze in een variabele. Schrijf nadien de naam van de gebruiker uit in hoofdletters (capitals).
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $naam = Read-Host -Prompt "naam: "
naam: : Benny
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Write-Host ("hallo", ${naam}.ToUpper())
hallo BENNY
```

2. Vraag de gebruiker om een willekeurige zin in te geven. Schrijf nadien op het scherm hoeveel letters deze zin bevat.
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $zin = Read-Host -Prompt "zin: "
zin: : dit is een vierzin
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $zin.length
18
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> write-host ("de zin bevat", (measure -Character -IgnoreWhiteSpace -InputObject $zin).Characters, "karakter(s), spaties weggefilterd")
de zin bevat 15 karakter(s), spaties weggefilterd
```


3. Vraag de gebruiker om een willekeurige zin in te geven. Schrijf nadien op het scherm hoeveel woorden deze zin bevat.
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $zin = Read-Host -Prompt "zin: "
zin: : dit is een vierzin
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> write-host ("woorden: ", (measure -word -InputObject $zin).words)
woorden:  4
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $zin.Split().length
4
```

4. Maak een array aan met naam weekdagen waarin je de dagen van de week bewaard. Schrijf deze nadien uit op het scherm.
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> [string[]] $weekdagen = "maandag", "dinsdag", "woensdag", "donderdag", "vrijdag", "zaterdag", "zondag"
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $weekdagen
maandag
dinsdag
woensdag
donderdag
vrijdag
zaterdag
zondag
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Write-Host $weekdagen
maandag dinsdag woensdag donderdag vrijdag zaterdag zondag
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $week = @("ma","di","wo","do","vr","za","zo")
```

5. Gebruik de variabele van de vorige vraag, maar schrijf ditmaal de dagen van de week uit op één lijn, gescheiden door een deelteken (Dus: maandag - dinsdag - ...)
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Write-Host $weekdagen -noNewline -Separator ' - '
maandag - dinsdag - woensdag - donderdag - vrijdag - zaterdag - zondag
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $weekdagen -join ' - '
maandag - dinsdag - woensdag - donderdag - vrijdag - zaterdag - zondag
```

6. Idem als de vorige vraag, maar maak gebruik van de range operator (..) om enkel de werkdagen op het scherm te schrijven (dus: maandag - ... - vrijdag)
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $weekdagen[0..4] -join ' - '
maandag - dinsdag - woensdag - donderdag - vrijdag
```

7. Schrijf een warning op het scherm, de boodschap mag je zelf kiezen.
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Write-Warning -Message "-message mag weggelatgen worden"
WARNING: -message mag weggelatgen worden
```

8. Schrijf Hello World op het scherm, maar zorg dat de tekst rood is met een groene achtergrond.
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Write-Host "hello world" -ForegroundColor red -BackgroundColor green
hello world
```

9. Haal een overzicht op van alle netwerkkaarten in jouw VM, en schrijf de uitvoer weg naar een (plaintext) bestand. Lees dit bestand nadien in en schrijf de inhoud van dit bestand op het scherm.
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Get-NetAdapter | Out-File netwerkadapters.txt
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Get-Content .\netwerkadapters.txt                                                                                                                                                                                            
Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  Intel(R) PRO/1000 MT Desktop Adapter          7 Up           08-00-27-ED-19-18         1 Gbps
```

10. Idem als de vorige vraag, maar maak nu gebruik van een CSV voor wegschrijven van de netwerkkaarten. Lees daarna de CSV in, en schrijf op het scherm hoeveel netwerkkaarten jouw VM bevat.  
**`wegens maar 1 netwerkkaart hier users gepakt`**
```
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> Get-LocalUser | Export-Csv users.csv
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $gebruikers = Import-Csv .\users.csv
PS C:\GIT\WindowsServer1\opdracht2_variabelen_io> $gebruikers.Count
5
```
