#!/bin/bash

# Retail Sales Pipeline Runner Script
# This script runs the dbt pipeline with proper environment setup

set -e  # Exit on any error

# Configuration
PROJECT_NAME="snowflake_project"
LOG_DIR="logs"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOG_FILE="${LOG_DIR}/pipeline_${TIMESTAMP}.log"

# Create logs directory if it doesn't exist
mkdir -p $LOG_DIR

# Function to log messages
log_message() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a $LOG_FILE
}

# Function to run dbt command with error handling
run_dbt_command() {
    local command="$1"
    local description="$2"
    
    log_message "Running: $description"
    log_message "Command: $command"
    
    if eval "$command" >> $LOG_FILE 2>&1; then
        log_message "SUCCESS: $description completed"
    else
        log_message "ERROR: $description failed"
        exit 1
    fi
}

# Main execution
main() {
    log_message "Starting Retail Sales Pipeline"
    log_message "Project: $PROJECT_NAME"
    log_message "Timestamp: $TIMESTAMP"
    log_message "Target Schema: DQLABS_QA.ZTEST"
    
    # Change to project directory
    cd "$(dirname "$0")/.."
    
    # Install dependencies
    run_dbt_command "dbt deps" "Installing dbt dependencies"
    
    # Run staging models
    run_dbt_command "dbt run --select tag:staging" "Running staging models"
    
    # Test staging models
    run_dbt_command "dbt test --select tag:staging" "Testing staging models"
    
    # Run mart models
    run_dbt_command "dbt run --select tag:marts" "Running mart models"
    
    # Test mart models
    run_dbt_command "dbt test --select tag:marts" "Testing mart models"
    
    # Generate documentation
    run_dbt_command "dbt docs generate" "Generating documentation"
    
    # Check source freshness
    run_dbt_command "dbt source freshness" "Checking source freshness"
    
    log_message "Pipeline completed successfully!"
    log_message "Log file: $LOG_FILE"
    log_message "Tables created in: DQLABS_QA.ZTEST"
}

# Run main function
main "$@" 