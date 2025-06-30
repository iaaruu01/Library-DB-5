## 1. Find the total number of books written by each author.
select author.Name, count(book.BookID) from author left join 
book on author.AuthorID=book.AuthorID 
group by author.Name;

## 2. Display the number of books available in each category.
select Name, count(CategoryID) from category 
group by Name;

## 3. Show the number of times each book has been issued.
select loan.BookID,count(LoanDate) as Total,Title from loan right join book on
loan.BookID=book.BookID group by loan.BookID, book.Title;

## 4. Count how many books each member has borrowed.
select  member.MemberID, count(BookID) from loan right join member on
loan.MemberID= member.MemberID 
group by member.MemberID 
order by member.MemberID asc;

## 5. List the number of members who have borrowed books per category.
SELECT category.Name AS Category_Name, COUNT(DISTINCT loan.MemberID) AS Total_Members
FROM loan
JOIN book ON loan.BookID = book.BookID
JOIN category ON book.CategoryID = category.CategoryID
GROUP BY category.Name
ORDER BY Total_Members DESC;

## 6. Find the average number of loans per member.
SELECT AVG(loan_count) AS avg_loans_per_member
FROM (
    SELECT COUNT(*) AS loan_count
    FROM loan
    GROUP BY MemberID
) AS member_loans;

## Show the staff roles and count how many staff members are in each role.
select Role, count(StaffID) from staff group by Role order by Role;

## 8. Display the number of distinct titles per author.
SELECT author.Name,book.Title, COUNT(DISTINCT book.Title) AS Total_Title
FROM author 
JOIN book ON author.AuthorID = book.AuthorID 
GROUP BY author.Name, book.Title;


















