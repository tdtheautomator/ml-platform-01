resource "databricks_notebook" "notebook" {
  for_each = var.notebooks == null ? {} : var.notebooks
  provider = databricks.target_databricks_ws
  content_base64 = base64encode(each.value.content)
  path = each.value.path
  language = each.value.language
}