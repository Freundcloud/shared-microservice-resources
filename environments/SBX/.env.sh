#!/bin/bash

az account set --subscription "089a59db-9910-4e4a-93ce-b557ad910bb2"

export ENV="sbx"
export DNS_ZONE="s.freundcloud.org.uk"
export CONTACT="olaf.freund@outlook.com"
export AKSNAME="aks-demo-$ENV"
export KEYVAULT="aks-demo-$ENV-lz-kv"