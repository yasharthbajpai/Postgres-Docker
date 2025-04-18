# Children Database Application

This application demonstrates how to create and read from a PostgreSQL database running in Docker.

## Components

1. **PostgreSQL Database**: Runs in a Docker container
2. **Database Schema**: Includes a `children` table with sample data
3. **Python Reader**: A script to read and display data from the database

## Files

- `docker-compose.yml`: Docker compose configuration for PostgreSQL
- `Dockerfile`: Custom PostgreSQL 17 image definition
- `create_children_table.sql`: SQL script to create and populate the children table
- `setup_database.sh`: Script to set up the database schema and sample data
- `read_children_data.py`: Python script to read and display data from the database
- `requirements.txt`: Python dependencies
- `run_children_app.sh`: Wrapper script to run everything in one go

## Quick Start

Run the all-in-one script that:
1. Starts the PostgreSQL container if not running
2. Sets up the database schema and sample data
3. Installs Python dependencies if needed
4. Runs the Python script to read data

```bash
./run_children_app.sh
```

## Manual Steps

If you prefer to run each step manually:

1. Start the PostgreSQL container:
   ```bash
   ./start-container.sh
   ```

2. Set up the database:
   ```bash
   ./setup_database.sh
   ```

3. Install Python dependencies:
   ```bash
   pip3 install -r requirements.txt
   ```

4. Run the Python script:
   ```bash
   python3 read_children_data.py
   ```

## Database Schema

The children table has the following structure:

| Column    | Type         | Description                     |
|-----------|-------------|---------------------------------|
| id        | SERIAL      | Primary key                     |
| name      | VARCHAR(100)| Child's name                    |
| age       | INTEGER     | Child's age (0-18)              |
| grade     | VARCHAR(20) | School grade                    |
| hobby     | VARCHAR(100)| Child's hobby                   |
| created_at| TIMESTAMP   | When the record was created     |

## Python Script

The Python script connects to the database and:
1. Executes a SQL query to fetch all children records
2. Creates a pandas DataFrame with the results
3. Displays the data in a formatted table
4. Shows the total number of records 