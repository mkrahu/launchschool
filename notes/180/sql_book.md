
### SQL & Relational Databases

#### Databases

Database: A structured system for storing data
Table: List of individual but related entries
Rows: Single set of related data
Column: Standardize format for storing a particular attribute

RDBMS: Relational database management system
- software application for managing relational databases
- many different flavors of RDBMS: Oracle, MySQL, PostgreSQL, SQLite

Relational database: A database that stores data via the relational model, it defines different relations(tables) and the relationships between them (how they are interrelated). Relational databases cut down on the duplication of data and provide a structures organization. Other database models exist, including 'NoSQL' varieties.

#### SQL

SQL: Structured Query Language

SQL is a declarative language, meaning you describe what you want done in the SQL language (not how to do it). How the query is processed is up to the implementation of the individual RDBMS you use.

#### Definitions from book

Relational Database: A structured collection of data that follows the relational model.
RDBMS: Relational Database Management System. A software application for managing relational databases, such as PostgreSQL.
Relation: A set of individual but related data entries; analogous to a database table.
SQL Structured Query Language: The language used by RDBMSs.
SQL Statement: A SQL command used to access/use the database or the data within that database via the SQL language.
SQL query: A subset of a "SQL Statement". A query is a way to search, or lookup data within a database, as opposed to updating or changing data.

### Interacting with a database

Many interfaces exist for interacting with a database. They can vary from a CLI (Command Line Interface) to a full-featured GUI. All these interfaces will still use similar underlying commands to interact with the database and underlying tables/data and receive responses with the result of the request.

#### PostgreSQL

PostgreSQL comes with a variety of client applications for interacting with the database from the command line:
* createdb - Create a database
* dropdb - Delete a database
* pg_dump - Backup the database via a datadump
* pg_restore - Restore a database via a datadump
* pg_bench - *** Lookup

The most common client application for interacting with a Postgres database is the `psql` client (PostgreSQL interactive console). This opens up a command interface connected to a database server where you can submit SQL commands directly and see the results in a terminal window.

`psql` comes loaded with a variety of non-SQL commands known as meta-commands. These can do everything from connecting to a new database, loading table data from a file on the filesystem, or viewing the schema for a particular table.

The `psql` terminal is also called the `psql console`. The `psql` console's prompt will be the database that you are connected to followed by the # sign. When creating SQL statements the prompt will change to notify you that you are within a open parenthesis that needs to be closed before the statement can be executed.

#### SQL Sub-Languages

SQL statements (commands) fall into one of three categories (although sometimes the lines are blurry).

DDL: Data Definition Language. Used to define the structure of a database and the tables and columns within it.
DML: Data Manipulation Language. Used to retrieve or modify data stored in a database. SELECT queries are part of DML.
DCL: Data Control Language. Used to determine what various users are allowed to do when interacting with a database.

#### SQL Basics

Create a database:
* `createdb databasename` from terminal
* `CREATE DATABASE database_name`

Connect to a database:
`psql -d database_name`
`\c database_name`

Delete a database:
`dropdb databasename` from terminal
`DROP DATABASE database_name`

Execute commands from a file:
`psql -d database_name < file_name.sql` from terminal
`\i file_name`

#### Data vs. Schema

Schema is concerned with the structure of a database. This structure is defined by things such as the names of tables and table columns, the data types of those columns and any constraints that they may have. You use the DDL language to alter the database schema.

Data is concerned with the contents of a database. These are the actual values associated with specific rows and columns in a database table. You use the DML language to alter the data of the database.

Schema and data work together in order to let us interact with a database in useful ways. Schema without data would just be a bunch of empty tables. If we had data without schema, we'd be back to the idea of unstructured data we discussed in the opening chapter of this book.

Schema includes the security (access and permissions  ) setup for a particular database/table using the DCL SQL sub-language, this provides rules for what types of actions different users may take on the database.

