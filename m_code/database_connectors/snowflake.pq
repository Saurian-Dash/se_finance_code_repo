// Connect to Snowflake via an ODBC connection and access the specified database
// and schema via parameters passed in from the workbook.

DB = 'COLLAB'
SCHEMA = ''
TABLE = ''

let
    Source = Odbc.DataSource("dsn=Snowflake", [HierarchicalNavigation=true]),
    CONN = Source{[Name=DB,Kind="Database"]}[Data]
in
    CONN