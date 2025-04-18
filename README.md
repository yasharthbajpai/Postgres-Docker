# PostgreSQL 17 Docker Example Project

A comprehensive Docker-based PostgreSQL 17 setup with Python integration, demonstrating database operations through a simple children's database example.

## 🚀 Features

- PostgreSQL 17 running in Docker
- Python database interaction examples
- Automated setup and management scripts
- Sample database schema and data
- Docker Compose configuration
- Easy-to-use shell scripts for management

## 📋 Prerequisites

- Docker and Docker Compose
- Python 3.x
- Git

## 🗂️ Project Structure

- `Dockerfile`: Configuration for PostgreSQL 17 Docker image
- `docker-compose.yml`: Docker Compose configuration for PostgreSQL
- `create_children_table.sql`: SQL script to create and populate a sample table
- `simple_read_children.py`: Python script to read from the database
- `simple_run.sh`: All-in-one script to run the entire process
- `requirements.txt`: Python dependencies (pg8000)
- `start-container.sh`: Script to start the PostgreSQL container
- `stop-container.sh`: Script to stop the PostgreSQL container

## 🚀 Quick Start

Run the all-in-one script which handles everything:

```bash
./simple_run.sh
```

## 🐳 Container Management

### Start the Container

```bash
./start-container.sh
```

### Stop the Container

```bash
./stop-container.sh
```

### Check Container Status

```bash
docker ps
```

## 🔧 Manual Setup

If you prefer to run each step manually:

1. Start the PostgreSQL container:
   ```bash
   docker compose up -d
   ```

2. Set up the database:
   ```bash
   docker exec -i postgres17 psql -U postgres -d mydb < create_children_table.sql
   ```

3. Install Python dependencies:
   ```bash
   pip install pg8000
   ```

4. Run the Python script:
   ```bash
   python simple_read_children.py
   ```

## 🔐 Database Connection Details

- Host: localhost
- Port: 5432
- Database: mydb
- Username: postgres
- Password: postgres

## 📊 Database Schema

The children table has the following structure:

| Column    | Type         | Description                     |
|-----------|-------------|---------------------------------|
| id        | SERIAL      | Primary key                     |
| name      | VARCHAR(100)| Child's name                    |
| age       | INTEGER     | Child's age (0-18)              |
| grade     | VARCHAR(20) | School grade                    |
| hobby     | VARCHAR(100)| Child's hobby                   |
| created_at| TIMESTAMP   | When the record was created     |

## 🤝 Contributing

Feel free to open issues and pull requests to improve the project.

## 📝 License

This project is open source and available under the MIT License.

## ⚠️ Important Notes

- Remember to never commit sensitive information like passwords to version control
- For production use, modify the default credentials
- The database data is stored in a Docker volume, so it persists between container restarts