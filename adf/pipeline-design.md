# Azure Data Factory Pipeline

## Pipeline Name

PL_Sales_API_Ingestion

## Objective

Ingest sales data from a REST API and load the data into Azure
Blob Storage and Azure SQL Database.

## Pipeline Flow

REST API
    ↓
Copy Activity
    ↓
Azure Blob Storage
    ↓
Data Transformation
    ↓
Azure SQL Database
    ↓
Power BI

## ADF Components

### 1. REST API Source

The pipeline retrieves sales/order data from a REST API.

### 2. Copy Activity

The API response is copied into Azure Blob Storage.

### 3. Storage Layer

Raw data is stored in a raw container before transformation.

### 4. Transformation

Data is cleaned and validated before loading into the curated layer.

### 5. Azure SQL

Curated data is loaded into dimensional tables and fact tables.

## Error Handling

The production-oriented design includes:

- Retry configuration
- Failure paths
- Pipeline monitoring
- Data validation
- Logging
- Failed-record handling

## Incremental Loading

The pipeline can be extended to support incremental loading
using a watermark such as LastModifiedDate or OrderDate.
