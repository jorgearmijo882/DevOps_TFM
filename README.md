# Inventory DevSecOps Project

## Introducción
Este proyecto proporciona una solución integral basada en el enfoque DevSecOps, diseñada para automatizar la gestión segura de infraestructuras y aplicaciones multicapa. Es especialmente útil para equipos que buscan implementar prácticas modernas de desarrollo y operaciones utilizando herramientas open-source.

## Requisitos e instalación
Asegurarse de tener instaladas y configuradas las siguientes herramientas:
- [Docker] (https://docs.docker.com/get-docker/)
- [Java 17 & Maven] (https://openjdk.java.net/install/) (o Docker-based build)
- [Terraform CLI] (https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [Packer] (https://www.packer.io/downloads)
- [VirtualBox] (https://www.virtualbox.org/wiki/Downloads)
- Credenciales de AWS configuradas ([Guía AWS](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html))
- [Azure CLI] (https://docs.microsoft.com/cli/azure/install-azure-cli) y conexión de servicio Azure DevOps

## Estructura del proyecto
- `frontend/`: Interfaz HTML y JavaScript para usuarios.
- `backend/`: Servicio REST implementado con Spring Boot.
- `db/init.sql`: SQL script para inicializar PostgreSQL.
- `infra/packer/`: Plantillas Packer para generación automática de imágenes base.
- `infra/terraform/{virtualbox,aws,azure}`: Módulos de Terraform para diferentes plataformas.
- `azure-pipelines/`: Pipelines YAML para la integración y entrega continuaAzure DevOps.

## Como Ejecutar el Proyecto 
### Ejecución local en (VirtualBox)
1. Construir imagen base:
```
cd infra/packer`
packer build template.pkr.hcl
```
2. Aprovisionar infraestructura local:

```
cd ../terraform/virtualbox
 terraform init && terraform apply
```
3. Dentro de la MV, ejecutar Docker Compose:
   ```
   cd /vagrant
   docker-compose up -d
   ```

## Configuración de Variables y Credenciales
Configurar las credenciales y variables de entorno de forma segura mediante archivos `.env` o configuraciones específicas en Terraform y Azure DevOps.
   
## Pipeline CI/CD (Azure DevOps)
- `azure-pipelines/pipeline.yml`: define stages build, sast, release, provision, deploy.

## Despliegue en Cloud
### Despliegue en AWS
```
cd infra/terraform/aws
terraform init && terraform apply
```

### Despliegue en Azure
```
cd infra/terraform/azure
terraform init && terraform apply
```
## Troubleshooting
- **Terraform issues:** Verifica tu archivo `terraform.tfvars` y configuraciones de AWS o Azure.
- **Docker Compose:** Revisa que todos los servicios se encuentren corriendo con `docker-compose ps`.

## Buenas Prácticas
- Mantén todas las credenciales y secretos fuera del control de versiones.
- Revisa regularmente los reportes generados por herramientas de análisis estático y dinámico integradas en el pipeline.
- Documenta claramente cualquier cambio o ajuste realizado en los archivos de configuración.

## Diagrama Arquitectónico
