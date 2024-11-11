


##Cleanup

```
az group list --query [].name -o tsv | xargs -otl az group delete -y --no-wait -n
```