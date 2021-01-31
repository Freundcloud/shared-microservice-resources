# Introduction

This repo contains infrastructure as code to install Azure services to support the application.

These services include:

- Azure KeyVault
- Azure NSG
- Azure Storage Accounts


### Pre-requirements for running code locally

- kubectl
- azure cli
- jq
- envsubst
- terraform (< 13)

### Cluster

```bash
make $core
make $ENV-int
make $ENV-int-destory
```


## Index of repo

/environments = $ENV files

/images = plan .svg files for each environment

/pipelines = Azure Pipelines

/scripts = Shell script for creating SP for each environment

/modules = TF modules  ( not in use yet )