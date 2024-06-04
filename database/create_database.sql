-- create database
DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_database
      WHERE datname = 'inventomao'
   ) THEN
      PERFORM dblink_exec('dbname=' || current_database(), 'CREATE DATABASE inventomao');
   END IF;
END
$do$;