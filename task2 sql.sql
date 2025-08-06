
-- Create Tables

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100)
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Author VARCHAR(100),
    ISBN VARCHAR(20) UNIQUE,
    PublishedYear INT,
    CategoryID INT DEFAULT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    JoinDate DATE
);

CREATE TABLE Librarians (
    LibrarianID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    HireDate DATE
);

CREATE TABLE IssuedBooks (
    IssueID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    LibrarianID INT,
    IssueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (LibrarianID) REFERENCES Librarians(LibrarianID)
);

CREATE TABLE Fines (
    FineID INT PRIMARY KEY AUTO_INCREMENT,
    IssueID INT,
    FineAmount DECIMAL(6,2) NOT NULL,
    Paid BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (IssueID) REFERENCES IssuedBooks(IssueID)
);

-- Insert Data

INSERT INTO Categories (CategoryName) VALUES ('Technology'), ('Fiction'), ('Science');

INSERT INTO Books (Title, Author, ISBN, PublishedYear, CategoryID)
VALUES ('Database Systems', 'Navathe', '3344', 2023, 1),
       ('Python Programming', 'Charles', '7788', 2021, 3),
       ('Unknown Book', 'Anonymous', '9999', 2024, NULL);

INSERT INTO Members (Name, Email, JoinDate)
VALUES ('Ravi Kumar', 'ravi@example.com', '2025-01-10');

INSERT INTO Librarians (Name, Email, HireDate)
VALUES ('Sunil Verma', 'sunil@example.com', '2023-03-15');

INSERT INTO IssuedBooks (BookID, MemberID, LibrarianID, IssueDate, ReturnDate)
VALUES (1, 1, 1, '2025-07-01', '2025-07-15');

INSERT INTO Fines (IssueID, FineAmount)
VALUES (1, 150.00);

-- Update Operations

UPDATE Members
SET Email = 'ravi.kumar@example.com'
WHERE MemberID = 1;

UPDATE Books
SET CategoryID = NULL
WHERE BookID = 2;

UPDATE Fines
SET Paid = DEFAULT
WHERE FineID = 1;

-- Delete Operations

DELETE FROM Fines
WHERE FineID = 1;

DELETE FROM Members
WHERE MemberID = 1;
