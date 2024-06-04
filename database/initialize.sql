-- psql -d inventomao -f initialize.sql

-- connect database
\c inventomao

-- drop if exists
-- DROP TABLE IF EXISTS Inventory CASCADE;
-- DROP TABLE IF EXISTS RubberBandType CASCADE;
-- DROP TABLE IF EXISTS PackSize CASCADE;
-- DROP TABLE IF EXISTS SmallPackSize CASCADE;
-- DROP TABLE IF EXISTS InventorySection CASCADE;
-- DROP TABLE IF EXISTS Color CASCADE;
-- DROP TABLE IF EXISTS Users CASCADE;
-- DROP TABLE IF EXISTS Factory CASCADE;

-- create table
CREATE TABLE IF NOT EXISTS Users (
    user_id SERIAL PRIMARY KEY,
    oauth_id VARCHAR(255) UNIQUE NOT NULL,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role VARCHAR(20) DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Factory (
  id SERIAL PRIMARY KEY,
  factory_name VARCHAR(100) NOT NULL,
  city VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS RubberBandType (
  id SERIAL PRIMARY KEY,
  type_name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS PackSize (
  id SERIAL PRIMARY KEY,
  weight_g DECIMAL(5, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS SmallPackSize (
  id SERIAL PRIMARY KEY,
  weight_g DECIMAL(5, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS InventorySection (
  id SERIAL PRIMARY KEY,
  section VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Color (
  id SERIAL PRIMARY KEY,
  color_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Inventory (
  id SERIAL PRIMARY KEY,
  rubber_type_id INT REFERENCES RubberBandType(id),
  color_id INT REFERENCES Color(id),
  pack_size_id INT REFERENCES PackSize(id),
  small_size_id INT REFERENCES SmallPackSize(id),
  quantity INT NOT NULL,
  inventory_location INT REFERENCES InventorySection(id),
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);