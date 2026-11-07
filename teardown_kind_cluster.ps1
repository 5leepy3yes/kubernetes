<<<<<<< HEAD
$ClusterName = "murmillo"

Write-Host "Destroying Kind cluster '$ClusterName'..." -ForegroundColor Red
kind delete cluster --name $ClusterName

=======
$ClusterName = "murmillo"

Write-Host "Destroying Kind cluster '$ClusterName'..." -ForegroundColor Red
kind delete cluster --name $ClusterName

>>>>>>> cluster-files
Write-Host "Lab destroyed." -ForegroundColor Green