CREATE TABLE supplier (
    SUPP_ID int NOT NULL PRIMARY KEY, 
    SUPP_NAME varchar (50) NOT NULL,
    SUPP_CITY  varchar (50) NOT NULL,
    SUPP_PHONE  varchar (50) NOT NULL
);


CREATE TABLE customer (
    CUS_ID int NOT NULL PRIMARY KEY, 
    CUS_NAME varchar (20) NOT NULL,
    CUS_PHONE  varchar (10) NOT NULL,
    CUS_CITY varchar (30) NOT NULL,
    CUS_GENDER  CHAR
);


CREATE TABLE category (
    CAT_ID int NOT NULL PRIMARY KEY, 
    CAT_NAME varchar (20)
);

CREATE TABLE product (
    PRO_ID int NOT NULL PRIMARY KEY, 
    PRO_NAME varchar (20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC  varchar (60) NOT NULL,
	CAT_ID  INT foreign KEY REFERENCES category(CAT_ID)

);


CREATE TABLE supplier_pricing (
    PRICING_ID int NOT NULL PRIMARY KEY, 
    PRO_ID INT FOREIGN KEY REFERENCES product(PRO_ID),
    SUPP_ID  INT FOREIGN KEY REFERENCES supplier(SUPP_ID),
    SUPP_PRICE  INT DEFAULT 0
);

CREATE TABLE order1 (
    ORD_ID int NOT NULL PRIMARY KEY, 
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE  DATE NOT NULL,
    CUS_ID  INT FOREIGN KEY REFERENCES customer(CUS_ID),
    PRICING_ID  INT FOREIGN KEY REFERENCES supplier_pricing(PRICING_ID)
);

CREATE TABLE rating (
    RAT_ID int NOT NULL PRIMARY KEY,
    RAT_RATSTARS INT NOT NULL,
    ORD_ID  INT FOREIGN KEY REFERENCES order1(ORD_ID)
);





---------------INSERT--------
--delete from supplier

INSERT INTO supplier 
(SUPP_ID,	SUPP_NAME,		SUPP_CITY,	SUPP_PHONE)
SELECT 1,		'Rajesh Retails',		'Delhi',	'1234567890'
UNION
SELECT 2,		'Appario Ltd.',		'Mumbai',	'2589631470'
UNION
SELECT 3,		'Knome products',	'Banglore',	'9785462315'
UNION
SELECT 4,		'Bansal Retails',	'Kochi',		'8975463285'
UNION
SELECT 5,		'Mittal Ltd.',		'Lucknow',	'7898456532'


INSERT INTO customer 
(CUS_ID,	CUS_NAME,	CUS_PHONE,	CUS_CITY,	CUS_GENDER)
SELECT 1, 'AAKASH','9999999999','DELHI','M' UNION
SELECT 2, 'AMAN','9785463215','NOIDA','M' UNION
SELECT 3, 'NEHA','9999999999','MUMBAI','F' UNION
SELECT 4, 'MEGHA','9994562399','KOLKATA','F' UNION
SELECT 5, 'PULKIT','7895999999','LUCKNOW','M'

--select * from category

INSERT INTO category
(CAT_ID,	CAT_NAME)

select 1,'BOOKS' UNION
select 2,'GAMES' UNION
select 3,'GROCERIES' UNION
select 4,'ELECTRONICS' UNION
select 5,'CLOTHES'


INSERT INTO product
(PRO_ID,	PRO_NAME,		PRO_DESC,								CAT_ID)
select 1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2 
UNION
select 2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5
UNION
select 3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4
UNION
select 4, 'OATS', 'Highly Nutritious from Nestle', 3
UNION
select 5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1
UNION
select 6, 'MILK', '1L Toned MIlk', 3
UNION
select 7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4
UNION
select  8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5
UNION
select 9, 'Project IGI', 'compatible with windows 7 and above', 2
UNION
select 10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5
UNION
select 11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1
UNION
select 12, 'Train Your Brain', 'By Shireen Stephen', 1


--select * from supplier_pricing

INSERT INTO supplier_pricing
(PRICING_ID,	PRO_ID,	SUPP_ID,	SUPP_PRICE)
select  1,1,2,1500 union
select  2,3,5,30000 union
select  3,5,1,3000 union
select  4,2,3,2500 union
select  5,4,1,1000 

--select * from order1

INSERT INTO order1
(ORD_ID,	ORD_AMOUNT,		CUS_ID,	PRICING_ID,ORD_DATE)
SELECT 101,1500,2,1,'2021-10-06' union
SELECT 102,1000,3,5, '2021-10-12' union
SELECT 103,30000,5,2,'2021-09-16' union
SELECT 104,1500,1,1, '2021-10-05' union
SELECT 105,3000,4,3, '2021-08-16' union
SELECT 106,1450,1,5, '2021-08-18' union
SELECT 107,789,3,5, '2021-09-01' union
SELECT 108,780,5,5, '2021-09-07' union
SELECT 109,3000,5,3, '2021-01-10' union
SELECT 110,2500,2,4, '2021-09-10' union
SELECT 111,1000,4,5, '2021-09-15' union
SELECT 112,789,4,5, '2021-09-16' union
SELECT 113,31000,1,5, '2021-09-16' union
SELECT 114,1000,3,5, '2021-09-16' union
SELECT 115,3000,5,3, '2021-09-16' union
SELECT 116,99,2,5, '2021-09-17' 


INSERT INTO rating
(RAT_ID,	ORD_ID,	RAT_RATSTARS)
SELECT  1,101,4 UNION
SELECT  2,102,3 UNION
SELECT  3,103,1 UNION
SELECT  4,104,2 UNION
SELECT  5,105,4 UNION
SELECT  6,106,3 UNION
SELECT  7,107,4 UNION
SELECT  8,108,4 UNION
SELECT  9,109,3 UNION
SELECT  10,110,5 UNION
SELECT  11,111,3 UNION
SELECT  12,112,4 UNION
SELECT  13,113,2 UNION
SELECT  14,114,1 UNION
SELECT  15,115,1 UNION
SELECT  16,116,0



---3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
select cu.CUS_GENDER,COUNT(1) from customer cu
inner join order1 ord on cu.CUS_ID = ord.CUS_ID
WHERE ord.ORD_AMOUNT > 3000
group by cu.CUS_GENDER

--4)	Display all the orders along with product name ordered by a customer having Customer_Id=2