#### PSQL meta-commands
`\c(onnect)` Connect to a database
`\l(ist)` List the databases
`\d` List all tables/sequences/indexes, use with specific relation name to see schema
`\dt` List tables only
`\ds` List sequences only
`\di` List indexes only

### Creating databases

`CREATE DATABASE database_name` is used, additional parameters can be provided when a database is being created otherwise the default settings are used.

Database names should be snake_case by convention.

When connecting to a database you can use the `\c` command, in a local environment this only requires the database name to make a connection, however if you are working with a remote database you may need to provide additional parameters such as the host, port, etc.

### Creating Tables

Tables (or relations) are the foundational structure of our database, they can be used to create abstract real-world items/business logic into a formal setting where we can store particular pieces of information about those topics.

`CREATE TABLE table_name ()` used for creating a table. Column names and data type are required for the creation of each column, keys and constraints are optional.

```SQL
CREATE TABLE table_name (
  column_1_name column_1_data_type [constraints, ...],
  column_2_name column_2_data_type [constraints, ...],
  .
  .
  .
  constraints
);
```

#### Data types

Main data types;
* serial: This data type is used to create identifier columns for a PostgreSQL database. These identifiers are integers, auto-incrementing, and cannot contain a null value.

* char(N): This data type specifies that information stored in a column can contain strings of up to N characters in length. If a string less than length N is stored, then the remaining string length is filled with space characters.

# varchar(N): This data type specifies that information stored in a column can contain strings of up to N characters in length. If a string less than length N is stored, then the remaining string length isn't used.

* boolean: This is a data type that can only contain two values "true" or "false". In PostgreSQL, boolean values are often displayed in a shorthand format, t or f

* integer or INT: An integer is simply a "whole number." An example might be 1 or 50, -50, or 792197 depending on what storage type is used.

* decimal(precision, scale): The decimal type takes two arguments, one being the total number of digits in the entire number on both sides of the decimal point (the precision), the second is the number of the digits in the fractional part of the number to the right of the decimal point (the scale).

* timestamp: The timestamp type contains both a simple date and time in YYYY-MM-DD HH:MM:SS format.

* date: The date type contains a date but no time.

* text

* numeric

#### Key and Constraints

Keys and constraints (along with data types) are what allow a table to control the type of data that is inserted into a particular column/row. These constraints are a key part of making sure that a database remains reliable and maintains data integrity.

Contraints can be two types, table constraint or column constraints. Common constraints are:

* UNIQUE: Prevents duplicate values from being added. This also creates an index for efficiently tracking whether values are unique and retrieving them from the database.
* NOT NULL: Prevents empty(null) values from being stored.
* DEFAULT: Set a default value (or function) for setting a default value when a value for a particular column is not provided at creation.

Contraints and keys are sometimes called 'properties' of a particular column.

`serial` is a special data type available in PostgreSQL. It uses the integer data type along with a DEFAULT constraint and a function called nextval which keeps a track of the current highest value and increments this by one to be used as the next value.

### Altering Tables

Use `ALTER TABLE` command for altering existing tables. Syntax can differ for the type of change you are making but broadly it is as follows:

```SQL
ALTER TABLE table_to_change HOW TO CHANGE THE TABLE additional arguments;
```

Rename a table:
`ALTER TABLE table_name RENAME TO new_table_name;`

Rename a column:
`ALTER TABLE table_name RENAME COLUMN column_name TO new_column_name;`

Change column data type:
`ALTER TABLE table_name ALTER COLUMN column_name TYPE new_type;`

Add a column:
`ALTER TABLE table_name ADD COLUMN column_name data_type [constraint, ...];`

* Example:
  *`ALTER TABLE all_users ADD COLUMN last_login timestamp NOT NULL DEFAULT NOW();`

Remove a column:
`ALTER TABLE table_name DROP COLUMN column_name;`

Remove a table:
`DROP TABLE table_name;`

#### Adding / Removing a constraint

