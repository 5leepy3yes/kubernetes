<#
.SYNOPSIS
  Builds a kind cluster
#>

$ClusterName = "murmillo"

Write-Host "Starting lab deployment..." -ForegroundColor Cyan

# 1. Create the Kind Cluster
Write-Host "Building Kind cluster '$ClusterName'..."
kind create cluster --name $ClusterName --config config_kind_cluster.yaml

# 2. Wait for nodes to be ready
Write-Host "Waiting for nodes to become ready..."
kubectl wait --for=condition=Ready nodes --all --timeout=120s

# 3. Add Helm Repositories
Write-Host "Adding Helm repositories..."
helm repo add jenkins https://charts.jenkins.io
helm repo update

# 4. Create Namespaces
Write-Host "Creating namespaces..."
kubectl create namespace jenkins

# 5. Deploy Jenkins
Write-Host "Deploying Jenkins via Helm..."
# Note: In a real setup, you would point to a custom values.yaml file here
#helm install jenkins jenkins/jenkins --namespace jenkins --set controller.serviceType=NodePort
helm install jenkins jenkins/jenkins -n jenkins -f jenkins_values.yaml

Write-Host "Lab deployment complete!" -ForegroundColor Green
Write-Host "To get your Jenkins admin password, run:" -ForegroundColor Yellow
Write-Host "kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password; echo."