terraform {
  required_providers {
    rafay = {
      source  = "RafaySystems/rafay"
      version = "1.1.22"
    }
  }
}

variable "rafay_config_file" {
  description = "rafay provider config file for authentication"
  default     = "/Users/xunnainiangunjixun/Downloads/Abhinav@Rafay-abhinav@rafay.co.json" # Download CLI config, from Rafay console under "My Tools"
  sensitive   = true
}

provider "rafay" {
  provider_config_file = var.rafay_config_file
}
