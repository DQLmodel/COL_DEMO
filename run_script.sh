#!/bin/bash


echo " Uploading metadata to DQLABS"

# Define variables
API_URL="https://cloud.demo3.dqlabsai.net/api/connection/upload/?domain=cx"
CLIENT_ID="XoXuqFEnn9snVlmPIGCpN2NwslYm0V8x26V+vzEq0/VOFpAsnvAYU3OqWdZtUvwD"
CLIENT_SECRET="sLRb28RCjPlSCENgQv732gD7P2XGwUZSa/Q4TCpOFSM5j94BzCxzBvhYFnVUVgHVTguhflHLRdJkySTgxpP7LseZYwT0GA9CEilHrvb3fRo="
CONNECTION_DATA='{
    "connection_name": "Colgate_Demo",
    "connection_type": "dbt"
}'

# Execute the curl request
curl -v -X POST "$API_URL" \
    -F 'manifest=@target/manifest.json' \
    -F 'run_results=@target/run_results.json' \
    -F 'catalog=@target/catalog.json' \
    -F "connection_data=$CONNECTION_DATA" \
    -H "client_id: $CLIENT_ID" \
    -H "client_secret: $CLIENT_SECRET"

# Check if curl was successful
if [[ $? -eq 0 ]]; then
    echo "Metadata uploaded successfully."
else
    echo "Curl request failed."
    exit 1
fi
