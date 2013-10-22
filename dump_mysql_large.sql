DROP DATABASE IF EXISTS ddump;
CREATE DATABASE ddump;



use ddump;
DROP TABLE IF EXISTS tdump;
CREATE TABLE ddump.tdump (
    id INT NOT NULL,
    name VARCHAR(32) NOT NULL,
    email VARCHAR(64),
    PRIMARY KEY (id)
)ENGINE = InnoDB;



use ddump;
DROP PROCEDURE IF EXISTS ddump.InsertData;
DELIMITER $$
CREATE PROCEDURE InsertData (IN starts INT, IN loops INT)
BEGIN
    DECLARE Var INT;
    DECLARE ID INT;
    SET Var = 0;
    SET ID =starts;
    WHILE Var < loops
    DO
        INSERT INTO tdump(ID, name, email)
        VALUES(ID, CONCAT('name_',rand(ID)*10000 mod 200), CONCAT(ID,'@sina.com'));
        SET Var = Var + 1;
        SET ID = ID + 1;
    END WHILE;
END $$
DELIMITER ;

CALL InsertData(1, 12000000);
