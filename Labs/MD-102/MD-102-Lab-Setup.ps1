$templateFile = "C:\Users\wesof\source\repos\Azure\ARM Templates\MD-102-Labs\MD-102-Labs-template.json"
$resourceGroup = "MD-102"


Write-Output "Creating Resource Group: $resourceGroup-------------------------------------------------------------"
New-AzResourceGroup -Name $resourceGroup -Location "Canada Central"
Write-Output "----------------------------------------------------------------------------------------------------"

Write-Output ""

Write-Output "Deploying ARM Template: $templateFile---------------------------------------------------------------"
New-AzResourceGroupDeployment -Name "ADDeployment" -TemplateFile $templateFile -ResourceGroupName $resourceGroup
Write-Output "----------------------------------------------------------------------------------------------------"