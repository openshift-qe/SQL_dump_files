DROP DATABASE IF EXISTS ddump;
CREATE DATABASE ddump;

\c ddump;
DROP TABLE IF EXISTS tdump;
CREATE TABLE tdump (
    id INT NOT NULL,
    name VARCHAR(32) NOT NULL,
    email VARCHAR(64),
    PRIMARY KEY (id)
);

CREATE LANGUAGE plpgsql;
\c ddump;
CREATE OR REPLACE FUNCTION  insertdata (IN starts INT, IN loops INT) RETURNS integer
AS
$BODY$
DECLARE intvar INTEGER := 0;
DECLARE ID INTEGER := starts;
BEGIN
WHILE intvar < loops LOOP
        INSERT INTO tdump(ID, name, email)
        VALUES(ID, CONCAT('name_',ID), CONCAT(ID,'@sina.com'));
        intvar := intvar + 1;
        ID := ID + 1;
END LOOP;
RETURN intvar;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

SELECT insertdata(1,3200000);
