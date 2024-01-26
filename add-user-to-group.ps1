$param1 = $args[0]
$param2 = $args[1]
if ( $param1 -And $param2 ) {
    Write-Host "Adding $param1 to security group ""$param2"""
    $yn = Read-Host -prompt "Press Y to contine or any other key to cancel"
    if ($yn -eq "y" -or $yn -eq "Y" ) {
         Add-ADGroupMember -Identity  "$param2" -Members $param1 -Server ads.bris.ac.uk
        }
    }
else {
    Write-Host -ForegroundColor green "Usage ./add-user-to-group.ps1 uobusername ad-security-group e.g. ./add-user-to-group.ps1 cecth 'EENG_VIL_Storage_server'"
}

