#
# Windows PowerShell script for AD DS Deployment
#

Import-Module ADDSDeployment
$adminPassword = ConvertTo-SecureString "Weezywhyte95#" -AsPlainText -Force
Install-ADDSForest `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "WinThreshold" `
    -DomainName "corp.iamwesley.ca" `
    -DomainNetbiosName "IAMWESLEY" `
    -ForestMode "WinThreshold" `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$false `
    -SysvolPath "C:\Windows\SYSVOL" `
    -SafeModeAdministratorPassword $adminPassword `
    -Force:$true