Add a column constraint:
`ALTER TABLE table_name ALTER COLUMN column_name SET constraint clause`

*Examples:
  * NOT NULL: `ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;`
  * DEFAULT: `ALTER TABLE table_name ALTER COLUMN column_name SET DEFAULT 'Mike';`


Add a table constraint:
`ALTER TABLE table_name ADD CONSTRAINT constraint_name constraint clause`

Examples:
* CHECK: `ALTER TABLE table_name ADD CONSTRAINT constraint_name CHECK (check_expression);`
  * Shorthand: `ALTER TABLE table_name ADD CHECK (check_expression);`
* UNIQUE: `ALTER TABLE tablename ADD CONSTRAINT constraint_name UNIQUE (columns);`
  * Shorthand: `ALTER TABLE tablename ADD UNIQUE (columns)`


Remove a column constraint:
`ALTER TABLE table_name ALTER COLUMN column_name DROP CONSTRAINT`

  * Examples:
    * NOT NULL: `ALTER TABLE table_name ALTER COLUMN column_name DROP NOT NULL;`
    * DEFAULT: `ALTER TABLE table_name ALTER COLUMN column_name DROP DEFAULT;`

Remove a table constraint:
`ALTER TABLE table_name DROP CONSTRAINT constraint_name`

### Working with data in a table

DML (Data Manipulation Language) is a sub-language of SQL for add, updating, selecting, and removing data within a database. There are four types:

* INSERT statements - These add new data into a database table
* SELECT statements - Also referred to as Queries; these retrieve existing data from database tables.
* UPDATE statements - These update existing data in a database table.
* DELETE statements - These delete existing data from a database table.

These are sometimes referred to as CRUD (Create, Read, Update, Delete) operations and they SQL commands map directly to thos categories.

#### Inserting data
```SQL
INSERT INTO table_name (column1_name, column2_name, ...)
  VALUES (data_for_column1, data_for_column2, ...);
```

You can add two or more rows at a time by including comma separated rows of values.

Rows are sometimes called 'tuples'. Each individual row is a separate entity or record.

You can use the keyword `DEFAULT` in `INSERT` commands to use the default value for a particular column in that record.

#### Selecting data
```SQL
SELECT [*, (column_name1, column_name2, ...)]
FROM table_name WHERE (condition);
```

Identifiers vs. Keywords:

Identifiers are words that identify tables or columns in a query statement, they should be lowercase and generally use a snake_case format.

Keywords are reserved words that are methods for doing something in SQL. There are also operators and functions that have reserved uses but are not SQL keywords.

When PostgreSQL processes a SQL statement, it identifies keyword, functions, and operators and then assumes anything else is an identifier. It is possible to have identifiers with the same name as SQL keywords however it is discouraged, these identifiers will need to be used while surrounding them in double-quotes.

#### Filtering data
```SQL
SELECT [*, (column_name1, column_name2, ...)]
FROM table_name
WHERE (condition)
```

`WHERE` clauses are used for filtering data out of a result set. You identify the criteria of the rows you would like return in the `WHERE` clause, and each row meeting the WHERE condition is included in the result.

Columns used in a `WHERE` clause do NOT need to be included in the `SELECT` list of columns, they just need to be available in the tables used in the query.

#### Operators

3 types of operators:
* Comparison: =, <>, >=, <=, etc.
  - Also 'comparison predicates': IS NULL, BETWEEN, IS DISTINCT FROM, etc. (and NOT counterparts)
* Logical: AND, OR, NOT
* String Matching:
  - LIKE (wildcards: % for unlimited characters, _ for single character)
  - SIMILAR TO (for regex)

#### Ordering output
```SQL
SELECT [*, (column_name1, column_name2, ...)]
FROM table_name WHERE (condition)
ORDER BY column_name;
```

`ORDER BY` is a clause used to order the result data set. `ORDER BY` defaults to ascending order but can also be modified to be descending using the keyword `DESC`. Multiple rows can also be used for ordering, the precendence will be handled based on the order of the actual `ORDER BY` clause.

