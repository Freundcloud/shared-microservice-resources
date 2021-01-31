.ONESHELL:
SHELL=/bin/bash

.PHONY:
sbx:
	rm -rf .terraform
	source ./environments/sbx/.env-int.sh
	terraform init -backend-config=./environments/sbx/backend-int.hcl
	terraform workspace select int
	terraform plan -var-file=./environments/sbx/int.tfvars -out=./plan/plan-sbx
	terraform graph -type=plan | dot -Tsvg > ./images/sbx-plan.svg
	terraform apply "./plan/plan-sbx"
sbx-destroy:
	source ./environments/sbx/.env-sbx.sh
	terraform destroy -var-file=./environments/sbx/sbx.tfvars