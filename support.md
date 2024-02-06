# Powershell

Run ise in the console to get Ise
ISE for remote server connection

## Update Help

```powershell
Get-help
Update-help
```

# When modules have errors, use :

```powershell
Update-Help  -Force -ErrorAction SilentlyContinue -ErrorVariable $what

Show-Command Get-WmiObject `
```

## List all commands

```powershell
Get-command
Get-member
```

## Variables

```powershell
$policy = New-WBPolicy
```

## Profile files
```powershell
New-Item $profile -ItemType file -Force
ise $profile
```
## Anxiety on running commands

```powershell
-WhatIf
-Confirm
-ErrorAction Stop
```
```powershell
get-service -Name AdobeARMservice | Stop-Service -Confirm
get-service -Name AdobeARMservice | Start-Service -WhatIf
```

## List Services running and stopped
```powershell
Get-service "net*" | where-object{$_.status -eq "Running"}
Get-service  | where-object{$_.status -eq "stopped"} | out-gridview
```

### Change column heading name
```powershell
Get-Service -name bits  | Select-Object -Property  @{n="service name";e={$_.name}}, status
```

### Change column heading and calculate freespace  in gb and  use int to round up

```powershell
Get-WmiObject -Class win32_logicaldisk  -filter "DeviceID='C:'" | Select-Object deviceID, @{n='Free Space';e={$_.freespace /1gb -as [int]}}
```

#List all properties

```powershell
Get-service | get-member
Get-Service | gm
```

#Execute methods e.g start a service

```powershell
Get-Service -name bits  | ForEach-Object {$_.Stop()}
```

#Search

List all services and all properties that have stopped to a gui window
```powershell
get-service | where-object{$_.status -eq "stopped"} | select-object * | out-gridview
```

List all service and properties display name, status start type that are running, sort by display name and output to a gui window
```powershell
get-service | where-object  {$_.status -eq "running"} |select-object DisplayName, Status, StartType  | sort-object -property DisplayName | out-gridview
```

#Clear heading

```powershell
Get-service | Select-object -expandproperty name

#table view
Get-service | Format-Table *
Get-service | Format-list
Get-service | sort-object -property status

#working with output
Get-service | out-file "c:\services.txt"
Get-service | export-csv "c:\services.txt"

#Grid View
Get-service | out-Gridview
Get-service |  select-object displayname, status, requiredservices | out-gridview
```

# XML & Compare xml files

## Example of compare

```powershell
Get-process | export-clixml  -path process-ref
Calc;notepad 
Compare-Object -ReferenceObject (Import-Clixml .\process-ref.xml) -DifferenceObject (get-process) -Property processname
```

# Finding modules

```powershell
Get-module
Get-module -listavailable
Import-module -name applocker
Get-command -module applocker
Get-module
```
# Security updates - Hotfixes

```powershell
Get-WUInstall -AcceptAll -Download
Get-hotfix 
```

# Event log

```powershell
Get-EventLog -LogName system -After(get-date -Day 4 -Month 9 -Hour 00  -Minute 00)
Get-EventLog -LogName system -After(get-date).AddDays(-1)
Get-EventLog  -LogName system -After (Get-Date).AddDays(-1) | Where-Object {$_.EntryType -eq 'warning'}
```

# ExecutionPolicy

```powershell
Get-ExecutionPolicy -List
Set-ExecutionPolicy unrestricted -scope MachinePolicy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -ErrorAction continue
```

# Copy to clipboard
```powershell
Get-Date -UFormat "%Y-%m-%dT%TZ" | clip.exe
```

# IIS

```powershell
install-PswaWebApplication -UseTestCertificate
Add-PswaAuthorizationRule * * *
```

# Windows server

```powershell
Get-windowsfeature
Get-windowsfeature -Name web-server
Get-windowsfeature -Name web-server | install-WindowsFeature
Get-WindowsFeature *hyper-v*
	# Install only the PowerShell module
	Install-WindowsFeature -Name Hyper-V-PowerShell
	 
	# Install Hyper-V Manager and the PowerShell module (HVM only available on GUI systems)
	Install-WindowsFeature -Name RSAT-Hyper-V-Tools
	 
	# Install the Hyper-V hypervisor and all tools (method #1)
	Install-WindowsFeature -Name Hyper-V -IncludeManagementTools
	 
	# Install the Hyper-V hypervisor and all tools (method #2)
	Install-WindowsFeature -Name Hyper-V, RSAT-Hyper-V-Tools
```


# Windows 10

```powershell
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online

Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online

Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State

Get-WindowsOptionalFeature -Online -FeatureName *hyper-v* | select DisplayName, FeatureName


# Install only the PowerShell module

```powershell
	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Management-PowerShell
	
	# Install the Hyper-V management tool pack (Hyper-V Manager and the Hyper-V PowerShell module)
	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Tools-All
	
	# Install the entire Hyper-V stack (hypervisor, services, and tools)
	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
```

# Web

```powershell
Invoke-WebRequest -Uri https://github.com/PowerShell/PowerShell/releases/download/v6.1.0/PowerShell-6.1.0-win-x64.msi -OutFile .\pscore.msi

TLS 1 needs to change searc
[net.servicepointmanager]::securityprotocol =TLS2, TLS11 , TLS1
```

