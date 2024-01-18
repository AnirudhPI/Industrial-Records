# Industrial-Records

## Introduction
This repository contains the database schema and queries for a manufacturing workflow system designed to streamline the process from raw materials to product delivery. It is intended for use within a manufacturing company to manage workers, machinery, raw materials, and product shipments.

## Database Schema Overview
The ER diagram illustrates the relationships and attributes of entities within our manufacturing workflow. It captures the essence of our operational model, focusing on workers, their roles, the machinery they operate, the products being manufactured, and the shipping details.

![ER Diagram](https://github.com/AnirudhPI/Industrial-Records/blob/main/ER%20Diagram.png "ER Diagram")

![Relationship Schema](https://github.com/AnirudhPI/Industrial-Records/blob/main/Relationship%20Schema.png ""Relationship Schema")

## Entities Description
- **WORKER**: Represents employees with attributes like ID (WID), name, address, skill level, and salary.
- **EMPLOYER**: Details the employers with attributes like employer name (ENAME) and designation.
- **MACHINERY**: Lists the machinery used in manufacturing, including machinery ID (MID), the number of shifts, and products per shift.
- **PRODUCT**: Contains details about the manufactured products such as product ID (PID), price, type, and quantity.
- **RAW MATERIAL**: Stores information about materials used, including material name, cost, and the related raw material ID (RID).
- **SHIPPING**: Manages shipping details, including order number, number of products, charges, and destination.

## Relationships
- **WORKS FOR**: A worker works for an employer. This is a many-to-one relationship as many workers can work for one employer.
- **SUPERVISES**: A worker may supervise none or many pieces of machinery.
- **UTILIZED BY**: Machinery utilizes various raw materials.
- **PRODUCES**: Machinery produces one type of product.
- **DELIVERED TO**: A product is delivered to a destination.

## Relationships and Keys
- Primary Keys (PK) are unique identifiers for the records in each table.
- Foreign Keys (FK) are used to link records between tables.
- The arrows indicate the direction of the relationship, showing which table contains the foreign key that references the primary key of another table.

## Constraints
- A worker can only work for one employer but can supervise multiple machines.
- Each machine can only produce one type of product but can utilize many raw materials.
- Each order can only be delivered to one destination.

## Database Design Decisions
The design decisions, such as the one-to-many relationship between `MACHINERY` and `RAW MATERIAL`, were made to reflect the realistic operational capabilities of the machinery and the consumption of raw materials.

## Use Cases
- Tracking the productivity of workers based on the machinery they operate.
- Managing inventory levels of raw materials and finished products.
- Organizing shipment details for products.

## Getting Started
To set up the database:
1. Ensure that MySQL is installed.
2. Clone this repository to your local machine.
3. Execute the SQL scripts provided to create the database schema.