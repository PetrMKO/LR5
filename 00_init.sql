create user replicator with replication encrypted password 'replicator_password';
select pg_create_physical_replication_slot('replication_slot');

CREATE TABLE test_table (id SERIAL PRIMARY KEY, number INTEGER);
CREATE TABLE another_table (id SERIAL PRIMARY KEY, name TEXT);

INSERT INTO test_table (number)
    VALUES (10), (9), (8), (7), (6);

INSERT INTO another_table (name)
    VALUES ('one'), ('two'), ('three'), ('four'), ('five');

create user first_zombie with encrypted password 'pass';
create user second_zombie with encrypted password 'pass';

create role zombie;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO zombie;

GRANT zombie to first_zombie;
GRANT zombie to second_zombie;