$param1 = $args[0]
if ( $param1 ) {
    Write-Host "Searching..."
    Get-ADUser -Identity $param1 -Server ads.bris.ac.uk
} else {
    Write-Host -ForegroundColor Green "Usage .\who-is.ps1 uob-login-name e.g. .\who-is.ps1 cecth"
}