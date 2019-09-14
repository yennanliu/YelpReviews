## Step by step DB migration 

### STEP 1) migration init 
```bash 
$ alembic init --template generic ddl
```

### STEP 2) update db connection creds
```bash
$ nano +18 alembic.ini
```

### STEP 3) create the tables
```bash
$ alembic revision -m "create table business"
$ alembic revision -m "create table checkin"
$ alembic revision -m "create table tip"
$ alembic revision -m "create table user"
$ alembic revision -m "create table review"
```

### STEP 4) run migration (upgrade)
```bash 
$ alembic upgrade head
```
### STEP 5) run migration (downgrade) (in cases)
```bash
$ alembic downgrade -1
```

