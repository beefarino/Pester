if ($TestDrive -and ( Test-Path $TestDrive) ) {
    Remove-Item $TestDrive -Recurse -Force
}

if( Get-PSDrive | where { $_.Name -eq 'TestDrive' } ) {
    Remove-PSDrive -Name TestDrive -Scope Global -Force
}

