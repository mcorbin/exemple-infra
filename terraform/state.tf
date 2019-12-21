terraform {
  backend "s3" {
    bucket   = "mcorbin-example-infra-tf"
    key    = "mcorbin-example-infra.tfstate"
    region = "ch-gva-2"

    endpoint = "https://sos-ch-gva-2.exo.io"

    # Deactivate the AWS specific behaviours
    #
    # https://www.terraform.io/docs/backends/types/s3.html#skip_credentials_validation
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true

  }
}

provider "exoscale" {
  version = "~> 0.15"
  key = var.exoscale_api_key
  secret = var.exoscale_secret_key
}
