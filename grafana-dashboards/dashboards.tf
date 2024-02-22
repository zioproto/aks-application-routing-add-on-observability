# https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/grafana/dashboards/nginx.json
resource "grafana_dashboard" "ingress_nginx_dashboard" {
  config_json = file("dashboards/nginx.json")
  overwrite = true
}

# https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/grafana/dashboards/request-handling-performance.json
resource "grafana_dashboard" "ingress_nginx_request_handling_performance_dashboard" {
  config_json = file("dashboards/request-handling-performance.json")
  overwrite = true
}