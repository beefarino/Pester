# install the pester module

$pwd = Split-Path -Parent $MyInvocation.MyCommand.Path;
copy ./Pester -Destination ~/Documents/WindowsPowershell/Modules -Container -Force -Verbose -recurse;