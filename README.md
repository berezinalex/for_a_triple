# for_a_triple
deploy grafana in local kuber by BerezinAA 
или

Проект для развертывания Grafana версии 12.3 с PostgreSQL в локальном Kubernetes кластере.

Архитектура


Grafana │────▶│ PostgreSQL │

(12.3.0)│       (15-alpine) │

│NodePort:31000 │ ClusterIP:5432

Проект развёртывания веб приложения
grafana  используя grafana:12.3
и БД PostgreSQL

Доступ
Grafana
URL: http://localhost:31000 или http://<node-ip>:31000
Логин: admin
Пароль: Admin123!

PostgreSQL
Внутри кластера: postgresql-service:5432
База данных: grafana
Пользователь: grafana
Пароль: GrafanaDB123!