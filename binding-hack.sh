#!/bin/bash

B64_URL=$(ibmcloud resource service-key "cloudant-health-creds" --output json | jq .[0].credentials.url -j | base64 -w 0)

cat <<EOF | oc apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: cloudant-binding
  namespace: <my_project>
type: Opaque
data:
  url: $B64_URL
EOF
