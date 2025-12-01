-- Скрипт инициализации базы данных Grafana
-- Убедимся, что расширения доступны
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Создаем схему для Grafana (опционально)
CREATE SCHEMA IF NOT EXISTS grafana_schema;

-- Предоставляем права пользователю grafana
GRANT ALL PRIVILEGES ON DATABASE grafana TO grafana;
GRANT ALL PRIVILEGES ON SCHEMA grafana_schema TO grafana;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA grafana_schema TO grafana;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA grafana_schema TO grafana;

-- Настройка параметров базы данных для Grafana
ALTER DATABASE grafana SET search_path TO grafana_schema, public;
