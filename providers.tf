terraform {
  required_providers {
    rafay = {
      version = ">= 1.1.1"
      source  = "registry.terraform.io/RafaySystems/rafay"
    }
  }
}

variable "rafay_config_file" {
  description = "rafay provider config file for authentication"
  default     = "/Users/xunnainiangunjixunkaori1ri1/Documents/.my-system/rctl-darwin-amd64/Abhinav@Rafay-abhinav@rafay.co.json" # Download CLI config, from Rafay console under "My Tools"
  sensitive   = true
}

provider "rafay" {
  provider_config_file = var.rafay_config_file
}
