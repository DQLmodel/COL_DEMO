#!/bin/bash

# Run dbt
echo "Running dbt..."
dbt run --select snowflake_project


echo "dbt run completed. Uploading metadata via curl..."

# Define variables
API_URL="https://backendqa.dqlabsai.net/api/connection/upload/?domain=sut"
CLIENT_ID="QBYyRosTb6xS42OM4XetUL2LWd2o+ZhcAdOzHPJdYQ3qPS6RXg6rgA1GpdkPg6Au"
CLIENT_SECRET="gcTg3Ogcq5oszPHIwaNhctgeJAjwkjwfo9WbAkrH3/z1tLDXE0g77zAiiMzEOXgaHOANfGzY1jzLlY5Wm7aQzAKR9dkh4OX2sgzW/hen+D0="
CONNECTION_DATA='{
    "connection_name": "martin_test",
    "connection_type": "dbt",
    "project_name": "snowflake_project"
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
