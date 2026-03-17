### Requirements

- Docker

### Setup Directus with Docker Compose

> **Disclaimer**: The initial setup will create an empty Directus instance without any collections or fields. You must manually import at least the schema snapshot (explained below) to configure the database structure properly.

To setup Directus with Docker Compose, run the following command from the root directory of this repository:
```bash
docker compose up -d
```

### Import Directus Snapshot

To import the Directus schema snapshot, copy the snapshot file to the container and apply it:

```bash
docker cp snapshot.yaml directus-app:/directus/snapshot.yaml
docker compose exec directus npx directus schema apply /directus/snapshot.yaml
```
### Import Database Data

To import the database data, copy your data file (e.g. `your_data.sql`) to the root of this repository and run the following command:

> **Note**: You can find the default database credentials (`db_user`, `db_name`, etc.) in the `docker-compose.yml` file under the `database` service.

```bash
docker exec -i directus-db psql -U db_user -d db_name < your_data.sql
```