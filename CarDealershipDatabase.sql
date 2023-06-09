-- Create the CarDealershipDatabase database
DROP DATABASE CarDealershipDatabase;
CREATE DATABASE CarDealershipDatabase;

USE CarDealershipDatabase;

-- dealerships
CREATE TABLE dealerships (
  dealership_id int AUTO_INCREMENT PRIMARY KEY,
  name varchar(50),
  address varchar(50),
  phone varchar(12)
);

-- Vehicles
CREATE TABLE vehicles (
  VIN varchar(17) PRIMARY KEY,
  make varchar(50),
  model varchar(50),
  year int,
  price decimal(10,2),
  SOLD boolean
);

-- inventory
CREATE TABLE inventory (
  dealership_id int,
  VIN varchar(17),
  FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
  FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- sales_contracts
CREATE TABLE sales_contracts (
  id int AUTO_INCREMENT PRIMARY KEY,
  contract_number varchar(20),
  VIN varchar(17),
  customer_name varchar(50),
  customer_phone varchar(12),
  sale_date date,
  FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- lease_contracts
CREATE TABLE lease_contracts (
  id int AUTO_INCREMENT PRIMARY KEY,
  contract_number varchar(20),
  VIN varchar(17),
  customer_name varchar(50),
  customer_phone varchar(12),
  lease_start_date date,
  lease_end_date date,
  FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
