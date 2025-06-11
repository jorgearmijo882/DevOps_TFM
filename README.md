# Inventory DevSecOps Project

## Requisitos
- Docker
- Java 17 & Maven (o Docker-based build)
- Terraform CLI
- Packer
- VirtualBox (for local)
- AWS credentials configured
- Azure CLI & DevOps service connection

## Estructura
- `frontend/`: HTML+JS UI.
- `backend/`: Spring Boot REST service.
- `db/init.sql`: SQL script para inicializar PostgreSQL.
- `infra/packer/`: Plantillas Packer para crear imagen base.
- `infra/terraform/{virtualbox,aws,azure}`: Terraform modules.
- `azure-pipelines/`: YAML pipeline para Azure DevOps.

## Ejecutar local (VirtualBox)
1. `cd infra/packer`
2. `packer build template.pkr.hcl`
3. `cd ../terraform/virtualbox`
4. `terraform init && terraform apply`
5. En VM, ejecutar Docker Compose:
   ```
   cd /vagrant
   docker-compose up -d
   ```

## Pipeline CI/CD (Azure DevOps)
- `azure-pipelines/pipeline.yml`: define stages build, sast, release, provision, deploy.

## Despliegue en AWS
1. `cd infra/terraform/aws`
2. `terraform init && terraform apply`

## Despliegue en Azure
1. `cd infra/terraform/azure`
2. `terraform init && terraform apply`
