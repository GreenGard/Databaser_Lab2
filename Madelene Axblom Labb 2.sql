-- CREATE DATABASE laboration2;
-- VERKET

CREATE TABLE Author (
    authorID VARCHAR (3) ,
    firstname VARCHAR (50),
    lastname VARCHAR (30),
    birth date ,
   PRIMARY KEY (authorID)
 );

CREATE TABLE Store (
    storeID VARCHAR(13),
    store_name ENUM ('VERKET_GBG', 'VERKET_STH', 'VERKET_MALMÖ'),
    address VARCHAR (50),
    no int,
    zip_code int,
    city VARCHAR(50) ,
    store_manager_id ENUM ('1','2','3'),
   PRIMARY KEY (storeID, store_name)
 );

CREATE TABLE Publisher (
    publisher ENUM ( 'Bokförlaget Forum','Natur & Kultur Allmänlitteratur', 'Memo Förlag'),
	address VARCHAR (50),
    no int,
    zip_code int,
    city VARCHAR(50) ,
    PRIMARY KEY (publisher)
 );
 
CREATE TABLE Book (
    ISBN13 VARCHAR(13),
    title VARCHAR (50),
    language ENUM ('SVENSKA','ENGELSKA'),
    genre ENUM ('ROMAN','DECKARE','FANTASY','DRAMA','PSYKOLOGI','BARN OCH TONÅR','SKÖNLITTERATUR','BIOGRAFIER'),
    release_date date,
    authorID VARCHAR (3),
    PRIMARY KEY (ISBN13)
   -- FOREIGN KEY (authorID) references Author(authorID)
 );
  
CREATE TABLE Stock_Balance (
    storeID VARCHAR(13),
    ISBN13 VARCHAR(13),
    number_in_stock int,
   PRIMARY KEY (storeID,ISBN13), 
   FOREIGN KEY (storeID) references Store(storeID),
   FOREIGN KEY (ISBN13) references Book(ISBN13)
 );

CREATE TABLE Purchase_price (
    purchase_price int,
    ISBN13 VARCHAR(13),
   PRIMARY KEY (ISBN13), 
   FOREIGN KEY (ISBN13) references Book(ISBN13)
 ); 
 -- 3 Butiker
INSERT INTO store 
(storeID,store_name,address,no,zip_code,city,store_manager_id)
VALUES 
( 'GBG' , 'VERKET_GBG', 'Kungsgatan', '8', '41119','Göteborg','1'),
( 'STH' , 'VERKET_STH', 'Kungsgatan', '25', '11156','Stockholm','2'),
( 'MALMÖ' , 'VERKET_MALMÖ', 'Kungsgatan', '2', '21149','Malmö','3')
;
-- 4 författare
INSERT INTO author 
(authorID,firstname,lastname,birth)
VALUES 
('MAS','Susanne', 'MacFie', '1966-09-20'),
('LÄC','Camilla', 'Läckberg', '1974-08-30'),
('ROH','Hans', 'Rosling', '1948-07-27'),
('FEH','Henrik', 'Fexeus', '1971-09-29')
;
 -- 10 boktitlar
 INSERT INTO Book 
 (ISBN13,title,language,genre,release_date)
 VALUES
 ('9789137155296','Konsten att läsa tankar','SVENSKA','PSYKOLOGI','2019-08-07'),
 ('9789137155401','Gå i fängelse : Kvinnor utan nåd','SVENSKA', 'DECKARE','2021-04-14'),
 ('9789137158921','Box', 'SVENSKA', 'DECKARE','2021-09-07'),
 ('9789137159379','Vingar av silver', 'SVENSKA','SKÖNLITTERATUR','2021-03-11'),
 ('9789127154872','Hur jag lärde mig förstå världen', 'SVENSKA', 'BIOGRAFIER','2017-11-07'),
 ('9789187217296','De Två Vulkanernas Dal', 'SVENSKA',  'BARN OCH TONÅR','2015-06-17'),
 ('9789197870436','Hemliga klubben. Fallet med den försvunna flaggan', 'SVENSKA', 'BARN OCH TONÅR','2010-11-24'),
 ('9789187217135','Hemliga Klubben. Fallet med den skumma sabotören', 'SVENSKA', 'BARN OCH TONÅR','2013-11-26'),
 ('9789187217142','Vilda Våghals vilda liv', 'SVENSKA',  'BARN OCH TONÅR','2014-04-14'),
 ('9789187217043','Vilda Våghals på nya äventyr', 'SVENSKA',  'BARN OCH TONÅR ','2012-09-19')
 ;

