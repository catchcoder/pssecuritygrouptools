$param1 = $args[0]
if ( $param1 ) {
    Write-Host "Searching..."
    Get-ADGroupMember -Identity $param1 -Server ads.bris.ac.uk | Select-Object name, DisplayName
} else{
    Write-Host -ForegroundColor green "usage ./list-users-in-group.ps1 ad-security-group e.g. ./list-users-in-group.ps1 'EENG_VIL_Storage_server'"
}
