/*
##############################################################################################################
										Create Database and Schemas
##############################################################################################################
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;
GO
-------------------------------------------------------
-- Drop and recreate the 'DataWarehouse' database
-------------------------------------------------------
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

/*
#######################################################
				Create DWH and DB
#######################################################
*/
-------------------------------------------------------
-- Create the 'DataWarehouse' database
-------------------------------------------------------
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO
/*
#######################################################
					Create Schemas
#######################################################
*/
-------------------------------------------------------
-- Creating Bronze schema for RAW Data
-------------------------------------------------------
CREATE SCHEMA bronze;
GO
-------------------------------------------------------
--Create Silevr schema for Clean and Structured Data
-------------------------------------------------------
CREATE SCHEMA silver;
GO
-------------------------------------------------------
--Create Silevr schema for Business ready data 
-------------------------------------------------------
CREATE SCHEMA gold;
GO

/*
##############################################################################################################
									End Create Database and Schemas
##############################################################################################################
*/