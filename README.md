# Introduction

This repo contains infrastructure as code to install Azure services to support the RER application.

These services include:

- Azure DNS
- Azure KeyVault
- Azure NSG
- Azure Network
- Azure Storage Accounts
- Azure Kubernetes Services (AKS)


### Pre-requirements for running code locally

- kubectl
- azure cli
- jq
- envsubst
- terraform (< 13)

### Internal Cluster

```bash
make $core
make $ENV-int
make $ENV-int-destory
```

### External Cluster

```bash
make $ENV-ext
make $ENV-ext
make $ENV-ext-destroy
```


## Index of repo

/environments = $ENV files

/images = plan .svg files for each environment

/pipelines = Azure Pipelines

/scripts = Shell script for creating SP for each environment

/modules = TF modules  ( not in use yet )


## Running code locally:

This is an example for "data" subscription and set for "external" fencing cluster. Please adapt where needed.

````bash
#!/bin/bash

az account set --subscription "231b7368-bbed-4b1b-9ab7-460b5393260b"

export ENV="data"
export FACING="e"
export ARM_SUBSCRIPTION_ID=$(az keyvault secret show --name subscription-id --vault-name "ofg-data-core-kv" --query value -o tsv) 
export ARM_CLIENT_ID=$(az keyvault secret show --name client-id --vault-name "ofg-data-core-kv" --query value -o tsv)
export ARM_CLIENT_SECRET=$(az keyvault secret show --name client-secret --vault-name "ofg-data-core-kv" --query value -o tsv) 
export ARM_TENANT_ID="1e432686-1607-4e46-a624-f57fd6fcf3f3"
export DOMAIN="rercloud.co.uk"
export DNS_ZONE="$ENV.$DOMAIN"
export RESOURCE_GROUP="ofg-$ENV-$FACING-aks-rg"
export INSTRUMENTATION_KEY=$(az keyvault secret show --name ofg-data-core-e-instrumentation-key --vault-name "ofg-data-core-kv" --query value -o tsv)
export DOTNETENVIRONMENT_NAME="DATA-E"
````

Then run the Makefile.

## TODO

1. Remove Network configuration when deploying to Ofgem Production.