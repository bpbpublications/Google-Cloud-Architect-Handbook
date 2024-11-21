import psycopg2

def connect_to_cloudsql(host, dbname, user, password):
    """Connects to a Cloud SQL PostgreSQL instance.

    Args:
      host: The host address of the Cloud SQL instance.
      dbname: The name of the database to connect to.
      user: The database user.
      password: The database password.
    """
    try:
        conn = psycopg2.connect(
            host=host,
            dbname=dbname,
            user=user,
            password=password
        )
        print("Connected to Cloud SQL instance!")

        # Perform database operations here
        cursor = conn.cursor()
        cursor.execute("SELECT version()")
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version}")

        cursor.close()
        conn.close()

    except Exception as e:
        print(f"Error connecting to Cloud SQL: {e}")

# Replace with your Cloud SQL instance details
host = "[CLOUD_SQL_HOST]"
dbname = "[DB_NAME]"
user = "[DB_USER]"
password = "[DB_PASSWORD]"

connect_to_cloudsql(host, dbname, user, password)
