$ClusterName = "murmillo"

Write-Host "Destroying Kind cluster '$ClusterName'..." -ForegroundColor Red
kind delete cluster --name $ClusterName

Write-Host "Lab destroyed." -ForegroundColor Green