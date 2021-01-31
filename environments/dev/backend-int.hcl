# use this in pipelines like this:
# terraform init -backend-config=backend.hcl
storage_account_name = "devtf48dsg7"
container_name       = "shared-tfstate"
key                  = "shared-dev-int-terraform.tfstate"
resource_group_name  = "ofg-dev-tfstate-rg"