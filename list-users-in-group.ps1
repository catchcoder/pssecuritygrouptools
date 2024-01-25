$param1 = $args[0]
Get-ADGroupMember -Identity $param1 -Recursive -Server ads.bris.ac.uk | Select-Object name
 #Get-ADGroupMember -Identity 'EENG_VIL_Storage_server' -Recursive -Server ads.bris.ac.uk | Select-Object name