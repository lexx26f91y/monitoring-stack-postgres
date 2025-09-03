Установка
`helm install monitoring-stack ./monitoring-stack -n monitoring-stack --create-namespace`

Кастомизация

helm upgrade --install monitoring-stack ./monitoring-stack
-n monitoring-stack
-f my-values.yaml

Заменить пароли:
-- grafana.adminPassword
-- postgres.password

Архитектура
- Grafana, Alertmanager, VictoriaMetrics (cluster mode), PostgreSQL (одна нода)
- Без Patroni, используется обычный PostgreSQL

Дерево файлов:
monitoring-stack/
├─ Chart.yaml
├─ values.yaml
├─ README.md
└─ templates/
├─ _helpers.tpl
├─ namespace.yaml
# Istio
├─ istio-gateway.yaml
├─ vs-grafana.yaml
├─ vs-alertmanager.yaml
├─ vs-vmselect.yaml
# Grafana
├─ grafana-secret-db.yaml
├─ grafana-config-datasources.yaml
├─ grafana-config-ini.yaml
├─ grafana-pvc.yaml
├─ grafana-deployment.yaml
├─ grafana-service.yaml
# Alertmanager
├─ alertmanager-configmap.yaml
├─ alertmanager-statefulset.yaml
├─ alertmanager-service.yaml
# VictoriaMetrics (cluster mode, minimal)
├─ vm-vminsert-deployment.yaml
├─ vm-vmselect-deployment.yaml
├─ vm-vmstorage-statefulset.yaml
├─ vm-services.yaml
# PostgreSQL
├─ postgresql-deployment.yaml
├─ postgresql-service.yaml
├─ postgresql-pvc.yaml
├─ grafana-db-init-job.yaml