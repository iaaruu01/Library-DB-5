
-- 1. View all authors
SELECT * FROM author;

-- 2. Count total number of books
SELECT COUNT(BookID) FROM book;

-- 3. Get Author Name and Book Title by matching AuthorID
SELECT Name, Title 
FROM author, book 
WHERE author.AuthorID = book.AuthorID;

-- 4. Count number of books in each category
SELECT CategoryID, COUNT(*) AS total_Books
FROM book
GROUP BY CategoryID;

-- 5. Count of distinct staff names
SELECT DISTINCT COUNT(Name) FROM staff;

-- 6. Show Member ID and Loan Date using RIGHT JOIN
SELECT member.MemberID, loan.LoanDate 
FROM member 
RIGHT JOIN loan ON member.MemberID = loan.MemberID;

-- 7. Find books with 'Secret' in their title
SELECT * 
FROM loan, book 
WHERE Title LIKE "%Secret%";

-- 8. Retrieve loans between May and July 2025 ordered by LoanDate
SELECT * 
FROM loan 
WHERE LoanDate BETWEEN "2025-05-01" AND "2025-07-01"
ORDER BY LoanDate ASC;

-- 9. Count how many members borrowed each book title
SELECT Title, COUNT(MemberID) AS total_ID 
FROM book 
LEFT JOIN loan ON book.BookID = loan.BookID
GROUP BY Title
ORDER BY Title ASC;

-- 10. Select staff names and IDs with category IDs between 1 and 5
SELECT staff.Name, StaffID 
FROM category, staff 
WHERE category.CategoryID <= 5 AND category.CategoryID <= 10;

-- 11. Get Book IDs for loans between Jan and May 2025
SELECT BookID 
FROM loan 
WHERE LoanDate >= "2025-01-01" AND LoanDate <= "2025-05-30"
ORDER BY MemberID DESC;
