--CREATE SEQUENCES--
Create SEQUENCE Prices_FoodItemTypeID_SEQ;
Create SEQUENCE Campus_CampusID_SEQ;
Create SEQUENCE Position_PositionID_SEQ;
Create SEQUENCE Members_MemberID_SEQ;
Create SEQUENCE FoodItems_FoodItemID_SEQ;
Create SEQUENCE Orders_OrderID_SEQ;

--CREATE TABLES--
Create table CAMPUS(
    CampusID NUMBER(5) DEFAULT Campus_CampusID_SEQ.nextval NOT NULL,
    CampusName varchar2(100),
    Street varchar2(100),
    City varchar2(100),
    State varchar2(100),
    Zip varchar2(100),
    Phone varchar2(100),
    CampusDiscount DECIMAL(2,2),
    
    CONSTRAINT campus_pk PRIMARY KEY(CampusID)
);
Create table POSITION(
    PositionID NUMBER(5) DEFAULT Position_PositionID_SEQ.nextval NOT NULL,
    Position varchar2(100),
    YearlyMembershipFee DECIMAL(7,2),
    
    CONSTRAINT position_pk PRIMARY KEY(PositionID)
);

create table MEMBERS(
    MemberID NUMBER(5)DEFAULT Members_MemberID_SEQ.nextval NOT NULL,
    LastName varchar2(100),
    FirstName varchar2(100),
    CampusAddress varchar2(100),
    CampusPhone varchar2(100),
    CampusID NUMBER(5) NOT NULL,
    PositionID NUMBER(5) NOT NULL,
    ContractDuration NUMBER,
    
    CONSTRAINT members_pk PRIMARY KEY(MemberID),
    CONSTRAINT campus_fk FOREIGN KEY(CampusID) REFERENCES CAMPUS(CampusID),
    CONSTRAINT position_fk FOREIGN KEY(PositionID) REFERENCES POSITION(PositionID)
);


Create table  PRICES(
    FoodItemTypeID NUMBER(5) DEFAULT Prices_FoodItemTypeID_SEQ.nextval NOT NULL,
    MealType varchar2(100),
    MealPrice DECIMAL(7,2),
    
    CONSTRAINT prices_pk PRIMARY KEY(FoodItemTypeID)
);

Create table FOODITEMS(
    FoodItemID NUMBER(5)DEFAULT FOODITEMS_FOODITEMID_SEQ.nextval NOT NULL,
    FoodItemName varchar2(100),
    FoodItemTypeID NUMBER(5) NOT NULL,
    
    CONSTRAINT foodItems_pk PRIMARY KEY(FoodItemID),
    CONSTRAINT prices_fk FOREIGN KEY(FoodItemTypeID) REFERENCES PRICES(FoodItemTypeID)
);

Create table ORDERS(
    OrderID NUMBER(5) DEFAULT ORDERS_ORDERID_SEQ.nextval NOT NULL,
    MemberID NUMBER(5) NOT NULL,
    OrderDate varchar2(25),
    
    CONSTRAINT orders_pk PRIMARY KEY(OrderID),
    CONSTRAINT members_fk FOREIGN KEY(MemberID) REFERENCES MEMBERS(MemberID)
);

Create table ORDERLINE(
    OrderID NUMBER(5) NOT NULL,
    FoodItemID NUMBER(5) NOT NULL,
    Quantity NUMBER,
    
    CONSTRAINT orderLine_pk PRIMARY KEY(OrderID, FoodItemID),
    CONSTRAINT orders_fk FOREIGN KEY(OrderID) REFERENCES ORDERS(OrderID),
    CONSTRAINT foodItems_fk FOREIGN KEY(FoodItemID) REFERENCES FOODITEMS(FoodItemID)
);

--INSERT DATA--

    --TABLE: CAMPUS--
insert into campus values('1','IUPUI','425 University Blvd.','Indianapolis', 'IN','46202', '317-274-4591',.08);
insert into campus values('2','Indiana University','107 S. Indiana Ave.','Bloomington', 'IN','47405', '812-855-4848',.07);
insert into campus values('3','Purdue University','475 Stadium Mall Drive','West Lafayette', 'IN','47907', '765-494-1776',.06);
    
    --TABLE: POSITION--
insert into POSITION values('1','Lecturer', 1050.50);
insert into POSITION values('2','Associate Professor', 900.50);
insert into POSITION values('3','Assistant Professor', 875.50);
insert into POSITION values('4','Professor', 700.75);
insert into POSITION values('5','Full Professor', 500.50);
    
    --TABLE: MEMBERS--
