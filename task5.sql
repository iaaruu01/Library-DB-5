-- List all books along with their author names.
select author.AuthorID,book.Title from author join book 
on author.AuthorID=book.AuthorID 
order by author.AuthorID ;

-- Show all members and the titles of books they have borrowed.
select member.MemberID, member.Name, book.Title
from loan join member on loan.MemberID=member.MemberID
join book on loan.BookID=book.BookID
order by member.MemberID;

-- Display each loan with member name, book title, and loan date.
select member.Name, book.Title, loan.LoanDate 
from member join loan on member.MemberID=loan.MemberID
join book on book.BookID=loan.BookID
order by member.Name;

--  List all books and their categories using JOIN.
select Title, Name from book 
join category on book.CategoryID=category.CategoryID
order by Name;

-- Show all members including those who have never borrowed a book (LEFT JOIN).
select distinct(Name) from member left join loan on 
member.MemberID=loan.MemberID;

-- List books that have never been loaned (LEFT JOIN with IS NULL).
select Title from book left join loan
on book.BookID=loan.BookID
where loan.BookID is null;

-- Display the number of books borrowed by each member (JOIN with GROUP BY).
select m.Name, count(l.LoanID) as total_borrow from member m join loan l
on m.MemberID=l.MemberID
group by m.MemberID,m.Name;

--  List all staff roles and count how many staff are in each role.
select Role, count(StaffID) from staff
group by Role;

-- Show all books along with their author and category names.
select b.Title, a.Name Author_Name, c.Name Category_Type 
from book b join author a 
on b.AuthorID=a.AuthorID 
join category c on c.CategoryID= b.CategoryID
order by a.Name;


--  Display all loans with corresponding book title, author name, and member email.
select l.LoanID, b.Title, a.Name, m.Email from loan l join member m
on l.MemberID=m.MemberID
join book b on l.BookID=b.BookID
join author a on b.AuthorID=a.AuthorID;

-- List members who borrowed books in June 2025.
select distinct(m.MemberID), m.Name from member m join loan l on
m.MemberID=l.MemberID
where month(l.LoanDate)=6 and year(l.LoanDate)=2025
order by m.Name;

-- Find books issued more than once along with how many times they were issued.
select b.BookID,b.Title, count(l.LoanID) as TimesCount from book b join loan l
on b.BookID=l.BookID
group by b.BookID,b.Title
having count(l.LoanID) >1;

-- Show the total number of books written by each author.
select count(distinct b.BookID), a.Name, a.AuthorID from book b join author a
on b.AuthorID=a.AuthorID 
group by a.AuthorID, a.Name;

--  List all categories along with the number of books in each (JOIN with GROUP BY).
select c.CategoryID, c.Name, count(b.BookID) from category c join book b
on c.CategoryID=b.CategoryID
group by c.CategoryID,c.Name
order by c.CategoryID;

-- Display all loans along with staff name who assisted (assume staff handles transactions in extended schema).
select s.StaffID, s.Name, l.LoanID from loan l join staff s
on l.LoanID=s.StaffID
where s.Role="Assistant"
order by s.StaffID;

