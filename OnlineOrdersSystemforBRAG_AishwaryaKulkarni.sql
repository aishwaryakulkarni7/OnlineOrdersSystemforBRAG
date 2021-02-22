CREATE DATABASE OnlineOrders;
USE OnlineOrders;
CREATE TABLE Customer(
Customer_Number VARCHAR(10) PRIMARY KEY,
Customer_Name VARCHAR(225),
Customer_Address VARCHAR(225),
Customer_Phone_Number VARCHAR(10),
Customer_Email VARCHAR(225)
);
INSERT INTO Customer ( Customer_Number, Customer_Name, Customer_Address, Customer_Phone_Number, Customer_Email)
VALUES ('C17',	'John Grant',	'225 WEST STATION SQUARE DRIVE, PITTSBURGH, PA, 15219, 781', '7993378',	'John@grant.com'),
('C20',	'Jane Nicks', '2200 PENNSYLVANIA AVENUE NW, WASHINGTON, DC, 20037, 569', '4423796',	'Jane@nicks.com'),
('C35',	'Bob Felton', '100 CRYSTAL A DRIVE, HERSHEY, PA, 17033, 248', '2604235', 'Bob@Felton.com'),
('C493', 'Jill Young',	'500 FRANK W BURR BOULEVARD, TEANECK, NJ, 7666, 903', '5970279', 'Jill@Young.com'),
('C856', 'Russ Jackson', '500 WEST MADISON STREET, CHICAGO, IL, 60661, 878', '8658690', 'Russ@Young.com'),
('C866', 'Chris George', '7500 DALLAS PARKWAY, PLANO, TX, 75024, 977', '8250256', 'Chris@George.com'),
('C885', 'Sam Stevenson', '250 PARKCENTER BOULEVARD, BOISE, ID, 83706, 359', '3635559',	'Sam@Stevenson.com'),
('C935', 'Jane Newell',	'3600 LAS VEGAS BOULEVARD SOUTH, LAS VEGAS, NV, 89109, 292', '4803403',	'Jane@Newell.com'),
('C959', 'Rick Mason', '1 VALERO WAY, SAN ANTONIO, TX, 78249, 696', '2953646', 'Rick@Mason.com'),
('C1002', 'Lilly Walters', '1025 WEST NASA BOULEVARD, MELBOURNE, FL, 32919, 913', '2816703', 'Lilly@Watson.com');
CREATE TABLE Item(
Item_Number VARCHAR(225) PRIMARY KEY,
Item_Description VARCHAR(225),
Item_Price DECIMAL(10,2),
Item_Weight DECIMAL(10,2),
Annual_Sales INT,
Stock_Location VARCHAR(225)
);
INSERT INTO Item( Item_Number, Item_Description, Item_Price, Item_Weight, Annual_Sales, Stock_Location)
VALUES ('PL638-JD',	'Footwear',	'6.28',	'4', '306',	'A1976'),
('PL538-JD', 'Footwear', '2.12', '4', '16', 'A1976'),
('PL530-JD', 'Footwear', '4.03', '4', '748', 'A1976'),
('PP24007',	'Neckwear',	'12.69', '0.15', '24',	'E4347'),
('143978',	'Neckwear',	'1.24', '0.15',	'56',	'E4347'),
('PP24006',	'Neckwear', '2.56',	'0.15',	'2', 'E4347'), 
('143969',	'Neckwear',	'1.32', '0.15',	'15',	'X3359'),
('TH4H580',	'Outerwear', '6.97', '4.25', '1', 'D9463'),
('TH4H690',	'Outerwear', '13.92', '4.25', '13',	'D9463'),
('TH3H390',	'Outerwear', '7.17', '4.25', '3', 'D9463'),
('71', 'Shirts', '14.83', '0.3', '6672',  'A9309'),
('25', 'Shirts', '14.31', '0.3', '1016', 'A9309'),
('38', 'Shirts', '15.11', '0.3', '52',	'A9309'),
('14', 'Shirts', '5.82', '0.3',	'96', 'A9309'),
('18', 'Shirts', '7.47', '0.3',	'140', 'A9309'),
('121332-0036',	'Slacks', '10.01',	'0.45',	'2704',	'J6699'),
('841188',	'Slacks',	'14.91',	'0.45',	'85',	'L3234'),
('121312-0026',	'Slacks',	'12.91',	'0.45',	'60',	'J6699'),
('842722',	'Slacks',	'13.74', '0.45',	'131',	'L3234'),
('699933',	'Slacks',	'12.04',	'0.45',	'506',	'L3234');
CREATE TABLE CustomerOrders(
Order_Number VARCHAR(10),
Number_of_Items INT,
Order_Date DATE,
Req_Ship_Date DATE,
Actual_Ship_Date DATE,
Shipping_Carrier VARCHAR(225),
Customer_Number VARCHAR(10),
Item_Number VARCHAR(225),
PRIMARY KEY(Customer_Number,Item_Number),
        FOREIGN KEY(Customer_Number) REFERENCES Customer(Customer_Number)
			ON UPDATE CASCADE
            ON DELETE CASCADE,
        FOREIGN KEY (Item_Number) REFERENCES Item(Item_Number)
			ON UPDATE CASCADE
            ON DELETE CASCADE,
Item_Quantities INT
);
INSERT INTO CustomerOrders( Order_Number, Number_of_Items, Order_Date, Req_Ship_Date, Actual_Ship_Date, Shipping_Carrier, Customer_Number,Item_Number, Item_Quantities)
VALUES('16658443',	5,	'2019-10-9',	'2019-10-9',	'2019-10-9',	'FedEX FFL',	'C17',  'PL638-JD',	1),
			  ('16658443',	5,	'2019-10-9',	'2019-10-9',	'2019-10-9',	'FedEX FFL',	'C17', '121332-0036',	1),
              ('16658443',	5,	'2019-10-9',	'2019-10-9',	'2019-10-9',	'FedEX FFL',	'C17', '143978',	2),
              ('16658443',	5,	'2019-10-9',	'2019-10-9',	'2019-10-9',	'FedEX FFL',	'C17', 'TH4H580',	1),
              ('16658443',	5,	'2019-10-9',	'2019-10-9',	'2019-10-9',	'FedEX FFL',	'C17', '71',	3),
              ('16639375',	3,	'2019-11-19',	'2019-11-19',	'2019-11-19',	'Customer Pickup ',	'C1002', 'TH4H690',	1),
              ('16639375',	3,	'2019-11-19',	'2019-11-19',	'2019-11-19',	'Customer Pickup ',	'C1002', '143969',	1),
              ('16639375',	3,	'2019-11-19',	'2019-11-19',	'2019-11-19',	'Customer Pickup ',	'C1002', 'PL638-JD', 2),
			  ('16662968',	2,	'2019-11-19',	'2019-11-19',	'2019-11-19',	'UPS Ground',	'C935', '121332-0036',	2),
              ('16662968',	2,	'2019-11-19',	'2019-11-19',	'2019-11-19',	'UPS Ground',	'C935' ,'18',	1),
              ('16660133',	4,	'2019-11-13',	'2019-11-13',	'2019-11-13',	'UPS Ground',	'C493', 'TH4H690',	1),
              ('16660133',	4,	'2019-11-13',	'2019-11-13',	'2019-11-13',	'UPS Ground',	'C493', '121312-0026',	2),
              ('16660133',	4,	'2019-11-13',	'2019-11-13',	'2019-11-13',	'UPS Ground',	'C493', 'PL530-JD',	1),
              ('16660133',	4,	'2019-11-13',	'2019-11-13',	'2019-11-13',	'UPS Ground',	'C493', '38',	2),
              ('16663993',	3,	'2019-11-17',	'2019-11-17',	'2019-11-17',	'DHL Ground',	'C866', '841188',	1),
              ('16663993',	3,	'2019-11-17',	'2019-11-17',	'2019-11-17',	'DHL Ground',	'C866', '71',	1),
              ('16663993',	3,	'2019-11-17',	'2019-11-17',	'2019-11-17',	'DHL Ground',	'C866', '699933',	2),
              ('16656274',	2,	'2019-11-8',	'2019-11-8',	'2019-11-8',	'FedEX FFL',	'C493', '841188',	2),
              ('16656274',	2,	'2019-11-8',	'2019-11-8',	'2019-11-8',	'FedEX FFL',	'C493', '71',	2),
              ('16645282',	4,	'2019-11-7',	'2019-11-7',	'2019-11-20',	'DHL Ground',	'C35', '143978',	2),
              ('16645282',	4,	'2019-11-7',	'2019-11-7',	'2019-11-20',	'DHL Ground',	'C35', 'TH4H580',	1),
              ('16645282',	4,	'2019-11-7',	'2019-11-7',	'2019-11-20',	'DHL Ground',	'C35', '699933',	2),
              ('16645282',	4,	'2019-11-7',	'2019-11-7',	'2019-11-20',	'DHL Ground',	'C35', '38',	2),
              ('16644074',	2,	'2019-10-25',	'2019-10-25',	'2019-10-25',	'UPS Ground',	'C20', 'PP24006',	2),
              ('16644074',	2,	'2019-10-25',	'2019-10-25',	'2019-10-25',	'UPS Ground',	'C20', 'PL638-JD',	1),
			  ('16642826',	4,	'2019-10-12',	'2019-10-12',	'2019-10-13',	'DHL Ground',	'C20', '25',	4),
              ('16642826',	4,	'2019-10-12',	'2019-10-12',	'2019-10-13',	'DHL Ground',	'C20', '121332-0036',	4),
              ('16642826',	4,	'2019-10-12',	'2019-10-12',	'2019-10-13',	'DHL Ground',	'C20', 'PP24007',	1),
              ('16642826',	4,	'2019-10-12',	'2019-10-12',	'2019-10-13',	'DHL Ground',	'C20', '14',	1);
USE OnlineOrders;
ALTER TABLE Item
ADD Stock_on_Hand INT,
ADD DonationToCharity decimal(8,4);

UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = 'PL638-JD';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = 'PL538-JD';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = 'PL530-JD';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = 'PP24007';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = '143978';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = 'PP24006';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = '143969';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = 'TH4H580';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = 'TH4H690';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = 'TH3H390';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = '71';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = '25';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = '38';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = '14';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = '18';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = '121332-0036';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = '841188';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number = '121312-0026';
UPDATE item SET DonationToCharity = Item_Price * Annual_Sales * 0.05 WHERE Item_Number= '842722';
UPDATE item SET DonationToCharity =Item_Price * Annual_Sales * 0.05 WHERE Item_Number = '699933';

select * from item;