INSERT INTO publisher 
(publisher,address,no,zip_code,city)
VALUES
('Bokförlaget Forum','Sveavägen', '56', '10363','STOCKHOLM'),
('Natur & Kultur Allmänlitteratur','Karlavägen', '31', '10360', 'STOCKHOLM'),
('Memo Förlag','Lärkvägen','22', '44140', 'ALINGSÅS')
 ;
 
 INSERT INTO stock_balance 
 (storeID,ISBN13,number_in_stock)
 VALUES
 ('GBG','9789137155296','10'),
 ('STH','9789137155296','5'),
 ('MALMÖ','9789137155296','5'),
 ('GBG','9789127154872','2'),
 ('STH','9789127154872','2'),
 ('MALMÖ','9789127154872','1'),
 ('GBG','9789137155401','2'),
 ('STH','9789137155401','2'),
 ('MALMÖ','9789137155401','1'),
 ('GBG','9789137158921','2'),
 ('STH','9789137158921','2'),
 ('MALMÖ','9789137158921','1'),
 ('GBG','9789137159379','2'),
 ('STH','9789137159379','2'),
 ('MALMÖ','9789137159379','1'),
 ('GBG','9789187217135','2'),
 ('STH','9789187217135','2'),
 ('MALMÖ','9789187217135','1'),
 ('GBG','9789187217142','20'), 
 ('GBG','9789187217296','100'),
 ('STH','9789187217296','100'),
 ('MALMÖ','9789187217296','100')
;
INSERT INTO stock_balance 
 (storeID,ISBN13,number_in_stock)
 VALUES
 ('GBG','9789187217043','10'),
 ('STH','9789187217043','5'),
 ('MALMÖ','9789187217043','5')
;
 INSERT INTO purchase_price 
 (purchase_price,ISBN13)
 VALUES
 ('200','9789127154872'),
 ('75','9789137155296'),
 ('175','9789137155401'),
 ('85','9789137158921'),
 ('190','9789137159379'),
 ('75','9789187217043'),
 ('75','9789187217135'),
 ('75','9789187217142'),
 ('75','9789187217296'),
 ('75','9789197870436')
 ;
 
ALTER TABLE book DROP COLUMN authorID;

CREATE TABLE Book_author(
ISBN13 VARCHAR(13),
authorID VARCHAR (3),
FOREIGN KEY (ISBN13) REFERENCES Book(ISBN13),
FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
PRIMARY KEY (ISBN13, AuthorID)
); 

INSERT INTO Book_Author (ISBN13, AuthorID)
VALUES 
('9789137158921','LÄC'),
('9789137158921','FEH'),
('9789137155296','FEH'),
('9789137155401','LÄC'),
('9789137159379','LÄC'),
('9789127154872','ROH'),
('9789187217296','MAS'),
('9789197870436','MAS'),
('9789187217135','MAS'),
('9789187217142','MAS'),
('9789187217043','MAS')
 ;
 
 -- VY1
CREATE VIEW TitlarPerFörfattare
AS
SELECT
CONCAT(author.firstname," ",author.lastname) Namn,
TIMESTAMPDIFF(YEAR, author.birth, CURDATE()) AS Ålder,
SUM(stock_balance.number_in_stock*purchase_price.purchase_price) AS Lagervärde,
COUNT( distinctrow book_author.ISBN13) as titlar FROM book_author
INNER JOIN author ON author.authorID = book_author.authorID
INNER JOIN stock_balance ON stock_balance.ISBN13= book_author.ISBN13
INNER JOIN purchase_price ON purchase_price.ISBN13= stock_balance.ISBN13
GROUP BY book_author.authorID;

