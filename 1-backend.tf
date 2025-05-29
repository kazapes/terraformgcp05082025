# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket      = "sundaymorning0502025"
    prefix      = "terraform/state"
    credentials = "kazapes1-d5061cf53f9a.json"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