Note that `NULL` values are tricky in `ORDER BY` clauses, please also note that columns not included in the `SELECT` statement can be used for ordering the results.

#### Limit and Offset
LIMIT: Limits the number of rows that are returned (regardless of how many meet the criteria)

`SELECT * FROM table_name LIMIT n;`

OFFSET: Skip the first n rows

`SELECT * FROM table_name OFFSET n;`

Limit and offset are useful when doing things like pagination in a website or testing a query for it's accuracy, they allow you to review a limited number of records back from your query in order to see if the results look correct.

#### Distinct

Distinct removes duplicate records from a result.
`SELECT DISTINCT column_name FROM table_name;`

For a multi-column result it removes the duplicate combinations of data across all of the columns. It can also be used to count distinct entries in a column when combined with an aggregate function.
Example:
`SELECT COUNT(DISTINCT id) FROM table_name;`

#### Functions

Functions are a set of commands included as part of the RDBMS that perform particular operations on fields or data.

Many types of functions exist but they are group into types (string, aggregate, math/numeric, data/time):

* String functions: length, trim
* Aggregate: count, sum, min, max, avg
* date_time: date_part, age
* Math: floor, ceiling, round, sqrt

#### Group by

GROUP BY is a clause is used to roll-up aggregate functions by the values in a particular column
`SELECT username, count(object_id) FROM users GROUP BY username;`


### Updating Data

#### UPDATE

An UPDATE statement is used for updating existing data in a table.
```SQL
UPDATE table_name SET [column_name1 = value1, ...]
WHERE (expression);
```

You can update all rows by omitting the `WHERE` clause altogether.

If you want to 'delete' a value from a row than you must set it to `NULL`, there is no way to delete a value from a column/row without replacing it with another value.

#### DELETE

