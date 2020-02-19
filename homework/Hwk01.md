# Ryan Manchanthasouk
### TSQL Hwk 1
### January 14th, 2020
1.  Declarative requires you to specify what you want to get and not how to get it, along with RDBMS figurig out
	the physical mechancis requried to process your request.
1.  Data Definitive Language (DDL), Data Manipulation Language (DML), Data Control Language (DCL)
1.  RDBMS is a database that is based on a relational model which is based on set theory and predicate logic.
	An HR database would contain directories, tables, lists, and files of personal information from the personnel that work
	in the company.
1.	SQL implements three-valued predicate logic by supporting the null marker.
1.	SQL enforces entity integrity through the use of candidates.  Entity integrity is the mechanism in the system that maintains
	the primary keys, which serve as unique identifiers for rows in a table.
1.	SQL enforces referential integrity through the use of foreign keys.  Referential integrity is the accuracy and consistency
	of data within a relationship, where data is linked between two or more tables.
1.	Table
1.	Yes, this table is in 1NF.  1NF only requires that a table is in tuples, where the table must be unique and attributes
	should be atomic.  The facName attributes are atomic.
	-incorrect: not in 1NF because the table is not atomic; the items are not atomic MEANING indivisible.
1.	No, 2NF is violated because there are nonkey attributes that will fall under both IDs.  In other words, you can
	find the petName by using ownerID.  to fix this, you would split the relation, where ownerID, ownerFirstName,
	and ownerLastName would be in their own table, while petID, petName, and petType are in another table.
1.	Yes, because it does not violate 2NF or 1NF (fulfilling one rule), but also fulfills the rule that all nonkey attributes must
	be mutually independent.
	-incorrect: the city and state depend on zip code; if someone moves and changes address to new city, you would have to change
	city, state, and zip
1.	server name, database name, schema name, object name
1.	Declarative data integrity is enforced as part of the model, while procedural data integrity is enforced with code,
	such as stored procedures or triggers.
