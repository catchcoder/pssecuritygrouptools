$param1 = $args[0]
$param2 = $args[1]
$scriptname = $MyInvocation.MyCommand.name
$psv = $PSVersionTable.PSversion
Write-Host -ForegroundColor blue "PS $psv $scriptname Version 1.0"
if ($param1 -contains "*" -or $param2 -contains "*") { $param1 ="";$param2="" }
if ( $param1 -And $param2 ) {
    Write-Host "Adding user ""$param1"" to security group ""$param2"""
    $yn = Read-Host -prompt "Press Y to continue or any other key to cancel"
    if ($yn -eq "y" -or $yn -eq "Y" ) {
         Add-ADGroupMember -Identity  "$param2" -Members $param1 -Server ads.bris.ac.uk
        }
    }
else {
    Write-Host -ForegroundColor green "Usage ./$scriptname uobusername ad-security-group e.g. ./$scriptname cecth 'EENG_VIL_Storage_server'"
}

