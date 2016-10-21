-- creating a database
CREATE DATABASE ayahia LOCATION 'user/ayahia/db';

-- creating a table 
-- if there is a space after a comma, it will be found in the string (ie: ["french", " latin"])
CREATE EXTERNAL TABLE ayahia.prenoms (prenom STRING, gender ARRAY<STRING>,origin ARRAY<STRING>,version DOUBLE)ROW FORMAT 
	DELIMITED FIELDS TERMINATED BY '\073' COLLECTION ITEMS TERMINATED by ',' 
	STORED AS TEXTFILE LOCATION '/user/ayahia/prenoms';
	
-- question 1
-- issue not fixed: "origin" and " origin" are considered distinct
-- how to use lateral view explode? example found here:
--    https://cwiki.apache.org/confluence/display/Hive/LanguageManual+LateralView
SELECT origins, COUNT(prenom)
FROM prenoms 
LATERAL VIEW EXPLODE (origin) originTable AS origins
GROUP BY origins;

-- question 2
SELECT SIZE(origin), COUNT(prenom) FROM prenoms GROUP BY SIZE(origin);