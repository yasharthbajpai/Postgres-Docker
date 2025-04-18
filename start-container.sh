#!/bin/bash
echo "Starting PostgreSQL container..."
docker compose up -d
echo "Container started successfully."
echo "To connect to the database, run: docker exec -it postgres17 psql -U postgres -d mydb" 