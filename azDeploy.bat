REM Requires the xplat python Azure CLI 2.0 installed, see https://docs.microsoft.com/en-us/cli/azure/install-azure-cli and https://docs.microsoft.com/en-us/cli/azure/group/deployment#create
REM az login
REM az group create -n twoDoms -l "West Europe"
az group deployment create --template-file azuredeploy.json -g twoDoms
