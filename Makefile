ENVIRONMENT=staging

.PHONY: init plan validate apply destroy

all:  init  plan

# https://www.terraform.io/docs/cli/init/index.html
init:
	cd terraform/${ENVIRONMENT} && terraform init  -reconfigure

# https://www.terraform.io/docs/cli/commands/plan.html
plan:
	cd terraform/${ENVIRONMENT} && terraform plan

# https://www.terraform.io/docs/cli/commands/validate.html
validate:
	cd terraform/${ENVIRONMENT} && terraform validate

# https://www.terraform.io/docs/cli/commands/apply.html
apply:
	cd terraform/${ENVIRONMENT} && terraform apply -auto-approve

# https://www.terraform.io/docs/cli/commands/destroy.html
destroy:
	cd terraform/${ENVIRONMENT} && terraform destroy -auto-approve