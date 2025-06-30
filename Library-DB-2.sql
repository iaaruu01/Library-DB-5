
-- Insert Author 
INSERT INTO `library`.`author` (`AuthorID`, `Name`) VALUES ('1', 'J.K Rowling');
INSERT INTO `library`.`author` (`AuthorID`, `Name`) VALUES ('2', 'George');
INSERT INTO `library`.`author` (`AuthorID`, `Name`) VALUES ('3', 'Dan Brown');
INSERT INTO `library`.`author` (`AuthorID`, `Name`) VALUES ('4', 'Jane Austen');

-- Insert Books

INSERT INTO `library`.`book` (`BookID`, `Title`, `AuthorID`, `CateogryID`) VALUES ('101', 'Harry Potter ', '1', '1');
INSERT INTO `library`.`book` (`BookID`, `Title`, `AuthorID`, `CateogryID`) VALUES ('102', '1984', '2', '2');
INSERT INTO `library`.`book` (`BookID`, `Title`, `AuthorID`, `CateogryID`) VALUES ('103', 'Pride and Prejudice', '3', '3');
INSERT INTO `library`.`book` (`BookID`, `Title`, `AuthorID`, `CateogryID`) VALUES ('104', 'Half Girlfriend', '4', '4');

-- Insert Category

INSERT INTO `library`.`cateogry` (`CategoryID`, `Name`) VALUES ('1', 'Harry Potter');
INSERT INTO `library`.`cateogry` (`CategoryID`, `Name`) VALUES ('2', '1984');
INSERT INTO `library`.`cateogry` (`CategoryID`, `Name`) VALUES ('3', 'Pride and Prejudice');
INSERT INTO `library`.`cateogry` (`CategoryID`, `Name`) VALUES ('4', 'Half Girlfriend');

-- Insert Member

INSERT INTO `library`.`member` (`MemberID`, `Name`, `Email`) VALUES ('301', 'Aarya Gupta', 'aarya@library.com');
INSERT INTO `library`.`member` (`MemberID`, `Name`, `Email`) VALUES ('302', 'Rahul Singh', 'rahul@library.com');
INSERT INTO `library`.`member` (`MemberID`, `Name`, `Email`) VALUES ('303', 'Gaurav Gupta', 'gaurav@library.com');
INSERT INTO `library`.`member` (`MemberID`, `Name`, `Email`) VALUES ('304', 'Anil Kushwah', 'anil@library.com');

-- Updating Email

UPDATE `library`.`member` SET `Email` = 'aarya@gmail.com' WHERE (`MemberID` = '301');
UPDATE `library`.`member` SET `Email` = 'rahul@gmail.com' WHERE (`MemberID` = '302');
UPDATE `library`.`member` SET `Email` = 'gaurav@gmail.com' WHERE (`MemberID` = '303');
UPDATE `library`.`member` SET `Email` = 'anil@gmail.com' WHERE (`MemberID` = '304');

-- Insert Loan

INSERT INTO `library`.`loan` (`LoanID`, `BookID`, ` MemberID`, `LoanDate`, `ReturnDate`) VALUES ('401', '101', '301', '2025-06-01', '2025-07-05');
INSERT INTO `library`.`loan` (`LoanID`, `BookID`, ` MemberID`, `LoanDate`, `ReturnDate`) VALUES ('402', '102', '302', '2025-06-30', '2025-07-01');

-- Insert Staff Data

INSERT INTO `library`.`staff` (`StaffID`, `Name`, `Role`) VALUES ('201', 'Anjali Sharma', 'Librarian');
INSERT INTO `library`.`staff` (`StaffID`, `Name`, `Role`) VALUES ('202', 'Aryan Gupta', 'Assistant');
INSERT INTO `library`.`staff` (`StaffID`, `Name`, `Role`) VALUES ('203', 'Neha Verma', 'Clerk');

-- Update Author

UPDATE `library`.`author` SET `Name` = 'Marry' WHERE (`AuthorID` = '3');

-- Update Book

UPDATE `library`.`book` SET `Title` = 'Harry Potter and the Goblet' WHERE (`BookID` = '101');

-- Delete Staff

DELETE FROM `library`.`staff` WHERE (`StaffID` = '203');

-- Modify Foreign Key in Loan

ALTER TABLE `library`.`loan` 
DROP FOREIGN KEY `BookID`;

-- Modify Constraints in loan table

ALTER TABLE `library`.`loan` 
ADD CONSTRAINT `BookID`
  FOREIGN KEY (`BookID`)
  REFERENCES `library`.`book` (`BookID`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;

-- Modify Foreign Key In Book

ALTER TABLE `library`.`book` 
DROP FOREIGN KEY `AuthorID`;

-- Modify Constraints in Book

ALTER TABLE `library`.`book` 
ADD CONSTRAINT `AuthorID`
  FOREIGN KEY (`AuthorID`)
  REFERENCES `library`.`author` (`AuthorID`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;



