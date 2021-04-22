#!/bin/bash
##### RG and VNet #################
az account set --subscription <your subscription GUID>
az group create -l eastus -n New_New
az network vnet create -g New -n New-FirstVnet2 --address-prefix 10.6.0.0/16 
az network vnet subnet create --name New-Sub2 --vnet-name New-FirstVnet2 --resource-group New  --address-prefixes 10.6.1.0/24

##### NSG & Rule availability set#############
az network nsg create -g New -n New_NSG1
az network nsg rule create -g New --nsg-name New_NSG1 -n New_NSG1_Rule1 --priority 100 \
--source-address-prefixes '*' --source-port-ranges '*'     --destination-address-prefixes '*' \
--destination-port-ranges '*' --access Allow   --protocol Tcp --description "Allow from specific IP range" 
az vm availability-set	create --name SOUTH-AVSET1 -g New --location eastus


############ Deleting A RG #################

az group delete -n <Name of RG> --yes