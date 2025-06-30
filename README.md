
# 🔄 Task 5 – SQL JOINs in Library Management System

##  Objective

Apply different types of **SQL JOINs** (`INNER`, `LEFT`, `RIGHT`, `FULL OUTER`, `SELF`) to query and combine data across multiple tables from the **Library Database Schema**.

---

##  Tools Used

- MySQL Workbench / DB Browser for SQLite
- GitHub for version control
- SQL (task5.sql)

---

##  Repository Structure

| File Name               | Description                                 |
|------------------------|---------------------------------------------|
| `Library-DB-Schema-1.sql` | Library DB table structure                 |
| `Library-DB-2.sql`        | Delete , Update                            |
| `Library-DB-3.sql`        | Additional records                         |
| `Library-DB-4.sql`        | Final bulk insert                          |
| `task5.sql`               |  JOIN-based queries for Task 5            |
| `README.md`              | Task 5 documentation (this file)           |

---

##  SQL Queries Overview (from `task5.sql`)

### 1. Books and Their Authors
```sql
SELECT author.AuthorID, book.Title FROM author
JOIN book ON author.AuthorID = book.AuthorID;
```

### 2. Members and Borrowed Book Titles
```sql
SELECT member.MemberID, member.Name, book.Title
FROM loan
JOIN member ON loan.MemberID = member.MemberID
JOIN book ON loan.BookID = book.BookID;
```

### 3. Loans with Member Name, Book Title, Loan Date
```sql
SELECT member.Name, book.Title, loan.LoanDate
FROM member
JOIN loan ON member.MemberID = loan.MemberID
JOIN book ON book.BookID = loan.BookID;
```

### 4. Books and Categories
```sql
SELECT Title, Name FROM book
JOIN category ON book.CategoryID = category.CategoryID;
```

### 5. Members Who Never Borrowed Books (LEFT JOIN)
```sql
SELECT DISTINCT(Name) FROM member
LEFT JOIN loan ON member.MemberID = loan.MemberID;
```

### 6. Books Never Loaned
```sql
SELECT Title FROM book
LEFT JOIN loan ON book.BookID = loan.BookID
WHERE loan.BookID IS NULL;
```

### 7. Total Books Borrowed Per Member
```sql
SELECT m.Name, COUNT(l.LoanID) AS total_borrow
FROM member m JOIN loan l ON m.MemberID = l.MemberID
GROUP BY m.MemberID, m.Name;
```

### 8. Staff Role Count
```sql
SELECT Role, COUNT(StaffID) FROM staff
GROUP BY Role;
```

### 9. Book Title with Author & Category
```sql
SELECT b.Title, a.Name AS Author_Name, c.Name AS Category_Type
FROM book b
JOIN author a ON b.AuthorID = a.AuthorID
JOIN category c ON c.CategoryID = b.CategoryID;
```

### 10. Loan Details with Book Title, Author, and Member Email
```sql
SELECT l.LoanID, b.Title, a.Name, m.Email
FROM loan l
JOIN member m ON l.MemberID = m.MemberID
JOIN book b ON l.BookID = b.BookID
JOIN author a ON b.AuthorID = a.AuthorID;
```

### 11. Members Who Borrowed in June 2025
```sql
SELECT DISTINCT(m.MemberID), m.Name
FROM member m JOIN loan l ON m.MemberID = l.MemberID
WHERE MONTH(l.LoanDate) = 6 AND YEAR(l.LoanDate) = 2025;
```

### 12. Books Issued More Than Once
```sql
SELECT b.BookID, b.Title, COUNT(l.LoanID) AS TimesCount
FROM book b JOIN loan l ON b.BookID = l.BookID
GROUP BY b.BookID, b.Title
HAVING COUNT(l.LoanID) > 1;
```

### 13. Total Books by Each Author
```sql
SELECT COUNT(DISTINCT b.BookID), a.Name, a.AuthorID
FROM book b JOIN author a ON b.AuthorID = a.AuthorID
GROUP BY a.AuthorID, a.Name;
```

### 14. Books per Category
```sql
SELECT c.CategoryID, c.Name, COUNT(b.BookID)
FROM category c JOIN book b ON c.CategoryID = b.CategoryID
GROUP BY c.CategoryID, c.Name;
```

### 15. Loans with Staff (Assumed Staff Handles Transactions)
```sql
SELECT s.StaffID, s.Name, l.LoanID
FROM loan l JOIN staff s ON l.LoanID = s.StaffID
WHERE s.Role = "Assistant";
```

---

##  Author

**Aarya Gupta**  