-- VG
-- Vy:Försäljningsstatistik_butik_per_anställd, 
-- visar vilken säljare som presterat bäst i total omsättning- 
-- denna vyn är bra för ett företag som vill veta hur dess anställda presterar och vilken butik som de tillhör, 
-- därefter kan man ju ta reda på kundunderlaget med fler tabeller och utveckla verksamheten.
-- Dessutom man de se vilken säljare som kanske behöver mer stöd.

 CREATE TABLE Sale_price (
 sale_price int,
 ISBN13 VARCHAR(13),
 PRIMARY KEY (ISBN13), 
 FOREIGN KEY (ISBN13) references book(ISBN13)
 );
 
 CREATE TABLE Employee (
    employeeID smallint ,
    Title ENUM('Säljare', 'Butiksansvarig'),
    firstname VARCHAR (50),
    lastname VARCHAR (50),
    email VARCHAR (100),
    telephone VARCHAR (10),
	storeID VARCHAR(13),
    store_manager_id ENUM ('1','2','3'),
  PRIMARY KEY (employeeID),
FOREIGN KEY (storeID) references Store(storeID)
 ); 
 
 CREATE TABLE Sale_history (
    sales_orderID int NOT NULL AUTO_INCREMENT,
    ISBN13 VARCHAR(13) NOT NULL,
	storeID VARCHAR(13)  NOT NULL,
    amount int,
    employeeID smallint ,
    PRIMARY KEY (sales_orderID),
    FOREIGN KEY (ISBN13) references book(ISBN13),
    FOREIGN KEY (storeID) references store(storeID),
    FOREIGN KEY (employeeID) references employee(employeeID)
 );
 
 INSERT INTO Sale_price 
 (sale_price,ISBN13)
 VALUES
 ('120','9789137155296'),
 ('209','9789137155401'),
 ('120','9789137158921'),
 ('199','9789137159379'),
 ('240','9789127154872'),
 ('109','9789187217296'),
 ('109','9789197870436'),
 ('111','9789187217135'),
 ('111','9789187217142'),
 ('111','9789187217043')
 ;
INSERT INTO Employee (employeeID,Title,firstname,lastname,email,telephone,storeID,store_manager_id)
VALUES
( '1', 'Säljare','Lena','Merkur', 'lena.merkur@verket.se','0730080808', 'STH','2'),
( '2', 'Butiksansvarig', 'Peter','Pålsson', 'peter.palsson@verket.se','0730031031','GBG','1'),
( '3', 'Säljare','Johan','Karlsson', 'johan.karlsson@verket.se','0730040040','MALMÖ','3'),
( '4', 'Butiksansvarig','Henrietta', 'Måne', 'henrietta.måne@verket.se','0730080809','STH','2'),
( '5', 'Säljare','Fredrik', 'Morän','fredrik.moran@verket.se','0730080810','STH','2'),
( '6', 'Säljare','Meja', 'Nilsson','meja.nilsson@verket.se','0730031032','GBG','1'),
( '7', 'Säljare','Gillis', 'Gillgren','gillis.gillgren@verket.se','0730031033','GBG','1'),
( '8', 'Butiksansvarig','Ossian','Nordgren' , 'ossian.nordgren@verket.se','0730080810','STH','2'),
( '9', 'Säljare','My', 'Green', 'my.green@verket.se', '0730040041','MALMÖ','3')
 ; 
 INSERT INTO sale_history
 (ISBN13,storeID,amount,employeeID)
 VALUES
 ('9789127154872','GBG','10','2' ),
 ('9789137155296','GBG','15','2'),
 ('9789137155401','STH','13','1'),
 ('9789137158921','MALMÖ','17','3'),
 ('9789137159379','STH','19','1'),
 ('9789187217043','GBG','12','6'),
 ('9789187217135','MALMÖ','21','9'),
 ('9789187217142','GBG','51','7'),
 ('9789187217296','STH','11','8')
 ;
-- vy 2
CREATE VIEW Försäljningstatistik_butik_per_anställd
AS
SELECT 
store_name,
CONCAT(employee.firstname," ",employee.lastname) Namn,
SUM(sale_price.sale_price* sale_history.amount) AS Belopp
FROM store
INNER JOIN employee ON employee.storeID = store.storeID
INNER JOIN sale_history ON sale_history.employeeId = employee.employeeID
INNER JOIN sale_price ON sale_history.ISBN13=sale_price.ISBN13
GROUP BY namn
ORDER BY Belopp desc;