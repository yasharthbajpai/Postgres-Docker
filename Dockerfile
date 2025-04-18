FROM postgres:17

# If you need custom PostgreSQL configurations, you can add them here
# COPY postgresql.conf /etc/postgresql/postgresql.conf
# CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]

# Expose port
EXPOSE 5432 