insert into MEMBERS values('1','Ellen','Monk','009 Purnell', '812-123-1234', '2', '5', 12);
insert into MEMBERS values('2','Joe','Brady','008 Statford Hall', '765-234-2345', '3', '2', 10);
insert into MEMBERS values('3','Dave','Davidson','007 Purnell', '812-345-3456', '2', '3', 10);
insert into MEMBERS values('4','Sebastian','Cole','210 Rutherford Hall', '765-234-2345', '3', '5', 10);
insert into MEMBERS values('5','Michael','Doo','66C Peobody', '812-548-8956', '2', '1', 10);
insert into MEMBERS values('6','Jerome','Clark','SL 220', '317-274-9766', '1', '1', 12);
insert into MEMBERS values('7','Bob','House','ET 329', '317-278-9098', '1', '4', 10);
insert into MEMBERS values('8','Bridget','Stanley','SI 234', '317-274-5678', '1', '1', 12);
insert into MEMBERS values('9','Bradley','Wilson','334 Statford Hall', '765-258-2567', '3', '2', 10);
    
    --TABLE: PRICES--
INSERT INTO PRICES(MealType, MealPrice) 
    VALUES('Beer/Wine', 5.50 );
INSERT INTO PRICES(MealType, MealPrice) 
    VALUES('Dessert', 2.75);
INSERT INTO PRICES(MealType, MealPrice) 
    VALUES('Dinner', 15.50 );
INSERT INTO PRICES(MealType, MealPrice) 
    VALUES('Soft Drink', 2.50);
INSERT INTO PRICES(MealType, MealPrice) 
    VALUES('Lunch', 7.25 );
    
    --TABLE: FOODITEM--
insert into FOODITEMS values('10001','Lager', '1');
insert into FOODITEMS values('10002','Red Wine', '1');
insert into FOODITEMS values('10003','White Wine', '1');
insert into FOODITEMS values('10004','Coke', '4');
insert into FOODITEMS values('10005','Coffee', '4');
insert into FOODITEMS values('10006','Chicken a la King', '3');
insert into FOODITEMS values('10007','Rib Steak', '3');
insert into FOODITEMS values('10008','Fish and Chips', '3');
insert into FOODITEMS values('10009','Veggie Delight', '3');
insert into FOODITEMS values('10010','Chocolate Mousse', '2');
insert into FOODITEMS values('10011','Carrot Cake', '2');
insert into FOODITEMS values('10012','Fruit Cup', '2');
insert into FOODITEMS values('10013','Fish and Chips', '5');
insert into FOODITEMS values('10014','Angus Beef Burger', '5');
insert into FOODITEMS values('10015','Cobb Salad', '5');

    --TABLE: ORDER--
insert into ORDERS values('1', '9', 'March 5, 2005');
insert into ORDERS values('2', '8', 'March 5, 2005');
insert into ORDERS values('3', '7', 'March 5, 2005');
insert into ORDERS values('4', '6', 'March 7, 2005');
insert into ORDERS values('5', '5', 'March 7, 2005');
insert into ORDERS values('6', '4', 'March 10, 2005');

    --TABLE: ORDERLINE--
insert into ORDERLINE values('1','10001',1);
insert into ORDERLINE values('1','10006',1);
insert into ORDERLINE values('1','10012',1);
insert into ORDERLINE values('2','10004',2);
insert into ORDERLINE values('2','10013',1);
insert into ORDERLINE values('2','10014',1);
insert into ORDERLINE values('3','10005',1);
insert into ORDERLINE values('3','10011',1);
insert into ORDERLINE values('4','10005',2);
insert into ORDERLINE values('4','10004',2);
insert into ORDERLINE values('4','10006',1);
insert into ORDERLINE values('4','10007',1);
insert into ORDERLINE values('4','10010',2);
insert into ORDERLINE values('5','10003',1);
insert into ORDERLINE values('6','10002',2);
insert into ORDERLINE values('7','10005',2);
insert into ORDERLINE values('8','10005',1);
insert into ORDERLINE values('8','10011',1);
insert into ORDERLINE values('9','10001',1);

--Bai 1: Liet ke tat ca cóntrains trong database--
SELECT *
  FROM user_constraints
  WHERE OWNER = 'SHINHANDBS'
  AND TABLE_NAME IN(SELECT table_name FROM all_tables WHERE OWNER='SHINHANDBS');
  
--Bai 2: Liet ke tat ca ten bang trong database--
SELECT TABLE_NAME FROM USER_TABLES;

--Bai 3: Liet ke ten tat ca sequence trong database--
select *from user_sequences;

--Bai 4: Liet ke cac thanh vien voi cac cot ... Sap xep theo ten dai hoc giam dan, tiep theo LastName tang dan--
Select FirstName, LastName, Position, CampusName, YearlyMemberShipFee/12 as Monthly_Dues
FROM MEMBERS
FULL OUTER JOIN POSITION
ON MEMBERS.PositionID = POSITION.PositionID
FULL OUTER JOIN CAMPUS
ON MEMBERS.CampusID = campus.campusid
ORDER BY CampusName DESC, LastName ASC;
