


##Cleanup

```
az group list --query [].name -o tsv | xargs -otl az group delete -y --no-wait -n
```

##Deploy

```
cd .\01.it-sea\
terraform init -upgrade
terraform apply -auto-approve -var-file .\secrets.tfvars -parallelism=100
```

```
cd .\02.hr-wus\
terraform init -upgrade
terraform apply -auto-approve -var-file .\secrets.tfvars -parallelism=100
```

```
cd .\03.sales-we\
terraform init -upgrade
terraform apply -auto-approve -var-file .\secrets.tfvars -parallelism=100
```