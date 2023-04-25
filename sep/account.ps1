function Get-FirstChars {
    Param (
        [Parameter (ValueFromPipeline=$true)]
        [String] $inputString
        ,
        [int] $numberOfChars = 3
    )
    Process {
        $_.substring(0, @($_.length,$numberOfChars)[$_.length -ge $numberOfChars]) 
    }
}

function Generate-AccountName {
    Param (
        [Parameter (ValueFromPipeline=$true)]
        [object] $userInfo
    )
    Process {
        "$($userInfo.FirstName | Get-FirstChars)$($userInfo.LastName | Get-FirstChars)$($userInfo.Year)"
    }
}

$TestInput = @(
    @{FirstName='win';  LastName='l';    Year='2018'}
    @{FirstName='wi';   LastName='lo';   Year='2018'}
    @{FirstName='w';    LastName='los';  Year='2018'}
    @{FirstName='winn'; LastName='lose'; Year='2018'}
    )

$TestInput | Generate-AccountName