terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
      version = "1.36.1"
    }
  }
  required_version = ">= 1.1.0"
}

# https://learn.microsoft.com/en-gb/azure/managed-grafana/how-to-api-calls
provider "grafana" {
  # export TF_VAR_url=$(az grafana show -g istio-aks -n istio-grafana -o json | jq -r .properties.endpoint)
  url = var.url

  # To obtain the token, you can use the following command:
  # TF_VAR_token=$(az grafana api-key create --key `date +%s` --name istio-grafana -g istio-aks -r editor --time-to-live 4m -o json | jq -r .key)
  auth = var.token
}
