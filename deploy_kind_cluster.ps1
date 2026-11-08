<#
.SYNOPSIS
  Builds a kind cluster
#>

$ClusterName = "murmillo"

Write-Host "Starting lab deployment..." -ForegroundColor Cyan

# Create the Kind Cluster
Write-Host "Building Kind cluster '$ClusterName'..."
kind create cluster --name $ClusterName --config config_kind_cluster.yaml

# Wait for nodes to be ready
Write-Host "Waiting for nodes to become ready..."
kubectl wait --for=condition=Ready nodes --all --timeout=120s

# Add Helm Repositories
Write-Host "Adding Helm repositories..."
helm repo add jenkins https://charts.jenkins.io
helm repo add zabbix https://zabbix-community.github.io/helm-zabbix
helm repo update

# Create Namespaces
Write-Host "Creating namespaces..."
kubectl create namespace jenkins
kubectl create namespace monitoring

# Deploy Jenkins
Write-Host "Deploying Jenkins via Helm..."
# Note: In a real setup, you would point to a custom values.yaml file here
#helm install jenkins jenkins/jenkins --namespace jenkins --set controller.serviceType=NodePort
helm install jenkins jenkins/jenkins -n jenkins -f jenkins_values.yaml

# Deploy Zabbix
Write-Host "Deploying Zabbix via Helm..."
helm upgrade --install zabbix zabbix/zabbix `
  --namespace monitoring `
  --set zabbixWeb.service.type=NodePort `
  --set zabbixWeb.service.nodePort=32080 `
  --set zabbixServer.service.type=NodePort `
  --set zabbixServer.service.nodePort=32051

Write-Host "Lab deployment complete!" -ForegroundColor Green
Write-Host "To get your Jenkins admin password, run:" -ForegroundColor Yellow
Write-Host "kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password; echo."