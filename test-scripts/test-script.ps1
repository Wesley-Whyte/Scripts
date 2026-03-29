Write-Host "Hello, Wesley!"

$users = Get-LocalUser

foreach ($user in $users) {
    Write-Host $user.Name
}