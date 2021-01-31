.ONESHELL:
SHELL=/bin/bash

.PHONY:
sbx-internal:
	rm -rf .terraform
	source ./environments/sbx/.env-int.sh
	terraform init -backend-config=./environments/sbx/backend-int.hcl
	terraform workspace select int
	terraform plan -var-file=./environments/sbx/int.tfvars -out=./plan/plan-sbx
	terraform graph -type=plan | dot -Tsvg > ./images/sbx-plan.svg
	terraform apply "./plan/plan-sbx"
sbx-exernal:
	rm -rf .terraform
	source ./environments/sbx/.env-ext.sh
	terraform init -backend-config=./environments/sbx/backend-ext.hcl
	terraform workspace select ext
	terraform plan -var-file=./environments/sbx/ext.tfvars -out=./plan/plan-sbx
	terraform graph -type=plan | dot -Tsvg > ./images/sbx-plan.svg
	terraform apply "./plan/plan-sbx"
sbx-destroy:
	source ./environments/sbx/.env-sbx.sh
	terraform destroy -var-file=./environments/sbx/sbx.tfvars
dev-internal:
	rm -rf .terraform
	source ./environments/dev/.env-int.sh
	terraform init -backend-config=./environments/dev/backend-int.hcl
	terraform workspace select int
	terraform plan -var-file=./environments/dev/int.tfvars -out=./plan/plan-dev
	terraform graph -type=plan | dot -Tsvg > ./images/dev-plan.svg
	terraform apply "./plan/plan-dev"
dev-exernal:
	rm -rf .terraform
	source ./environments/dev/.env-ext.sh
	terraform init -backend-config=./environments/dev/backend-ext.hcl
	terraform workspace select ext
	terraform plan -var-file=./environments/dev/ext.tfvars -out=./plan/plan-dev
	terraform graph -type=plan | dot -Tsvg > ./images/dev-plan.svg
	terraform apply "./plan/plan-dev"
dev-destroy:
	source ./environments/dev/.env-dev.sh
	terraform destroy -var-file=./environments/dev/dev.tfvars