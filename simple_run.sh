#!/bin/bash

echo "===== SIMPLIFIED CHILDREN DATABASE RUNNER ====="

# Check if container is running
if ! docker ps | grep -q postgres17; then
    echo "Starting PostgreSQL container..."
    docker compose up -d
    sleep 5
else
    echo "PostgreSQL container is already running."
fi

# Setup database
echo "Setting up children table..."
docker exec -i postgres17 psql -U postgres -d mydb < create_children_table.sql

# Install Python dependency if needed
if ! python3 -c "import pg8000" 2>/dev/null; then
    echo "Installing pg8000..."
    pip3 install pg8000
fi

# Run the script
echo "Reading from database..."
python3 simple_read_children.py 