#!/bin/bash
kubectl create secret generic azure-keyvault --from-file=../azurekeyvault.hcl --dry-run=client -o yaml > temp.yaml
kubeseal --format=yaml --cert=../../clusters/local-kind/pub-sealed-secrets.pem < temp.yaml > secrets/azurekeyvault-sealed.yaml
rm -f temp.yaml