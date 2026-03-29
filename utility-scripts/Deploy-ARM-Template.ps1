#
# Author: Wesley Emuobonuvie
# Description: This script is used to deploy the ARM template. It will create a resource group and deploy the ARM template to the resource group. The ARM template will create the virtual machines and other resources needed for the lab environment.
#


param (
    [string]$TemplateFIle,
    [string]$ParameterFile,
    [string]$ResourceGroup,
    [string]$Location = "Canada Central"
)

Write-Output "Creating Resource Group: ---------------------------------------------------------------------------"
New-AzResourceGroup -Name $resourceGroup -Location $Location -ErrorAction SilentlyContinue -Force
Write-Output "----------------------------------------------------------------------------------------------------"

Write-Output ""

Write-Output "Deploying ARM Template: ----------------------------------------------------------------------------"
New-AzResourceGroupDeployment -Name "ADDeployment" -TemplateFile $TemplateFile -ResourceGroupName $ResourceGroup -TemplateParameterFile $ParameterFile
Write-Output "----------------------------------------------------------------------------------------------------"