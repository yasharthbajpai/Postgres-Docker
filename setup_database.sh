#!/bin/bash
echo "Setting up children table in PostgreSQL..."
docker exec -i postgres17 psql -U postgres -d mydb < create_children_table.sql
echo "Database setup completed!" 