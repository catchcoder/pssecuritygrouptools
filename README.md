# Powershell Security Group Tools

Collection of Powershell scripts to manage users of an Active Directory security group.

## Scripts

- add-user-to-group.ps1
- list-users-in-group.ps1
- remove-user-from-group.ps1
- who-is.ps1

## Get the latest Powershell and Active Directory Module

- Run **get-latest-powershell.ps1** to install latest version of PowerShell
- Run **install-rsat-tools-and-module.ps1** (Windows 10) to install RSAT Active Directory DS-LDS.Tools

## Usage

- Powershell Version: **Minimum v6**
- Requires: **Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0 (Active Directory Domain Services and Lightweight Directory Services Tools)**
- Each script has a variable set for the Active Directory domain: *$activedirectoryname*

Script: **who-is.ps1**
Look up a domain user name
`e.g. ./who-is.ps1 domain-user-name`

Script: **list-users-in-group.ps1**
List all users that are in an Active Directory security group.
`e.g. ./list-users-in-group.ps1 'ad-security-group'`

Script: **add-user-to-group.ps1**
Add domain user to Active Directory security group.
`e.g. ./add-user-to-group.ps1 domain-user-name 'ad-security-group'`

Script: **remove-user-from-group.ps1**
Remove domain user name from Active Directory security group.
`e.g. ./remove-user-from-group.ps1 domain-user-name ad-security-group`

---
