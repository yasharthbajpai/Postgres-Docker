#!/bin/bash

echo "===== CHILDREN DATABASE RUNNER ====="
echo "1. Checking if container is running..."

# Check if container is running, if not start it
if ! docker ps | grep -q postgres17; then
    echo "   Container not running. Starting PostgreSQL container..."
    ./start-container.sh
    # Wait for container to fully start
    echo "   Waiting for PostgreSQL to initialize..."
    sleep 5
else
    echo "   PostgreSQL container is already running."
fi

echo "2. Setting up database tables..."
./setup_database.sh

echo "3. Installing Python dependencies if needed..."
if ! python3 -c "import pg8000" 2>/dev/null; then
    echo "   Installing requirements..."
    pip3 install -r requirements.txt
else
    echo "   Dependencies already installed."
fi

echo "4. Running Python script to read data..."
python3 read_children_data.py

echo "===== DONE =====" 