import mlflow.deployments
import json
client = mlflow.deployments.get_deploy_client("databricks")
from dotenv import load_dotenv
load_dotenv()

completions_response = client.predict(
    endpoint="sales-westeurope",
    inputs={
        "prompt": "What is Databricks?",
        "temperature": 0.1,
        "max_tokens": 10,
        "n": 2
    }
)

print(json.dumps(completions_response, indent=4))