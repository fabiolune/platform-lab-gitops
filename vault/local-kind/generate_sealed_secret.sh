#!/bin/bash
kubectl create secret generic azure-keyvault \
    --from-literal=azurekeyvault.hcl="`cat ../azurekeyvault.template.hcl | sed s/__tenant_id__/$(cat .tenant_id)/i | sed s/__client_id__/$(cat .client_id)/i | sed s/__client_secret__/$(cat .client_secret)/i | sed s/__subscription_id__/$(cat .subscription_id)/i | sed s/__vault_name__/$(cat .vault_name)/i | sed s/__key_name__/$(cat .key_name)/i `" \
    --dry-run=client -o yaml | \
    kubeseal --format=yaml --cert=../../clusters/local-kind/pub-sealed-secrets.pem > secrets/azurekeyvault-sealed.yaml