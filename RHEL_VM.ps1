# -------------------------
# VARIABLES
# -------------------------
$vmResourceGroup = "CKA_Learning"       # Where VM and NIC will live
$vnetResourceGroup = "infrastructure"         # Where the existing VNet lives
$location = "eastus"
$vmVnetName = "default"
$vmSubnetName = "default-1"
$vmName = "rhel9-cka_learning"
$nicName = "$vmName-nic"
$adminUsername = "abhi_test"
$adminPassword = "Pa$$word@1234"
$vmSize = "Standard_B2s"
$imagePublisher = "RedHat"
$imageOffer = "RHEL"
$imageSku = "9_0"
$imageVersion = "latest"

# -------------------------
# CREATE RESOURCE GROUP FOR VM (if needed)
# -------------------------
az group create `
  --name $vmResourceGroup `
  --location $location

# -------------------------
# CREATE NETWORK INTERFACE IN VM RESOURCE GROUP
# BUT REFERENCE VNET IN DIFFERENT RESOURCE GROUP
# -------------------------
az network nic create `
  --resource-group $vmResourceGroup `
  --name $nicName `
  --subnet /subscriptions/775cd73b-3ed3-483f-b766-cc6f18cfad39/resourceGroups/infrastructure/providers/Microsoft.Network/virtualNetworks/default/subnets/default-1

# -------------------------
# CREATE RHEL 9 VM
# -------------------------
az vm create `
  --resource-group $vmResourceGroup `
  --name $vmName `
  --location $location `
  --nics $nicName `
  --image "RedHat:RHEL:9_0:latest" `
  --size $vmSize `
  --admin-username $adminUsername `
  --admin-password $adminPassword `
  --authentication-type password `
  --os-disk-size-gb 64
