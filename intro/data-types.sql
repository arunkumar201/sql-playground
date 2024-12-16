-- Data Types in SQL
--   Not all data types are supported by every relational database vendor.
-- Numeric data types such as: INT, TINYINT, BIGINT, FLOAT, REAL, etc.
--   - INT - Integer data type
--   - BIGINT - Larger integer data type
--   - FLOAT - Single-precision floating-point number data type
--   - REAL - Double-precision floating-point number data type
--   - NUMERIC - Decimal number data type

-- Date and Time data types such as: DATE, TIME, DATETIME, etc.
--   - DATE - Represents a date with no time , store date in YYYY-MM-DD format
--   - TIME - Represents a time of day with no date, store time in HH:MM:SS format
--   - DATETIME - Represents a date and time with no time zone, store date and time in YYYY-MM-DD HH:MM:SS format
--   -  TIMESTAMP - Stores number of seconds passed since the Unix epoch ('1970-01-01 00:00:00' UTC)
--   - YEAR - YEAR Stores year in a 2 - digit or 4 - digit format.Range 1901 to 2155 in 4 - digit format.Range 70 to 69,
--      representing 1970 to 2069.

-- Character and String data types such as: CHAR, VARCHAR, TEXT, etc.
--   - CHAR - Fixed-length string data type, specified by a length in parentheses. Fixed length with a maximum length of 8, 000 characters
--   - VARCHAR - Variable - length storage with a maximum length of 8, 000 characters eg. VARCHAR(100)
--   - TEXT - Variable - length storage with a maximum size of 2GB data eg. TEXT
--   VARCHAR(max)	Variable-length storage with provided max characters, not supported in MySQL

-- Unicode character string data types such as: NCHAR, NVARCHAR, NTEXT, etc.
--   - NCHAR - Fixed-length Unicode string data type, specified by a length in parentheses. Fixed length with a maximum length of 4, 000 characters
--   - NVARCHAR - Variable - length Unicode storage with a maximum length of 4, 000 characters eg. NVARCHAR(100)
--   - NTEXT - Variable - length Unicode storage with a maximum size of 1GB data eg. NTEXT
--   - NCHAR(max)	Variable-length Unicode storage with provided max characters, not supported in MySQL

-- Binary data types such as: BINARY, VARBINARY, etc.
--   - BINARY - Fixed-length binary data type, specified by a length in parentheses.
--  Fixed length with a maximum length of 8, 000 bytes
--   - VARBINARY - Variable - length binary storage with a maximum length of 8, 000 bytes eg. VARBINARY(100)
-- VARBINARY(max) Variable - length storage with provided max bytes
--  IMAGE Variable - length storage with a maximum size of 2 GB binary data

-- Miscellaneous data types - CLOB, BLOB, XML, CURSOR, TABLE, etc.
-- CLOB Character large objects that can hold up to 2 GB
-- BLOB For large binary objects
--  XML For storing XML data
-- JSON For storing JSON data
