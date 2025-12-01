#!/bin/bash

# Скрипт развертывания Grafana с PostgreSQL в Kubernetes
set -e

echo "🔧 Начало развертывания Grafana 12.3 с PostgreSQL..."

# Применяем секреты PostgreSQL
echo "📝 Применение секретов PostgreSQL..."
kubectl apply -f manifests/postgresql-secrets.yaml

# Применяем секреты Grafana
echo "📝 Применение секретов Grafana..."
kubectl apply -f manifests/grafana-secrets.yaml

# Развертываем PostgreSQL
echo "🐘 Развертывание PostgreSQL..."
kubectl apply -f manifests/postgresql-deployment.yaml
kubectl apply -f manifests/postgresql-service.yaml

# Ждем запуска PostgreSQL
echo "⏳ Ожидание запуска PostgreSQL..."
kubectl wait --for=condition=ready pod -l app=postgresql --timeout=120s

# Развертываем Grafana
echo "📊 Развертывание Grafana..."
kubectl apply -f manifests/grafana-deployment.yaml
kubectl apply -f manifests/grafana-service.yaml

# Ждем запуска Grafana
echo "⏳ Ожидание запуска Grafana..."
kubectl wait --for=condition=ready pod -l app=grafana --timeout=180s

# Показываем информацию о развертывании
echo "📊 Статус развертывания:"
echo ""
echo "📦 Поды:"
kubectl get pods -l 'app in (grafana,postgresql)'

echo ""
echo "🔌 Сервисы:"
kubectl get svc -l 'app in (grafana,postgresql)'

echo ""
echo "✅ Развертывание завершено!"
echo ""
echo "📢 Для доступа к Grafana:"
echo "   NodePort: 31000"
echo "🔑 Данные для входа в Grafana:"
echo "   Логин: admin"
echo "   Пароль: Admin123!"
echo ""
echo "🐘 Данные для подключения к PostgreSQL:"
echo "   Хост: postgresql-service"
echo "   Порт: 5432"
echo "   База данных: grafana"
echo "   Пользователь: grafana"
echo "   Пароль: GrafanaDB123!"