{{- define "monitoring.labels" -}}
app.kubernetes.io/name: {{ include "monitoring.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: Helm
{{- end -}}

{{- define "monitoring.name" -}}
monitoring-stack
{{- end -}}