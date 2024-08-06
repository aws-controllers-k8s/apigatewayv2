{{/* The name of the application this chart installs */}}
{{- define "ack-apigatewayv2-controller.app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ack-apigatewayv2-controller.app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/* The name and version as used by the chart label */}}
{{- define "ack-apigatewayv2-controller.chart.name-version" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* The name of the service account to use */}}
{{- define "ack-apigatewayv2-controller.service-account.name" -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}

{{- define "ack-apigatewayv2-controller.watch-namespace" -}}
{{- if eq .Values.installScope "namespace" -}}
{{ .Values.watchNamespace | default .Release.Namespace }}
{{- end -}}
{{- end -}}

{{/* The mount path for the shared credentials file */}}
{{- define "ack-apigatewayv2-controller.aws.credentials.secret_mount_path" -}}
{{- "/var/run/secrets/aws" -}}
{{- end -}}

{{/* The path the shared credentials file is mounted */}}
{{- define "ack-apigatewayv2-controller.aws.credentials.path" -}}
{{ $secret_mount_path := include "ack-apigatewayv2-controller.aws.credentials.secret_mount_path" . }}
{{- printf "%s/%s" $secret_mount_path .Values.aws.credentials.secretKey -}}
{{- end -}}

{{/* The rules a of ClusterRole or Role */}}
{{- define "ack-apigatewayv2-controller.rbac-rules" -}}
rules:
- apiGroups:
  - ""
  resources:
  - configmaps
  verbs:
  - get
  - list
  - patch
  - watch
- apiGroups:
  - ""
  resources:
  - namespaces
  verbs:
  - get
  - list
  - watch
- apiGroups:
  - ""
  resources:
  - secrets
  verbs:
  - get
  - list
  - patch
  - watch
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - apimappings
  verbs:
  - create
  - delete
  - get
  - list
  - patch
  - update
  - watch
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - apimappings/status
  verbs:
  - get
  - patch
  - update
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - apis
  verbs:
  - create
  - delete
  - get
  - list
  - patch
  - update
  - watch
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - apis/status
  verbs:
  - get
  - patch
  - update
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - authorizers
  verbs:
  - create
  - delete
  - get
  - list
  - patch
  - update
  - watch
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - authorizers/status
  verbs:
  - get
  - patch
  - update
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - deployments
  verbs:
  - create
  - delete
  - get
  - list
  - patch
  - update
  - watch
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - deployments/status
  verbs:
  - get
  - patch
  - update
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - domainnames
  verbs:
  - create
  - delete
  - get
  - list
  - patch
  - update
  - watch
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - domainnames/status
  verbs:
  - get
  - patch
  - update
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - integrations
  verbs:
  - create
  - delete
  - get
  - list
  - patch
  - update
  - watch
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - integrations/status
  verbs:
  - get
  - patch
  - update
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - routes
  verbs:
  - create
  - delete
  - get
  - list
  - patch
  - update
  - watch
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - routes/status
  verbs:
  - get
  - patch
  - update
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - stages
  verbs:
  - create
  - delete
  - get
  - list
  - patch
  - update
  - watch
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - stages/status
  verbs:
  - get
  - patch
  - update
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - vpclinks
  verbs:
  - create
  - delete
  - get
  - list
  - patch
  - update
  - watch
- apiGroups:
  - apigatewayv2.services.k8s.aws
  resources:
  - vpclinks/status
  verbs:
  - get
  - patch
  - update
- apiGroups:
  - services.k8s.aws
  resources:
  - adoptedresources
  verbs:
  - create
  - delete
  - get
  - list
  - patch
  - update
  - watch
- apiGroups:
  - services.k8s.aws
  resources:
  - adoptedresources/status
  verbs:
  - get
  - patch
  - update
- apiGroups:
  - services.k8s.aws
  resources:
  - fieldexports
  verbs:
  - create
  - delete
  - get
  - list
  - patch
  - update
  - watch
- apiGroups:
  - services.k8s.aws
  resources:
  - fieldexports/status
  verbs:
  - get
  - patch
  - update
{{- end }}

{{/* Convert k/v map to string like: "key1=value1,key2=value2,..." */}}
{{- define "ack-apigatewayv2-controller.feature-gates" -}}
{{- $list := list -}}
{{- range $k, $v := .Values.featureGates -}}
{{- $list = append $list (printf "%s=%s" $k ( $v | toString)) -}}
{{- end -}}
{{ join "," $list }}
{{- end -}}
