helm repo add kedacore https://kedacore.github.io/charts

helm repo update

helm install -n keda --create-namespace -f values-keda.yml keda kedacore/keda
