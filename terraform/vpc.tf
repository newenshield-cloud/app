module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.5.0"

  name = "newenshield-vpc-free"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  
  # Solo usamos subredes públicas para evitar el costo del NAT Gateway
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  # Garantizamos que los componentes de cobro estén apagados
  enable_nat_gateway = false
  single_nat_gateway = false

  enable_dns_hostnames = true
  enable_dns_support   = true
}
