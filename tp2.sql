-- creating a database
CREATE DATABASE ayahia LOCATION 'user/ayahia/db';

-- creating a table 
-- if there is a space after a comma, it will be found in the string (ie: ["french", " latin"])
CREATE EXTERNAL TABLE ayahia.prenoms ( prenom STRING, gender ARRAY<STRING>,origin ARRAY<STRING>,version DOUBLE)ROW FORMAT 
	DELIMITED FIELDS TERMINATED BY '\073' COLLECTION ITEMS TERMINATED by ',' 
	STORED AS TEXTFILE LOCATION '/user/ayahia/prenoms';
	
-- question 1
-- here origin is a table, each origin is not extracted yet
SELECT origin, COUNT(prenom) FROM prenoms GROUP BY origin;

-- question 2
-- same problem here, what is counted is the number of distinct combination of origins
SELECT SIZE(origin), COUNT(prenom) FROM prenoms GROUP BY SIZE(origin);