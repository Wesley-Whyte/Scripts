#
# Windows PowerShell script for AD DS Deployment
#

param (
    [string]$DomainName = "iamwesley.ca",
    [string]$SafeModePassword = "P@ssw0rd!"
)

$NetBiosName = $DomainName.Split('.')[0].ToUpper()

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
    -SafeModeAdministratorPassword (ConvertTo-SecureString $SafeModePassword -AsPlainText -Force) `
    -Force:$true
