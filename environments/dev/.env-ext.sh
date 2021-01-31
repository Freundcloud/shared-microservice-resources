#!/bin/bash

az account set --subscription "1dda66b2-2d18-40b8-98c4-6fb5471bdbea"


#rer-sbox-pipeline-sp
export ENV="dev"
export FACING="e"
export ARM_SUBSCRIPTION_ID="1dda66b2-2d18-40b8-98c4-6fb5471bdbea"
#$(az keyvault secret show --name subscription-id --vault-name "ofg-sbox-core-kv" --query value) 
export ARM_CLIENT_ID="3acce428-0e25-46f4-84c4-aab7d0224ec3"
#$(az keyvault secret show --name client-id --vault-name "ofg-sbox-core-kv" --query value)
export ARM_CLIENT_SECRET="v52_vn-WQhzovqiLIENBORibkd8lM2czKg"
#$(az keyvault secret show --name client-secret --vault-name "ofg-sbox-core-kv" --query value) 
export ARM_TENANT_ID="1e432686-1607-4e46-a624-f57fd6fcf3f3"
export RESOURCE_GROUP="$ENV-rer-$FACING-microservices-rg"
export NAMESPACE="ofg-$ENV-$FACING-infra"
export APPGW_NAME="$ENV-rer-$FACING-appgw"
export APPGW_SUBNET="appgwsubnet"
# export RESOURCE_ID="7ea93f0e-5260-4714-bd96-d15acd5625e7"
# export MI_CLIENT_ID="85ace7d5-6b04-423d-8ce3-2c33c60c5946"
export DOMAIN="rercloud.co.uk"
export DNS_ZONE="$ENV.$DOMAIN"
export CONTACT="olaf@freundcloud.com"
export AKSNAME="ofg-$ENV-$FACING-aks"
export KEYVAULT="ofg-dev-core-kv"