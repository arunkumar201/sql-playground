# Use the official PostgreSQL image from the Docker Hub
FROM postgres:latest

ENV POSTGRES_USER=root
ENV POSTGRES_PASSWORD=password
ENV POSTGRES_DB=learning_sql

# Expose the default PostgreSQL port
EXPOSE 5432
