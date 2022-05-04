### custom prompt

Function prompt {
    "`n$env:USERNAME@$env:COMPUTERNAME | $($executionContext.SessionState.Path.CurrentLocation)`n> "
}

### Directory Aliases

Function d1 {
    cd C:\Users\Hilmi\dev-projects
}

Function d2 {
    cd C:\Users\Hilmi\Documents\Skripsi
}

### imitate cd - on bash into powershell
Remove-Item Alias:cd
Function cd
{
    if ($args[0] -eq '-')
    {
        $newdir=$OLDPWD;
    } else {
        $newdir=$args[0];
    }
    $before_change=Get-Location
    if ($newdir)
    {
        Set-Location $newdir;
    }
    Set-Variable -Name OLDPWD -Value $before_change -Scope global; 
 }
