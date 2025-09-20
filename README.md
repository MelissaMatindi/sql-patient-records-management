# Patient Records Management System
A MySQL database mimicking an Electronic Health Record (EHR) system, managing patients, doctors, visits, medical histories, and medications. 


# Features #

robust constraints (PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE) and relationships (One-to-Many, Many-to-Many).

----

#  Files

- schema.sql: Creates database and tables.

- sample_data.sql: Adds sample records for testing.

- LICENSE: Project license details.

# Run Instructions

- Install MySQL  (e.g. MySQL Workbench).

- Execute: mysql -u root -p < schema.sql

- Execute:  mysql -u root -p < sample_data.sql

- Query:  SELECT * FROM Patients; to verify.

---------

## Notes

Built for  MySQL 8.0+ .


 Sample data:  2 patients, 2 doctors, 3 visits, 3 conditions, 3 medication links.