The DELETE statement is used for deleting entire rows from a table.
```SQL
DELETE FROM table_name WHERE (expression);`
```

You can delete all data from a table by omitting the `WHERE` clause, however be careful as this is not reversable.

### Table Relationships

#### Normalization

Normalization is the process of splitting data into multiple tables to avoid duplication and increase data integrity.
  * The reason for normalization is to reduce data redundancy and improve data integrity
  * The mechanism for carrying out normalization is arranging data in multiple tables and defining relationships between them

#### Database design

Database design involves the definition of *entities* (by using a table or set of tables) and then defining the *relationships* between those entities.

Entities generally represent a real world object or concept that we then are trying to model with the design of the datas, storing attributes of that object.

Once we have our entities defined we will define the relationships, for instance a user may have an address and may be able to do an action (such as checkout a book), so a user may have a single address (or more if we want to permit it), and can checkout many books. These relationships will be modeled in our database design.

ERB: Entity Relationship Diagram
 * A diagram showing the abstract representation of our entities and their relationships. ERDs come in many forms, some high-level (conceptual) and other very detailed (physical)

#### Keys

Once we have decided on the entities and relationship we'd like to create in our database, keys will be used to create the relationships between those entities. Keys are a special type of constraint used to establish relationships and uniqueness

There are two main types of keys:
  * Primary key: unique identifier for a row of data
  * Foreign key: a key referencing another tables primary key (forming a relationship)

Add a primary key:
`ALTER TABLE users ADD PRIMARY KEY (id);`
* Making a column a `PRIMARY KEY` is essentially equivalent to adding `NOT NULL` and `UNIQUE` constraints to that column, with an additional `DEFAULT` value that comes from a sequence connected to the primary key
* Each table can only have one primary key

Add a foreign key:
`ALTER TABLE table_name ADD FOREIGN KEY (id_name) REFERENCES target_table_name(id);` *** verify
* A Foreign Key allows us to associate a row in one table to a row in another table
* By setting up this reference, we're ensuring the referential integrity of a relationship. Referential integrity is the assurance that a column value within a record must reference an existing value; if it doesn't then an error is thrown

Keys can be made to form three types of relationship:
* One to one
* One to many
* Many to many

#### Referential integrity

Keys reinforce referencial integrity in multiple ways, primary keys will not allow another row to be inserted with the same id (UNIQUE constraint), ensuring there is only ever one row with that particular key value.

Foreign keys will ensure that the id being inserted already exists in the referenced table, otherwise it will throw an error. You can also set clauses `ON DELETE CASCADE` to ensure that when the record with the primary key is deleted, all rows in the referencing table are deleted if they reference the primary key in their foreign key. You can also use `SET NULL` or `SET DEFAULT` in place of `CASCADE`.

#### One-to-one

In the database world, this sort of relationship is implemented like this: the id that is the PRIMARY KEY of the users table is used as both the FOREIGN KEY and PRIMARY KEY of the addresses table.

In many cases we would not create a separate table for data that has a one-to-one relationship with another table, however it can be useful for perfomance reasons if that data is rarely used compared to the primary table.

#### One-to-many

 A one-to-many relationship exists between two entities if an entity instance in one of the tables can be associated with multiple records (entity instances) in the other table, but the opposite relationship does not exist.

 Example: A book has many reviews. A review belongs to only one book.

 #### Many-to-many

 A many-to-many relationship exists between two entities if for one entity instance there may be multiple records in the other table, and vice versa.

In order to implement this sort of relationship we need to introduce a third, cross-reference, table. This table holds the relationship between the two entities, by having two FOREIGN KEYs, each of which references the PRIMARY KEY of one of the tables for which we want to create this relationship.

Cross reference tables general are names for the two tables that they are connecting, with the names in alphabetical order. However there are instances were a more conceptual name (like checkouts) may be used to represent the relationship between the two entities and therefore the cross-reference table could be named with that convention.

### Joins

JOINs are clauses in SQL statements that link two tables together, usually based on the keys that define the relationship between those two tables. There are several types:
  * INNER JOIN
  * LEFT OUTER JOIN
  * RIGHT OUTER JOIN
  * FULL OUTER JOIN
  * CROSS JOIN

Join syntax:
```SQL
SELECT [table_name.column_name1, table_name.column_name2,..] FROM table_name1
join_type JOIN table_name2 ON (join_condition);
```

To join one table to another, PostgreSQL needs to know several pieces of information:
  * The name of the first table to join
  * The type of join to use
  * The name of the second table to join
  * The join condition

The 'join condition' is the part of the JOIN coming after the `ON` keyword. Once a join has occurred a virtual join table is created, the SELECT column_list FROM part of our statement can then be executed to select columns from this virtual table.

#### Inner Join

An INNER JOIN returns a result set that contains the common elements of the tables, i.e the intersection where they match on the joined condition.


#### LEFT OUTER JOIN

A LEFT JOIN or a LEFT OUTER JOIN takes all the rows from one table, defined as the LEFT table, and joins it with a second table. The JOIN is based on the conditions supplied in the `ON` clause.

#### RIGHT OUTER JOIN

A RIGHT JOIN is similar to a LEFT JOIN except that the roles between the two tables are reversed, and all the rows on the second table are included along with any matching rows from the first table.


#### FULL OUTER JOIN

A FULL JOIN or FULL OUTER JOIN is essentially a combination of LEFT JOIN and RIGHT JOIN. This type of join contains all of the rows from both of the tables. Where the join condition is met, the rows of the two tables are joined, just as in the previous examples we've seen. For any rows on either side of the join where the join condition is not met, the columns for the other table have NULL values for that row.

#### CROSS JOIN

A CROSS JOIN, also known as a Cartesian JOIN, returns all rows from one table crossed with every row from the second table.

#### Aliasing

Aliasing allows us to specify another name for a column or table and then use that name in later parts of a query to allow for more concise syntax.


#### Subqueries

Subqueries offer another method for us to query the database and retrieve the same results of similar results, as if we had used a JOIN clause.


### Constraint cheatsheet

NOT NULL
* CREATE TABLE: `name varchar(20) NOT NULL,`
* ALTER TABLE: `ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL`
* Remove NOT NULL: `ALTER TABLE table_name ALTER COLUMN column_name DROP NOT NULL`

UNIQUE
* CREATE TABLE: `name varchar(20) UNIQUE,`
* ALTER TABLE: `ALTER TABLE table_name ADD UNIQUE(column_name);`
* Remove UNIQUE: `ALTER TABLE table_name DROP CONTRAINT unique_constraint_name;`

CHECK
* CREATE TABLE: `companions integer CHECK(companions > 0),`
* ALTER TABLE: `ALTER TABLE table_name ADD CHECK (condition)`
* Remove UNIQUE: `ALTER TABLE table_name DROP CONTRAINT check_constraint_name;`

DEFAULT
* CREATE TABLE: `name varchar(20) DEFAULT 'test_name',`
* ALTER TABLE: `ALTER TABLE table_name ALTER COLUMN column_name SET DEFAULT 'test_name`
* Remove NOT NULL: `ALTER TABLE table_name ALTER COLUMN column_name DROP DEFAULT`

