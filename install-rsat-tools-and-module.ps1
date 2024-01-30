#Requires -Version 6
#Requires -RunAsAdministrator
Add-WindowsCapability -Online -Name "Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0"
write-host "Verify Ative Directory is p"
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State