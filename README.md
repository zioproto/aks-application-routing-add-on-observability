# Run Terraform

```
cd aks
terraform init -upgrade
terraform apply
cd ../grafana-dashboards
export TF_VAR_url=$(az grafana list -g testing-observability-rg -o json | jq -r '.[0].properties.endpoint')
export GRAFANA_NAME=$(az grafana list -g testing-observability-rg -o json | jq -r '.[0].name')
export TF_VAR_token=$(az grafana api-key create --key `date +%s` --name $GRAFANA_NAME -g testing-observability-rg -r editor --time-to-live 4m -o json | jq -r .key)
terraform init -upgrade
terraform apply
```

## Observability

Access the Grafana dashboard:

```
az grafana list -g testing-observability-rg -o json | jq '.[0].properties.endpoint'
```

And point your browser to the URL displayed by this command.

The identity that created the infrastructure with Terraform is configured as Grafana Admin.