PRIMARY KEY
* CREATE TABLE `id serial PRIMARY KEY,` or at end of CREATE TABLE `PRIMARY KEY (id)`
* ALTER TABLE `ALTER TABLE table_name ADD PRIMARY KEY (id);`
* Remove PRIMARY KEY: `ALTER TABLE table_name DROP CONTRAINT table_name_pkey;`

FOREIGN KEY
* CREATE TABLE `fkey_id integer NOT NULL REFERENCES table_name(p_key_id),` or at end of the create table `FOREIGN KEY (fkey_id) REFERENCES table_name(pkey_id)`
* ALTER TABLE `ALTER TABLE table_name ADD FOREIGN KEY (id) REFERENCES table_name(pkey_id);`
* Remove FOREIGN KEY: `ALTER TABLE table_name DROP CONTRAINT table_name_id_fkey;`

INDEX
`CREATE INDEX ON bids(bidder_id, item_id);`

TYPE
* ALTER TYPE: `ALTER TABLE table_name ALTER COLUMN column_name TYPE type;`

Use REGEX in CHECK:
`CHECK(column_name ~ '[A-Z]{8}')`

### Random

Creat an Enum type:
`CREATE TYPE enum_type AS ENUM (list_of_values);`

Assign enum type to column:
```SQL
ALTER TABLE table_name ALTER COLUMN column_name TYPE enum_type
USING column_name::enum_type
```

Window lag function:
`lag(column_name) OVER (ORDER BY column_name)`

Copy from CSV file into table
`\copy table_name FROM ‘file_path’ WITH DELIMITER ‘,’ CSV HEADER;`

### Subquery Expressions

EXISTS:
```SQL
SELECT col1
FROM tab1
WHERE EXISTS (SELECT 1 FROM tab2 WHERE col2 = tab1.col2);
```

Conditional Subqueries: ANY, SOME, ALL
`ANY` and `SOME` are synonomous
`expression operator ANY (subquery)`
Example:
`SELECT i.name FROM items i WHERE 100 > ANY (SELECT b.amount FROM bids b WHERE b.item_id = i.id);`

`= ANY` is s equivalent to `IN`

When using ALL, if nothing is returned from a query, then that yields a true value, and the row is selected... Therefore you need to be careful with `NULL` values from the resulting query because when we run the subquery, we get no results. That lack of results evaluates as true, and thus ALL selects the item.

Scalar Subqueries
```SQL
SELECT a.column_name,
       (SELECT COUNT(id) FROM table2 b WHERE b.fkey = a.id) AS count
    FROM table1 a;
```

Another way to accomlish a `GROUP BY` result without using GROUP BY with an OUTER JOIN.
