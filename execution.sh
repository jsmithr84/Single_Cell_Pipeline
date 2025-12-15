#!/bin/bash

# Function to display help
show_help() {
    echo "Usage: $0 [--process] [--help]"
    echo
    echo "Options:"
    echo "  --process      Look for unprocessed sample_data.h5ad in the data dir. Will output processed_data.h5ad."
    echo "  --help, -h     Display this help message and exit."
    echo
    echo "If --process is not specified, the script will attempt to run the visualization on processed_data.h5ad file."
    echo "The app requires 'processed_data.h5ad' to exist in the ./data/ directory."
    echo 
    exit 0
}

# Check for --help or -h as the first argument
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    show_help
fi

# Check if process flag is provided
if [ "$1" == "--process" ]; then
    # Run the processing pipeline
    python single_cell_processing.py
    python app.py
else
    # Check if processed data exists before running the app
    if [ ! -f "./data/processed_data.h5ad" ]; then
        echo "Error: 'data/processed_data.h5ad' not found. Please run with --process flag first."
        echo 
        exit 1
    fi

    # Run the dashboard app
    python app.py
fi
