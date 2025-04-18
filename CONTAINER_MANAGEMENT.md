# Container Management Guide

## Starting the PostgreSQL Container

### Option 1: Using Docker Compose Directly
```bash
# Navigate to the directory containing docker-compose.yml
cd /path/to/your/project

# Start the container in detached mode
docker compose up -d
```

### Option 2: Using the Provided Script
```bash
# Navigate to the directory containing the script
cd /path/to/your/project

# Run the start script
./start-container.sh
```

## Stopping the PostgreSQL Container

### Option 1: Using Docker Compose Directly
```bash
# Navigate to the directory containing docker-compose.yml
cd /path/to/your/project

# Stop the container
docker compose down
```

### Option 2: Using the Provided Script
```bash
# Navigate to the directory containing the script
cd /path/to/your/project

# Run the stop script
./stop-container.sh
```

## Additional Commands

### Check Container Status
```bash
# List running containers
docker ps

# List all containers (including stopped ones)
docker ps -a
```

### View Container Logs
```bash
# View logs of the PostgreSQL container
docker logs postgres17

# Follow logs in real-time
docker logs -f postgres17
```

### Connect to PostgreSQL Database
```bash
# Connect to the PostgreSQL database
docker exec -it postgres17 psql -U postgres -d mydb
``` 