#
# Windows PowerShell script for AD DS Deployment
#

param (
    [string]$DomainName,
    [String]$SafeModePassword
)

$NetBiosName = $DomainName.Split('.')[0].ToUpper()
$password = ConvertTo-SecureString -AsPlainText $SafeModePassword -Force

Import-Module ADDSDeployment
Install-ADDSForest `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "WinThreshold" `
    -DomainName $DomainName `
    -DomainNetbiosName $NetBiosName `
    -ForestMode "WinThreshold" `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$false `
    -SysvolPath "C:\Windows\SYSVOL" `
    -SafeModeAdministratorPassword $password `
    -Force:$true