SELECT * FROM order1 ORD
INNER JOIN supplier_pricing SP ON ORD.PRICING_ID = SP.PRICING_ID
INNER JOIN product P ON SP.PRO_ID = P.PRO_ID
INNER JOIN customer CU ON CU.CUS_ID = ORD.CUS_ID
WHERE CU.CUS_ID =2


--5)	Display the Supplier details who can supply more than one product.
SELECT * FROM supplier WHERE SUPP_ID IN (
SELECT SP.SUPP_ID FROM supplier S
INNER JOIN supplier_pricing SP ON S.SUPP_ID = SP.SUPP_ID
GROUP BY SP.SUPP_ID
HAVING COUNT(SP.SUPP_ID) >1
)


SELECT * FROM supplier_pricing

--6)	Find the least expensive product from each category and print the table with category id, name, product name and price of the product

SELECT C1.CAT_ID, C1.CAT_NAME, P1.PRO_NAME, SP1.SUPP_PRICE FROM supplier_pricing SP1
INNER JOIN
(
SELECT  MIN (SUPP_PRICE) AS PRICE FROM product P
INNER JOIN category C ON P.CAT_ID = C.CAT_ID
INNER JOIN supplier_pricing SP ON SP.PRO_ID = P.PRO_ID
GROUP BY C.CAT_NAME ) TBL1 ON TBL1.PRICE = SP1.SUPP_PRICE
INNER JOIN product P1 ON SP1.PRO_ID = P1.PRO_ID
INNER JOIN category C1 ON P1.CAT_ID = C1.CAT_ID 

--7)	Display the Id and Name of the Product ordered after “2021-10-05”.

SELECT P.PRO_ID, P.PRO_NAME FROM product P
INNER JOIN supplier_pricing SP ON SP.PRO_ID = P.PRO_ID
INNER JOIN order1 ORD ON ORD.PRICING_ID = SP.PRICING_ID
WHERE ORD.ORD_DATE > '2021-10-05'

--8)	Display customer name and gender whose names start or end with character 'A'.
SELECT CUS_NAME, CUS_GENDER FROM customer
WHERE  SUBSTRING (CUS_NAME,1,1) ='a' OR RIGHT (CUS_NAME,1)='a'


--9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, 
-- print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.


CREATE PROCEDURE SUPPLIER_RATING

AS
BEGIN 
SELECT S.SUPP_ID, S.SUPP_NAME, RAT_RATSTARS, CASE WHEN RAT_RATSTARS =5 THEN 'Excellent Service' WHEN RAT_RATSTARS =4 THEN 'GOOD SERVICE' WHEN RAT_RATSTARS =3 THEN 'AVERAGE SERVICE' 
ELSE  'Poor Service' END FROM order1 ORD
INNER JOIN supplier_pricing SP ON ORD.PRICING_ID = SP.PRICING_ID
INNER JOIN supplier S ON SP.SUPP_ID  = S.SUPP_ID
INNER JOIN rating R ON R.ORD_ID = ORD.ORD_ID

END
--EXEC SUPPLIER_RATING
