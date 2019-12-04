use [Group3-Final]
GO

CREATE PROCEDURE insert_House
@Name varchar(50),
@Description varchar(500)

AS

INSERT INTO tblHouse (HouseName, HouseDescr)
VALUES(@Name, @Description)

GO

CREATE PROCEDURE insert_HouseGroup
@FirstName varchar(50),
@LastName varchar(50),
@Email varchar(500),
@HouseName varchar(50)

AS

DECLARE @U_ID INT
DECLARE @H_ID INT

SET @U_ID = (SELECT U.UserID 
			 FROM tblUser U 
			 WHERE U.FirstName = @FirstName AND
				   U.LastName = @LastName AND
				   U.Email = @Email)

SET @H_ID = (SELECT H.HouseID 
			 FROM tblHouse H 
			 WHERE H.HouseName = @HouseName)

INSERT INTO tblHouseGroup(UserID, HouseID)
VALUES (@U_ID, @H_ID)
GO


CREATE PROCEDURE insert_Item
@ItemName varchar(50),
@ImgSrc varchar(150),
@LocationDescription varchar(200),
@Condition varchar(50),
@PurchaseDate DATE,
@ExpirationDate DATE,
@QuadrantName varchar(50),
@ItemTypeName varchar(50),
@RoomName varchar(50)

AS

DECLARE @R_ID INT
DECLARE @Q_ID INT
DECLARE @IT_ID INT

SET @R_ID = (SELECT R.RoomID FROM tblRoom R WHERE R.RoomName = @RoomName)
SET @Q_ID = (SELECT Q.QuadrantID 
			 FROM tblQuadrant Q 
			 WHERE Q.QuadrantName = @QuadrantName AND Q.RoomID = @R_ID)
SET @IT_ID = (SELECT IT.ItemTypeID FROM tblItemType IT WHERE IT.ItemTypeName = @ItemTypeName)

INSERT INTO tblItem(ItemName, ImgSrc, LocationDescription, Condition, 
					PurchaseDate, ExpirationDate, QuadrantID, ItemTypeID)
VALUES(@ItemName, @ImgSrc, @LocationDescription, @Condition, 
					@PurchaseDate, @ExpirationDate, @Q_ID, @IT_ID)
GO

CREATE PROCEDURE insert_ItemType
@Name varchar(50),
@Description varchar(500)

AS

INSERT INTO tblItemType(ItemTypeName, ItemTypeDescription)
VALUES(@Name, @Description)
GO



CREATE PROCEDURE insert_Quadrant
@Name varchar(50),
@RoomName varchar(50)

AS 

DECLARE @R_ID INT

SET @R_ID = (SELECT R.RoomID FROM tblRoom R WHERE R.RoomName = @RoomName)

INSERT INTO tblQuadrant(QuadrantName,RoomID)
VALUES(@Name, @R_ID)
GO



CREATE PROCEDURE insert_Room
@Name varchar(50),
@HouseName varchar(50),
@RoomTypeName varchar(50)

AS

DECLARE @H_ID INT
DECLARE @RT_ID INT

SET @H_ID = (SELECT H.HouseID FROM tblHouse H WHERE H.HouseName = @HouseName)
SET @RT_ID = (SELECT RT.RoomTypeID FROM tblRoomType RT WHERE RT.RoomTypeName = @RoomTypeName)

INSERT INTO tblRoom (RoomName,HouseID, RoomTypeID)
VALUES(@Name, @H_ID, @RT_ID)
GO

CREATE PROCEDURE insert_RoomType
@Name varchar(50),
@Description varchar(500)

AS

INSERT INTO tblRoomType(RoomTypeName, RoomTypeDescr)
VALUES(@Name, @Description)
GO

CREATE PROCEDURE insert_User
@FirstName varchar(50),
@LastName varchar(50),
@Email varchar(500),
@PassHash varchar(500)

AS 

INSERT INTO tblUser(FirstName, LastName, Email, PassHash)
VALUES(@FirstName, @LastName, @Email, @PassHash)
GO