#!/bin/bash

#rer-sbox-pipeline-sp
export ENV="dev"
export FACING="e"
export DOMAIN="rercloud.co.uk"
export DNS_ZONE="$ENV.$DOMAIN"
export CONTACT="olaf@freundcloud.com"
export AKSNAME="ofg-$ENV-$FACING-aks"
export KEYVAULT="ofg-dev-core-kv"