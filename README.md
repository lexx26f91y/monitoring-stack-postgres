Установка
`helm install monitoring-stack ./monitoring-stack -n monitoring-stack --create-namespace`

Кастомизация 
```
helm upgrade --install monitoring-stack ./monitoring-stack \
-n monitoring-stack \
-f my-values.yaml
```
Заменить пароли:
-- grafana.adminPassword
-- patroni.superuser.password
-- patroni.replication.password
-- patroni.grafanaDb.password


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
├─ vs-prometheus.yaml
├─ vs-alertmanager.yaml
├─ vs-vmselect.yaml
# Grafana
├─ grafana-secret-db.yaml
├─ grafana-config-datasources.yaml
├─ grafana-config-ini.yaml
├─ grafana-pvc.yaml
├─ grafana-deployment.yaml
├─ grafana-service.yaml
# Prometheus
├─ prometheus-configmap.yaml
├─ prometheus-statefulset.yaml
├─ prometheus-service.yaml
# Alertmanager
├─ alertmanager-configmap.yaml
├─ alertmanager-statefulset.yaml
├─ alertmanager-service.yaml
# VictoriaMetrics (cluster mode, minimal)
├─ vm-vminsert-deployment.yaml
├─ vm-vmselect-deployment.yaml
├─ vm-vmstorage-statefulset.yaml
├─ vm-services.yaml
# Patroni / PostgreSQL
├─ patroni-rbac.yaml
├─ patroni-configmap.yaml
├─ patroni-secrets.yaml
├─ patroni-statefulset.yaml
├─ patroni-services.yaml
├─ patroni-pvc.yaml
├─ grafana-db-init-job.yaml





