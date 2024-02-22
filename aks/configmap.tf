# https://learn.microsoft.com/en-us/azure/aks/app-routing-nginx-prometheus#enable-pod-annotation-based-scraping
resource "kubectl_manifest" "ama_metrics_settings_configmap" {
  yaml_body  = <<YAML
---
kind: ConfigMap
apiVersion: v1
metadata:
  name: ama-metrics-settings-configmap
  namespace: kube-system
data:
  schema-version:
    #string.used by agent to parse config. supported versions are {v1}. Configs with other schema versions will be rejected by the agent.
    v1
  config-version:
    #string.used by customer to keep track of this config file's version in their source control/repository (max allowed 10 chars, other chars will be truncated)
    ver1
  prometheus-collector-settings: |-
    cluster_alias = ""
  default-scrape-settings-enabled: |-
    kubelet = true
    coredns = false
    cadvisor = true
    kubeproxy = false
    apiserver = false
    kubestate = true
    nodeexporter = true
    windowsexporter = false
    windowskubeproxy = false
    kappiebasic = true
    prometheuscollectorhealth = false
  # Regex for which namespaces to scrape through pod annotation based scraping.
  # This is none by default. Use '.*' to scrape all namespaces of annotated pods.
  pod-annotation-based-scraping: |-
    podannotationnamespaceregex = ".*"
  default-targets-metrics-keep-list: |-
    kubelet = ""
    coredns = ""
    cadvisor = ""
    kubeproxy = ""
    apiserver = ""
    kubestate = ""
    nodeexporter = ""
    windowsexporter = ""
    windowskubeproxy = ""
    podannotations = ""
    kappiebasic = ""
    minimalingestionprofile = true
  default-targets-scrape-interval-settings: |-
    kubelet = "30s"
    coredns = "30s"
    cadvisor = "30s"
    kubeproxy = "30s"
    apiserver = "30s"
    kubestate = "30s"
    nodeexporter = "30s"
    windowsexporter = "30s"
    windowskubeproxy = "30s"
    kappiebasic = "30s"
    prometheuscollectorhealth = "30s"
    podannotations = "30s"
  debug-mode: |-
    enabled = false

YAML
}