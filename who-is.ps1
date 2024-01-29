$param1 = $args[0]
$scriptname = $MyInvocation.MyCommand.name
$psv = $PSVersionTable.PSversion
Write-Host -ForegroundColor blue "PS $psv $scriptname Version 1.0"
if ($param1 -contains "*") { $param1 = "" }
if ( $param1 ) {
    Write-Host "Searching..."
    Get-ADUser -Identity "$param1" -Server ads.bris.ac.uk
} else {
    Write-Host -ForegroundColor Green "Usage ./$scriptname uob-login-name e.g. ./$scriptname cecth"
}