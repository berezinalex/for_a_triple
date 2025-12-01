#!/bin/bash

# Скрипт удаления Grafana и PostgreSQL из Kubernetes
set -e

echo "🗑️  Удаление Grafana и PostgreSQL из Kubernetes..."

# Удаляем ресурсы Grafana
kubectl delete -f manifests/grafana-service.yaml --ignore-not-found
kubectl delete -f manifests/grafana-deployment.yaml --ignore-not-found
kubectl delete -f manifests/grafana-secrets.yaml --ignore-not-found

# Удаляем ресурсы PostgreSQL
kubectl delete -f manifests/postgresql-service.yaml --ignore-not-found
kubectl delete -f manifests/postgresql-deployment.yaml --ignore-not-found
kubectl delete -f manifests/postgresql-secrets.yaml --ignore-not-found

# Удаляем поды если остались
kubectl delete pod -l 'app in (grafana,postgresql)' --ignore-not-found

echo "✅ Grafana и PostgreSQL успешно удалены!"