# Requires -Version 6
# Requires -Modules ActiveDirectory

$param1 = $args[0]
$activedirectoryname = "ads.bris.ac.uk"
$scriptname = $MyInvocation.MyCommand.name
$psv = $PSVersionTable.PSversion

Write-Host -ForegroundColor blue "PS $psv $scriptname Version 1.0"

if ($param1 -contains "*") {
    $param1 = ""
}

if ($param1) {
    Write-Host "Searching..."
    Get-ADGroupMember -Identity "$param1" -Server $activedirectoryname | Select-Object name
} else {
    Write-Host -ForegroundColor green "Usage: ./$scriptname 'ad-security-group'"
}
