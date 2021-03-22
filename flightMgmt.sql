PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE user ( 
u_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
password TEXT NOT NULL, 
email TEXT NOT NULL );
INSERT INTO user VALUES(1,'flightAdmin','33d87fd364516f6604124fcc76fdd279','admin@admin.com');
CREATE TABLE flightDetails ( 
d_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
email TEXT NOT NULL, 
destination TEXT NULL, 
phone TEXT NULL, 
paymentStatus TEXT NULL, 
date DATE NULL, 
price DOUBLE NOT NULL );
INSERT INTO flightDetails VALUES(3,'test','tsdghvyds@hcj.com','sdbkj','sdbvjs@bfj.vb','paid',890763300000,237.6699999999999875);
INSERT INTO flightDetails VALUES(4,'tdsy','fbbviu@h.com','fh','dsjhb@bhfj.com','unpaid',1007316900000,763.99999999999999998);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('user',1);
INSERT INTO sqlite_sequence VALUES('flightDetails',4);
COMMIT;
