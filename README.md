<h1 align="center">Monitoring Stack Helm Chart</h1>

---

## Установка

```bash
helm install monitoring-stack ./monitoring-stack -n monitoring-stack --create-namespace
```

---

## Кастомизация

```bash
helm upgrade --install monitoring-stack ./monitoring-stack \
	-n monitoring-stack \
	-f my-values.yaml
```
---

## Архитектура

- **Grafana**
- **Alertmanager**
- **VictoriaMetrics** (cluster mode)
- **PostgreSQL** (одна нода)

> ❗️ Без Patroni, используется обычный PostgreSQL

---

## Дерево файлов

```text
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
	 ├─ grafana-config-datasources.yaml
	 ├─ grafana-config-ini.yaml
	 ├─ grafana-db-init-job.yaml
	 ├─ grafana-deployment.yaml
	 ├─ grafana-home-dashboard.yaml
	 ├─ grafana-pvc.yaml
	 ├─ grafana-secret-db.yaml
	 ├─ grafana-service.yaml
	 # Alertmanager
	 ├─ alertmanager-configmap.yaml
	 ├─ alertmanager-service.yaml
	 ├─ alertmanager-statefulset.yaml
	 # VictoriaMetrics (cluster mode, minimal)
	 ├─ vm-vmagent-deployment.yaml
	 ├─ vm-vmagent-kubelet-rbac.yaml
	 ├─ vm-vmagent-scrape-config.yaml
	 ├─ vm-vmagent-service.yaml
	 ├─ vm-vmalert-deployment.yaml
	 ├─ vm-vmalert-service.yaml
	 ├─ vm-vminsert-statefulset.yaml
	 ├─ vm-vmselect-grafana-service.yaml
	 ├─ vm-vmselect-statefulset.yaml
	 ├─ vm-vmstorage-statefulset.yaml
	 # PostgreSQL
	 ├─ postgresql-deployment.yaml
	 ├─ postgresql-service.yaml
	 ├─ postgresql-pvc.yaml
	 # Ingress
	 ├─ ingress-grafana.yaml
	 ├─ ingress-vmagent.yaml
```

---

## Targets

Новые таргеты для сбора агентами добавляем в файл [`templates/vm-vmagent-scrape-config.yaml`](templates/vm-vmagent-scrape-config.yaml) по примеру в самом файле.