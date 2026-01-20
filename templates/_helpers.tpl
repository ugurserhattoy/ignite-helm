{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "ignite.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ignite.fullname" -}}
{{- $baseName := "" -}}
{{- if .Values.fullnameOverride -}}
{{- $baseName = .Values.fullnameOverride -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- $baseName = .Release.Name -}}
{{- else -}}
{{- $baseName = printf "%s-%s" .Release.Name $name -}}
{{- end -}}
{{- end -}}

{{- if .Values.fullnameSuffix -}}
{{- printf "%s-%s" $baseName .Values.fullnameSuffix | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $baseName | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ignite.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
