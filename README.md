# PostgreSQL Docker Setup

Dockerfile for setting up a PostgreSQL database locally using Docker.

## Prerequisites

- Docker installed on your machine.

## Getting Started

Follow these instructions to build and run the PostgreSQL Docker container.

### Build the Docker Image

1. Clone this repository to your local machine.
2. Navigate to the directory containing the Dockerfile.
3. Build the Docker image using the following command:

   ```bash
   docker build -t my-postgres-image .
   ```

### Run the Docker Container

1. Run a container from the image with the following command:

   ```bash
   docker run --name my-postgres-container -d -p 5432:5432 my-postgres-image
   ```

   - `--name my-postgres-container`: Names the running container.
   - `-d`: Runs the container in detached mode.
   - `-p 5432:5432`: Maps the container's port 5432 to the host's port 5432.

### Environment Variables

The following environment variables are set in the Dockerfile:

- `POSTGRES_USER`: The username for the PostgreSQL database (default: `root`).
- `POSTGRES_PASSWORD`: The password for the PostgreSQL database (default: `password`).
- `POSTGRES_DB`: The default database to be created (default: `learning_sql`).

### Accessing PostgreSQL

You can connect to the PostgreSQL database using any PostgreSQL client with the following credentials:

- **Host**: `localhost`
- **Port**: `5432`
- **Username**: `root`
- **Password**: `password`
- **Database**: `learning_sql`

### Stopping the Container

To stop the running container, use the following command:

```bash
docker stop my-postgres-container
```

### Removing the Container

To remove the container, use the following command:

```bash
docker rm my-postgres-container
```
