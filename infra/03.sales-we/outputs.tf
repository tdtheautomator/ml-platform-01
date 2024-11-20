output "_ResourceGroupName" {
  value = module.resourcegroup.resource-group-name
}
output "_ResourceGroupLocation" {
  value = module.resourcegroup.resource-group-location
}

output "_OpenAIEndpoint" {
  value = module.openai.cognitive_account_endpoint
}
