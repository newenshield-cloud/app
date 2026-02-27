terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuramos la región de AWS
provider "aws" {
  region = "us-east-1"
  
  default_tags {
    tags = {
      Project     = "NewenShield"
      Environment = "Production"
      ManagedBy   = "Terraform"
    }
  }
}
