---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
---

{{ range $.Site.Data.repositories }}
   {{ partial "repositories.html" . }}
{{ end }}