Docker image for [schemup](https://github.com/tmtxt/schemup)

# Usage

- Create a `schema` folder.
- Create the `db.json` for database connection info

```json
{
	"database": "test_2",
	"user": "tmtxt",
	"password": "123456",
	"host": "localhost",
	"port": 5432
}
```

- Create folder `migrations` inside `schema` folder.
- Inside `migrations` folder, create migration yaml files, each file corresponds to one table
- The content of each file is similar to this

```yaml
table: account  # this is the table name
from: null      # first version starts from null
to: account_1   # version name
sql: |
  CREATE TABLE warp_avatar (
    id SERIAL NOT NULL PRIMARY KEY,
    email VARCHAR,
    password VARCHAR,
    UNIQUE(email)
  );

---
table: account  # this is the table name
from: account_1 # start from previous version
to: account_2   # migration to next version
sql: |
  ALTER TABLE warp_avatar ADD COLUMN test integer;

---
table: account  # this is the table name
from: account_2 # start from previous version
to: account_3   # migration to next version
sql: |
  ALTER TABLE warp_avatar ADD COLUMN test2 integer;
```

- Create one file `versions.json` inside `schema` folder. That file contains the versions you want to
migrate

```json
{
  "account": "account_2",
  "product": "product_3"
}
```

- Commit changes to the database with this command

```
$ docker run -v ./schema:/schemup:v0.0.3 schemup schemup commit
```
