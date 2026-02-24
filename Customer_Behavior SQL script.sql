CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Table for books
CREATE TABLE Books (
	BookID INT PRIMARY KEY IDENTITY(1,1),
	Title VARCHAR(100) NOT NULL,
	Author VARCHAR(100),
	Genre VARCHAR(50),
	YearPublished INT
);

CREATE TABLE Members (
	MemberID INT PRIMARY KEY IDENTITY(1,1),
	Name VARCHAR(100) NOT NULL,
	Email VARCHAR(100) UNIQUE NOT NULL,
	JoinDate DATE DEFAULT GETDATE()

);

CREATE TABLE BorrowedBooks (
	BorrowID INT PRIMARY KEY IDENTITY(1,1),
	BookID INT FOREIGN KEY REFERENCES Books(BookID),
	MemberID INT FOREIGN KEY REFERENCES Members(MemberID),
	BorrowDate DATE DEFAULT GETDATE(),
	ReturnDate DATE NULL
);

-- Insert books

INSERT INTO Books (Title,Author,Genre,YearPublished) VALUES ('Black Face,White Masks','Franz Fanon','Historical',1989);
INSERT INTO Books (Title,Author,Genre,YearPublished) VALUES ('Decolonizing the mind','Ngugi wa Thiongo','African Philosophy',1982);
INSERT INTO Books (Title,Author,Genre,YearPublished) VALUES ('Wretched of the earth','Franz Fanon','Psychosocial',1964);

INSERT INTO MEMBERS(Name,Email,JoinDate) VALUES ('Soso','Soso@yahoo.com','01-12-2024');
INSERT INTO MEMBERS(Name,Email,JoinDate) VALUES ('Lusanda','Hafsa@hotmail.com','11-05-2024');
INSERT INTO MEMBERS(Name,Email,JoinDate) VALUES ('Ora','Oratile@gmail.com','08-03-2024');


INSERT INTO BorrowedBooks (BookID,MemberID,BorrowDate) VALUES (1,1,'2025-09-15')
INSERT INTO BorrowedBooks (BookID,MemberID,BorrowDate) VALUES (1,2,'2025-07-22')
INSERT INTO BorrowedBooks (BookID,MemberID,BorrowDate) VALUES (2,2,'2025-11-30')
INSERT INTO BorrowedBooks (BookID,MemberID,BorrowDate) VALUES (3,1,'2025-09-15')
INSERT INTO BorrowedBooks (BookID,MemberID,BorrowDate) VALUES (1,3,'2025-09-15')



SELECT * FROM Books;
SELECT * FROM Books WHERE Genre = 'African Philosophy';
SELECT * FROM Books ORDER BY YearPublished DESC;

-- See borrowed books with member names

SELECT b.Title, m.Name, bb.BorrowDate
FROM BorrowedBooks bb 
JOIN Books b ON bb.BookID = b.BookID
JOIN Members m ON bb.MemberID = m.MemberID;


--Never borrowed books
SELECT Title FROM Books b
LEFT JOIN BorrowedBooks bb ON b.BookID= bb.BookID
WHERE bb.BookID IS NULL;