# File management

```powershell
Remove-item -path .\IE11WIN7\ -Force
```

# Access system environment variables

```powershell
$env:computername
```

# Get processes

```powershell
get-process
get-process | where-object {$_.processname -eq "firefox" }
```

# Credentials

Powershell doesn't allow multihop 

```powershell
$C = Get-Credential
PS C:\> Get-WmiObject Win32_DiskDrive -ComputerName "Server01" -Credential $C
```

# Remote control

```powershell
Enable-PSRemoting -Force 
To fix multihop isse 
Enable-wsmanCredSSP -Delegatecomputer * -role Client -Force
Disable-wsmancredssp
Invoke-Command -Authentication Credssp
Invoke-command -session $session {Enable-wsmanCredSSP -Delegatecomputer * -role server -Force}

Set-Item wsman:\localhost\client\trustedhosts *
    Restart-Service WinRM

Test-WsMan COMPUTER --- test if wnrm working on remote pc

Invoke-Command -ComputerName COMPUTER -ScriptBlock { COMMAND } -credential USERNAME
Invoke-Command -ComputerName 10.0.0.22 -ScriptBlock { Get-ChildItem C:\ } -credential vagrant

Enter-PSSession -ComputerName COMPUTER -Credential (get-credential)
set-ExecutionPolicy -Force -ExecutionPolicy Unrestricted
```


# USE PS Version 2 on remote only

Register-PSSessionConfiguration -Name PS2 -PSVersion 2.0
#Then, on the client machine, reference the 'PS2' configuration.

```powershell
$s = New-PSSession -ComputerName Server01 -ConfigurationName PS2

Working with VM
Enter-PSSession -VMName <VMName>
Enter-PSSession -VMId <VMId>
Exit-PSSession

Invoke-Command -VMName <VMName> -ScriptBlock { command } 
Invoke-Command -VMId <VMId> -ScriptBlock { command }

OR
$s = New-PSSession -VMName <VMName> -Credential (Get-Credential)
$s = New-PSSession -VMId <VMId> -Credential (Get-Credential)

Copy-Item -ToSession $s -Path C:\host_path\data.txt -Destination C:\guest_path\

Copy-Item -FromSession $s -Path C:\guest_path\data.txt -Destination C:\host_path\

Remove-PSSession $s
```

# Working with registry

```powershell
$curValue = (get-item wsman:\localhost\Client\TrustedHosts).value
```

# Folder search date

```powershell
Get-Item  * | where-object {$_.LastAccessTime -gt (Get-Date).AddDays(-360)}
Get-Item  * | where-object {$_.LastAccessTime -gt (Get-Date).AddDays(-360)} |where-Object {$_.Name -notmatch "-"} 
Get-Item  * | where-object {$_.LastAccessTime -gt (Get-Date).AddDays(-360)} |where-Object {$_Name -notmatch "-"} | Measure-Object
```

# List Registry values

```powershell
$(Get-Item "HKLM:\Software\Microsoft\Windows NT\CurrentVersion")
```

# Comparitors

```powershell
-eq
-ne
-gt
-ge 
-lt
-le
-Like
-NotLike
-Match
-NotMatch
-Contains
-NotContains
-In
-NotIn
-Replace
```


Issues with variables with . (dot illegal character in variable)
$drive = Get-CimInstance -class win32_logicaldisk
$x = "Drive $drive.deviceid has $drive.freespace freespace"
    Drive Win32_LogicalDisk: C: (DeviceID = "C:").deviceid has Win32_LogicalDisk: C: (DeviceID = "C:").freespace freespace
Use $() to surround the expression as a single expression execute and replace with what happened in the expression
$x = "Drive $($drive.deviceid) has $($drive.freespace) freespace"
    Drive C: has 701639081984 freespace

List All Classes
Get-cimclass *
Get-wmiobject -list


From <https://social.msdn.microsoft.com/Forums/vstudio/en-US/7d36c178-3519-4715-a42a-c30ef0f1b9f5/not-able-to-create-virtual-switch-on-window-server-2016-full-preview-4?forum=windowscontainers> 




From <https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/get-credential?view=powershell-6> 


PS C:\> Get-WmiObject Win32_DiskDrive -ComputerName "Server01" -Credential $C

From <https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/get-credential?view=powershell-6> 

Within PowerShell console you do not need to run wnrm command-line. WSMAN configuration is available as WSMAN: PSDrive and you can use Set-Item cmdlet to change the values. For example, at elevated prompt
Set-Item WSMAN:\LocalHost\Client\Auth\Basic -Value $false

From <https://social.technet.microsoft.com/Forums/windowsserver/en-US/977381ef-dc7a-4e4a-8457-323ed4c32639/can-you-execute-winrm-2-set-commands-wthin-powershell-2?forum=winserverpowershell> 


Get-ADComputer 'it057759' -Properties location

Files and folders

Get version information  of all exe files
 (get-item (Get-ChildItem  -Path . -Recurse -Include *.exe )).VersionInfo
![image](https://github.com/catchcoder/pssecuritygrouptools/assets/5260986/e089996b-8331-4936-811c-b987c94e007f)
