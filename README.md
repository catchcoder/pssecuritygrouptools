# Powershell Security Group Tools

Collection of Powershell scripts to manage users of an Active Directory security group.

## Scripts

- add-user-to-group.ps1
- list-users-in-group.ps1
- remove-user-from-group.ps1
- who-is.ps1

## Install the latest Powershell and Active Directory Module

- Run **get-latest-powershell.ps1** to install the latest version of PowerShell
- Run **install-rsat-tools-and-module.ps1** (Windows 10) to install RSAT Active Directory DS-LDS.Tools

## Usage

- Powershell Version: **Minimum v6**
- Requires: **Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0** *(Active Directory Domain Services and Lightweight Directory Services Tools)*
- Please note that each script must have a variable changed before use and set to the Active Directory domain name. Configure  **$activedirectoryname** variable. This is a mandatory requirement and cannot be skipped

Script: **who-is.ps1**  
&emsp;Look up a domain user name  

```powershell
e.g. ./who-is.ps1 domain-user-name
```

Script: **list-users-in-group.ps1**  
&emsp;List all users that are in an Active Directory security group.  

```powershell
e.g. ./list-users-in-group.ps1 'ad-security-group'
```

Script: **add-user-to-group.ps1**  
Add domain user to Active Directory security group.  

```powershell
e.g. ./add-user-to-group.ps1 domain-user-name 'ad-security-group'
```

Script: **remove-user-from-group.ps1**  
&emsp;Remove domain user name from Active Directory security group.  

```powershell
e.g. ./remove-user-from-group.ps1 domain-user-name ad-security-group'
```

---

>Known issues: If these are executed and fail because of authentication then you will need to add the following.

```powershell
$creds = Get-Credential
append -Credential $creds to the AD PowerShell command 
e.g. Remove-ADGroupMember -Identity  "$param2" -Members "$param1" -Server $activedirectoryname -Credential $creds
```

---
