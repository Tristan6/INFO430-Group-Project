use [Group3-Final]

CREATE TABLE tblRoomType
(RoomTypeID INTEGER IDENTITY(1,1) primary key,
RoomTypeName varchar(50) NOT NULL,
RoomTypeDescr varchar(500) NULL)
GO

-- This represents a user account
CREATE TABLE tblUser
(UserID INTEGER IDENTITY(1,1) primary key,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Email varchar(500) NOT NULL,
PassHash varchar(500) NOT NULL)
GO

-- This represents a settlement
CREATE TABLE tblHouse
(HouseID INT IDENTITY(1,1) primary key NOT NULL,
HouseName varchar(50) NOT NULL,
HouseDescr varchar(500) NULL)
GO

-- This represents an association with a specific settlement since you 
-- may have multiple people in one settlement, or live between multiple 
-- settlements
CREATE TABLE tblHouseGroup
(HouseGroupID INT IDENTITY(1,1) primary key NOT NULL,
UserID INTEGER FOREIGN KEY REFERENCES tblUser (UserID) NOT NULL,
HouseID INTEGER FOREIGN KEY REFERENCES tblHouse (HouseID) NOT NULL)
GO

-- This represents a settlement
CREATE TABLE tblQuadrant
(QuadrantID INT IDENTITY(1,1) primary key NOT NULL,
QuadrantName varchar(50) NOT NULL,
RoomID INTEGER FOREIGN KEY REFERENCES tblRooms (RoomID) NOT NULL)
GO

-- This represents a settlement
CREATE TABLE tblItem
(ItemID INT IDENTITY(1,1) primary key NOT NULL,
ItemName varchar(50) NOT NULL,
ImgSrc varchar(150) NULL,
LocationDescription varchar(200) NULL,
Condition varchar(50) NOT NULL,
PurchaseDate DATE NULL,
ExpirationDate DATE NULL,
QuadrantID INTEGER FOREIGN KEY REFERENCES tblQuadrant (QuadrantID) NOT NULL,
ItemTypeID INTEGER FOREIGN KEY REFERENCES tblItemType (ItemTypeID) NOT NULL)
GO

CREATE TABLE tblItemType
(ItemTypeID INTEGER IDENTITY(1,1) primary key,
Name varchar(50) not null,
Description varchar(500) NULL)
GO

CREATE TABLE tblFloor
(FloorID INTEGER IDENTITY(1,1) primary key,
Name varchar(50) not null,
HouseID int FOREIGN KEY REFERENCES tblHouse(HouseID))
GO

CREATE TABLE tblRooms
(RoomID INTEGER IDENTITY(1,1) primary key,
Name varchar(50) not null,
RoomTypeID int FOREIGN KEY REFERENCES tblRoomType(RoomTypeID),
FloorID int FOREIGN KEY REFERENCES tblFloor(FloorID))
GO
