## Basic SQL Query Outline

```sql
SELECT (column_name), {other_column_name}

FROM (table_name)

JOIN (other_table_name) ON (table_name.id = other_table_name.foreign_key)

WHERE (column_name) <=> (condition) NOT/AND/OR (another_column_name) <=> (another_condition)
(column_name) LIKE (pattern)

GROUP BY (column_name)

HAVING (aggregate_function(column_name)) <=> (condition)

ORDER BY (column_name) ASC / DESC, (another_column_name) ASC / DESC

LIMIT (some_number)
```

## Notes

#### SELECT

- ```SELECT table_name.* ```  lists all columns only from the specified table
- If you are joining multiple tables with share a column name, you must specify which table each column belongs to
  -  <b>Example:</b> ```SELECT table1.location, table2.location```
-  If the tables have unique column names, you can just type ```SELECT name, location```
  -  SQL will look for a ```name``` column amongst all tables you join, and a ```location``` column amongst all tables you join

#### JOIN

- You must type a ```JOIN``` for <b>each</b> table you join
- Each ```JOIN``` must have a corresponding ```ON``` before you start the next ```JOIN```
  - <b>Example</b>: ```JOIN table2 ON table1.id = table2.foreign_key JOIN table3 ON table3.foreign_key ```

#### WHERE

- There should only ever be one ```WHERE```  in your query
- For multiple conditions, use ```AND / OR / NOT ``` to join each successive condition
  - <b>Example:</b> ```WHERE table1.name='Bob' OR table1.name='Sally' AND       table1.location='Washington D.C'  ```
- You can also use matchers to check partial matches using a ```LIKE``` instead of ```=```
  - <b>Example:</b> ```WHERE table1.name LIKE '%Bob%'```will return all records that include "Bob" somewhere in their name column


#### GROUP BY / ORDER BY

- ```GROUP BY``` always goes before ```ORDER BY```. Remember: <b>GO</b>

#### HAVING
- When you filter by an aggregate function (``` COUNT / AVG / SUM ```), you must use a ```HAVING``` clause, not a ```WHERE``` clause
  - <b>Correct</b>: ```HAVING count(table1.id > 5)```
  - <b>Incorrect</b>: ```WHERE count(table1.id > 5)```
- ```HAVING``` always goes after ```GROUP BY``` and before ```ORDER BY``` (if you use ```ORDER BY```)

#### DELETE
DELETE FROM table_name;
-or
DELETE FROM table_name
WHERE column_name ='condition';

#### UPDATE
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

#### INSERT
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
-or
INSERT INTO table_name
VALUES (value1, value2, value3, ...);
