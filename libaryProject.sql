CREATE DATABASE db_library;
GO
USE db_library;
GO

CREATE TABLE tbl_Library_Branch(
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1), 
	BranchName varchar(50) NOT NULL,
	Address varchar(50) NOT NULL
);
GO

CREATE TABLE tbl_Borrowers(
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
	Name varchar(100) NOT NULL,
	Address varchar(100) NOT NULL,
	Phone varchar(50)NULL
);
GO

CREATE TABLE tbl_Publisher(
	PublisherName varchar(150) PRIMARY KEY NOT NULL,
	Address varchar(75) NOT NULL,
	Phone varchar(50) NOT NULL,
);
GO

CREATE TABLE tbl_Books(
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Title varchar(150) NOT NULL,
	PublisherName varchar(150) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES tbl_Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
);
GO

CREATE TABLE tbl_Book_Authors(
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES tbl_Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName varchar(50) NOT NULL,
);
GO

CREATE TABLE tbl_Book_Copies(
	BookID INT NOT NULL CONSTRAINT fkey_BookID FOREIGN KEY REFERENCES tbl_Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fKey_BranchID FOREIGN KEY REFERENCES tbl_Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);
GO

CREATE TABLE tbl_Book_Loans(
	BookID INT NOT NULL CONSTRAINT foreignkey_BookID FOREIGN KEY REFERENCES tbl_Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT forgeinkey_BranchID FOREIGN KEY REFERENCES tbl_Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT foreignkey_CardNo FOREIGN KEY REFERENCES tbl_Borrowers(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut varchar(50) NOT NULL,
	DateDue varchar(50) NOT NULL
);
GO

INSERT INTO tbl_Library_Branch
	(BranchName,Address)
	VALUES
	('Columbia City','4721 Rainier Ave S, Seattle, WA 98118'),
	('Rainier Beach','9125 Rainier Ave S, Seattle, WA 98118'),
	('Central','1000 Fourth Ave, Seattle, WA 98104'),
	('Sharpstown','1234 First Ave, Seattle, WA. 98134'),
	('Queen Anne','400 W Garfield St, Seattle, WA 98119')
;

INSERT INTO tbl_Borrowers
	(Name,Address,Phone)
	VALUES
	('Michael Strunk','325 S. 3rd St. Renton,WA. 98057','206-488-3584'),
	('Anne Le','1234 DeadEnd St. Seattle,WA. 98118','206-354-3289'),
	('Sam Smith','5678 Mission St. Seattle,WA. 98134','206-456-9023'),
	('Jennifer Aniston','7982 Hollywood Ave Seattle,WA. 98114','206-725-1996'),
	('Brad Pitt','9999 Madison St. Seattle,WA. 91056','206-723-8584'),
	('Matt Damon','8675 Fourth Ave. Seattle,WA.98114','206-437-1067'),
	('Ben Affleck','2356 First Ave. Seattle, WA. 98567','425-723-6565'),
	('Cate Blanchett','9854 Othello St. Seattle, WA. 90123','509-689-0424'),
	('Peter Jackson','8990 S. Alaska St. Seattle,WA. 98119','206-367-2390'),
	('Cindy Crawford','2700 Rainier Ave South Seattle,WA.98144','206-723-5400'),
	('Emily Blunt','3125 South Graham St.Seattle,WA. 98118','717-238-1078')
; 

INSERT INTO tbl_Publisher
	(PublisherName,Address,Phone)
	VALUES
	('G.P. Putnam''s Sons','375 Hudson St. New York, NY 10014','212-366-2000'),
	('Gallery Books','1230 6th Ave, New York, NY 10020','212-698-7243'),
	('Pocket Books','1230 Avenue of the Americas New York, NY 10020','212-698-7006'),
	('Broadway Books','1745 Broadway New York, NY 10019, New York, NY 10019','800-793-2665'),
	('Signet','1745 Broadway New York, NY 10019, New York, NY 10019','800-793-2665'),
	('St. Martin''s Griffin','175 5th Avenue New York, NY 10010','212-674-6132'),
	('Scribner','1230 Avenue of the Americas New York, NY 10020','212-632-4915'),
	('Dover Publications','31 2nd St, Mineola, NY 11501','516-294-7000'),
	('CreateSpace Independent Publishing Platform','4900 Lacross Rd, North Charleston, SC 29406','843-308-0971'),
	('Dutton','375 Hudson St, New York, NY 10014','212-366-2000'),
	('W. W. Norton & Company','500 5th Ave # 6, New York, NY 10110','212-354-5500'),
	('Thomas Nelson','501 Nelson Pl, Nashville, TN 37214','615-889-9000'),
	('Grand Central Publishing','1290 6th Ave, New York, NY 10104','212-364-1100'),
	('Random House','1745 Broadway New York, NY 10019, New York, NY 10019','800-793-2665'),
	('Simon & Schuster','1230 6th Ave, New York, NY 10020','212-698-7033'),
	('HarperFestival','195 Broadway, New York, NY 10007','212-207-7000'),
	('Parragon','440 Park Ave #13, New York, NY 10016','212-629-9773'),
	('Harper Perennial Modern Classics','195 Broadway, New York, NY 10007','212-207-7000'),
	('Mariner Books','181 Ballardvale Street Wilmington, MA 01887', '800-225-3362'),
	('Little, Brown and Company','121 S Enterprise Blvd, Lebanon, IN 46052','765-483-9900'),
	('Penguine Classics','1745 Broadway New York, NY 10019','212-782-9000'),
	('Vintage Books','1745 Broadway New York, NY 10019, New York, NY 10019','800-793-2665'),
	('Pedigree','300 Funston Avenue San Francisco, CA 94118','415-561-6767'),
	('St. Martin''s Press','Flatiron Building, 175 5th Ave, New York, NY 10010','212-226-7521')
;

INSERT INTO tbl_Books
	(Title,PublisherName)
	VALUES
	('Where The Crawdads Sing','G.P. Putnam''s Sons'),
	('Solve For Happy: Engineer Your Path to Joy','Gallery Books'),
	('How to Win Friends and Influence People','Pocket Books'),
	('Tuesdays with Morrie','Broadway Books'),
	('The Fountainhead','Signet'),
	('Shantaram','St. Martin''s Griffin'),
	('A Separate Peace','Scribner'),
	('The Autobiography of Benjamin Franklin','Dover Publications'),
	('Mini Habits: Smaller Habits, Bigger Results','CreateSpace Independent Publishing Platform'),
	('Unqualified','Dutton'),
	('Happy Brain','W. W. Norton & Company'),
	('Girl, Wash Your Face: Stop Believing the Lies About Who 
	You Are so You Can Become Who You Were Meant to Be','Thomas Nelson'),
	('Make Your Bed','Grand Central Publishing'),
	('Educated: A Memoir','Random House'),
	('Principles: Life and Work','Simon & Schuster'),
	('The Great Alone','St. Martin''s Press'),
	('Goodnight Moon','HarperFestival'),
	('The Ugly Duckling','Parragon'),
	('The Old Man and The Sea','Scribner'),
	('The Great Gatsby','Scribner'),
	('To Kill a Mockingbird','Harper Perennial Modern Classics'),
	('Lord of the Flies','Pedigree'),
	('Boy''s Life','Pocket Books'),
	('The Awakening','CreateSpace Independent Publishing Platform'),
	('As I Lay Dying','Vintage Books'),
	('All the Pretty Horses','Vintage Books'),
	('The Color Purple','Mariner Books'),
	('Their Eyes Were Watching God','Harper Perennial Modern Classics'),
	('The Catcher in the Rye','Little, Brown and Company'),
	('The Lost Tribe','Penguine Classics'),
	('Elevation','Scribner')
;

INSERT INTO tbl_Book_Authors
	(BookID,AuthorName)
	VALUES
	('1', 'Delia Owens'),
	('2', 'Mo Gawdat'),
	('3', 'Dale Carnegie'),
	('4','Mitch Albom'),
	('5','Ayn Rand'),
	('6','Gregory David Roberts'),
	('7','John Knowles'),
	('8','Benjamin Franklin'),
	('9','Stephen Guise'),
	('10','Anna Faris'),
	('11','Dean Burnett'),
	('12','Rachel Hollis'),
	('13','William H. McRaven'),
	('14','Tara Westover'),
	('15','Ray Dalio'),
	('16','Kristin Hannah'),
	('17','Margaret Wise Brown'),
	('18','Sarah Delmege'),
	('19','Ernest Hemingway'),
	('20','F. Scott Fitzgerald'),
	('21','Harper Lee'),
	('22','William Golding'),
	('23','Robert McCammon'),
	('24','Kate Chopin'),
	('25','William Faulkner'),
	('26','Cormac McCarthy'),
	('27','Alice Walker'),
	('28','Zora Neale Hurston'),
	('29','J.D. Salinger'),
	('30','Stephen King'),
	('31','Stephen King')	
;
		
INSERT INTO tbl_Book_Copies
	(BookID,BranchID,Number_Of_Copies)
	VALUES
	('2','1','5'),('5','1','3'),('21','1','7'),('1','1','10'),('16','1','8'),
	('8','1','6'),('18','1','9'),('23','1','2'),('4','1','4'),('27','1','6'),
	('24','2','5'),('3','2','8'),('2','2','4'),('29','2','3'),('21','2','3'),
	('1','2','5'),('10','2','6'),('20','2','4'),('11','2','4'),('28','2','7'),
	('4','3','2'),('13','3','5'),('7','3','3'),('25','3','9'),('2','3','4'),
	('9','3','3'),('20','3','8'),('3','3','6'),('18','3','5'),('12','3','4'),
	('17','3','2'),('31','3','4'),('30','3','2'),('1','4','11'),('3','4','4'),
	('7','4','2'),('8','4','2'),('10','4','3'),('12','4','2'),('13','4','5'),
	('14','4','3'),('16','4','3'),('18','4','3'),('22','4','5'),('23','4','7'),
	('30','4','8'),('4','5','4'),('6','5','2'),('9','5','9'),('11','5','4'),
	('12','5','4'),('13','5','5'),('14','5','6'),('15','5','8'),('17','5','3'),
	('18','5','4'),('19','5','3'),('21','5','6'),('29','5','4'),('30','5','4')
;

INSERT INTO tbl_Book_Loans
	(BookID,BranchID,CardNo,DateOut,DateDue)
	VALUES
	('24','4','1007','01-25-19','02-19-19'),('31','4','1005','01-16-19','02-19-19'),
	('1','1','1000','02-12-18','03-05-18'),('4','1','1000','02-12-18','03-05-18'),
	('25','1','1000','02-12-18','03-05-18'),('8','1','1000','02-12-18','03-05-18'),
	('14','3','1000','01-18-18','02-015-18'),('7','3','1001','09-30-18','10-21-18'),
	('9','3','1001','09-30-18','10-21-18'),('1','5','1003','04-15-18','05-06-18'),
	('12','5','1003','04-15-18','05-06-18'),('25','5','1003','04-15-18','05-06-18'),
	('27','5','1003','04-15-18','05-06-18'),('11','5','1003','04-15-18','05-06-18'),
	('13','5','1003','04-15-18','05-06-18'),('18','5','1003','04-15-18','05-06-18'),
	('3','3','1009','06-15-18','07-06-18'),('6','5','1009','06-15-18','07-06-18'),
	('20','5','1009','06-15-18','07-06-18'),('29','2','1006','11-11-18','11-30-18'),
	('24','4','1004','03-22-18','04-14-18'),('3','4','1009','06-15-18','07-06-18'),
	('22','2','1006','11-11-18','11-30-18'),('20','2','1006','11-11-18','11-30-18'),
	('20','2','1006','11-11-18','11-30-18'),('1','2','1006','11-11-18','11-30-18'),
	('4','3','1007','11-11-18','11-30-18'),('29','2','1007','11-11-18','11-30-18'),
	('5','2','1008','11-14-18','12-08-18'),('29','2','1006','11-14-18','12-30-18'),
	('8','3','1009','07-11-18','08-04-18'),('13','5','1006','09-1-18','09-30-18'),
	('10','4','1004','05-11-18','06-05-18'),('30','2','1002','02-11-18','03-03-18'),
	('11','1','1009','01-11-19','02-02-19'),('31','5','1003','04-04-18','05-01-18'),
	('12','5','1002','01-18-19','02-06-19'),('15','2','1005','09-02-18','11-30-18'),
	('14','2','1004','11-15-18','12-30-18'),('7','3','1008','12-11-18','01-04-19'),
	('17','3','1005','08-11-18','09-30-18'),('19','2','1002','12-12-18','12-30-18'),
	('29','4','1003','04-17-18','05-30-18'),('29','1','1008','03-20-18','04-15-18'),
	('28','2','1005','06-11-18','08-30-18'),('3','1','1009','10-04-18','11-02-18'),
	('27','3','1007','05-11-18','05-30-18'),('30','2','1008','10-07-18','11-02-18'),
	('31','3','1005','02-11-18','03-05-18'),('3','2','1005','01-11-18','01-30-18'),
	('18','2','1009','04-26-18','05-05-18'),('13','4','1007','02-02-19','02-27-19'),
	('10','1','1008','06-06-18','08-01-18'),('4','2','1003','09-12-18','09-30-18'),
	('30','3','1006','04-11-18','04-30-18'),('31','3','1008','08-08-18','09-05-18')
;


USE db_library;

/*1*/
GO
CREATE PROCEDURE Library_Project_Querry_1 
AS

SELECT Number_Of_Copies FROM tbl_Book_Copies 
INNER JOIN tbl_Library_Branch ON tbl_Book_Copies.BranchID=tbl_Library_Branch.BranchID
INNER JOIN tbl_Books ON tbl_Book_Copies.BookID=tbl_Books.BookID
WHERE BranchName = 'Sharpstown' AND Title ='The Lost Tribe'

GO
EXEC Library_Project_Querry_1
 

/*2*/
GO
CREATE PROCEDURE Library_Project_Querry_2
AS

SELECT tbl_Library_Branch.BranchName, tbl_Book_Copies.Number_Of_Copies FROM tbl_Book_Copies 
INNER JOIN tbl_Library_Branch ON tbl_Library_Branch.BranchID=tbl_Book_Copies.BranchID
INNER JOIN tbl_Books ON tbl_Books.BookID=tbl_Book_Copies.BookID
Where tbl_Books.Title='The Lost Tribe';

GO
EXEC Library_Project_Querry_2
		

/*3*/
GO
CREATE PROCEDURE Library_Project_Querry_3
AS
	
SELECT * FROM tbl_Borrowers
WHERE NOT EXISTS
(SELECT * FROM tbl_Book_Loans WHERE tbl_Borrowers.CardNo=tbl_Book_Loans.CardNo);

GO
EXEC Library_Project_Querry_3
	

/*4*/
GO
CREATE PROCEDURE Library_Project_Querry_4
AS
	
SELECT tbl_Borrowers.Name, tbl_Borrowers.Address, tbl_Books.Title FROM tbl_Book_Loans
INNER JOIN tbl_Books ON tbl_Book_Loans.BookID=tbl_Books.BookID
INNER JOIN tbl_Borrowers ON tbl_Book_Loans.CardNo=tbl_Borrowers.CardNo
INNER JOIN tbl_Library_Branch ON tbl_Book_Loans.BranchID=tbl_Library_Branch.BranchID
WHERE BranchName='Sharpstown' AND DateDue ='02-19-19';

GO
EXEC Library_Project_Querry_4


/*5*/
GO
CREATE PROCEDURE Library_Project_Querry_5
AS
	
SELECT tbl_Library_Branch.BranchName, COUNT(tbl_Book_Loans.BranchID) AS NumberOfBooksLoaned
FROM tbl_Book_Loans
INNER JOIN tbl_Library_Branch ON tbl_Library_Branch.BranchID = tbl_Book_Loans.BranchID
GROUP BY tbl_Library_Branch.BranchName;

GO
EXEC Library_Project_Querry_5


/*6*/
GO
CREATE PROCEDURE Library_Project_Querry_6
AS

SELECT tbl_Borrowers.Name, tbl_Borrowers.Address,
COUNT(tbl_Book_Loans.BranchID) AS NumberOfBooksLoaned
FROM (tbl_Book_Loans
INNER JOIN tbl_Borrowers ON tbl_Borrowers.CardNo = tbl_Book_Loans.CardNo)
GROUP BY tbl_Borrowers.Name, tbl_Borrowers.Address
HAVING COUNT(tbl_Book_Loans.BranchID) > 5;

GO
EXEC Library_Project_Querry_6


/*7*/
GO
CREATE PROCEDURE Library_Project_Querry_7
AS

SELECT DISTINCT tbl_Books.Title, tbl_library_branch.BranchName,tbl_Book_Authors.AuthorName, tbl_Book_Copies.Number_Of_Copies
FROM tbl_Library_Branch
INNER JOIN tbl_Book_Copies ON tbl_Library_Branch.BranchID=tbl_Book_Copies.BranchID
INNER JOIN tbl_Books ON tbl_Books.BookID=tbl_Book_Copies.BookID
INNER JOIN tbl_Book_Authors ON tbl_Book_Authors.BookID=tbl_Books.BookID
WHERE tbl_Library_Branch.BranchName = 'Central' AND tbl_Book_Authors.AuthorName='Stephen King';

GO
EXEC Library_Project_Querry_7


