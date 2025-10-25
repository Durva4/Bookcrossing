/*
Book-Crossing is a worldwide social experiment in which individuals release books into the wild for others to discover, read, 
and subsequently pass on, following the paths of the books through special tracking IDs and an online community.
The "Book-Crossing" project examines worldwide book consumption, rating, and sharing, seeking to learn about the behavior of users, 
identify popularity patterns, and create a recommendation system based on information from the Book-Crossing community.
*/
/*
Analysis of the dataset involved the use of a statistically representative random sample of 1,000 user records. 
This choice was made for the following technical reasons, that is with the full dataset having around 278,858 entries.
*/
select * from books_data;
select * from users;
select * from bookratings;
/*
The raw data needed extensive preprocessing.

Cleaning: The semicolon-separated fields were tainted with unnecessary quotes that combined Location and Age.

Resolution: This was rectified by removing all the unnecessary quotes and commas and also unused columns were removed.

Standardization: The cleaned data was then sorted in ascending order by ISBN.

Sampling: Lastly, the first 1,000 rows were taken to build an efficient, reproducible prototype data set for SQL development.
*/
# 1. Searching for 5 books with highest number of ratings.
select br.ISBN,bd.title,br.ratings
from bookratings as br
join books_data as bd
ON bd.ISBN = br.ISBN
order by br.ratings desc
limit 5;
#conclusion: The top 5 most rated books in the data have the same rating.

#2. Looking for the country which has most number of users.
select location,count(userid) as user_count
from users
group by location
order by user_count desc;
#conclusion: The platform is heavily dominated by users from the United States followed by Canada and the United Kingdom.

#3. Find the ISBN and title of all books published after the year 2000.
select isbn, title, publication_year
from books_data 
where publication_year > 2000;
#conclusion: Filtering with where clause allows to find recent books for campaigns or sales analysis

#4. Select all columns for users whose Age is between 20 and 30, inclusive.
select * from users 
where age between 20 and 30;
# The Between operator is perfect for demographic studies or targeted marketing to a specific age group.

#5. Calculate the average Age of all users.
select avg(age) as average_age
from users;
#Conclusion: This value can be used as the central tendency for demographic targeting or customization efforts in this market segment.

#6. Searching authors that have the highest average rating.
select bd.author, avg(br.ratings) as average_rating
from bookratings as br
join books_data as bd
on br.isbn = bd.isbn
group by bd.author
order by average_rating desc
limit 10;
# Conclusion: This query is critical for content recommendation systems and highlighting books by highly-rated authors or prioritizing them for new contracts

#7. Find all books that have an average rating of less than 5.
select bd.title, avg(br.ratings) as avg_rating 
from bookratings as br 
join books_data as bd on br.isbn = bd.isbn 
group by bd.title 
having avg(br.ratings) < 5;
# Conclusion: This measures the quality of an author's work based on explicit user feedback.

#8. Searching for the title and Author of books whose title contains the word 'Lord'.
select title, author
from books_data
where title like '%lord%';
# Conclusion: In a real-world scenario, this functionality is essential for implementing search engine features on a website.

#9. Find books that were NOT published by 'Penguin'.
select title, publisher 
from books_data 
where publisher <> 'penguin';
# Conclusion: This filtering is useful for competitive analysis or selective inventory management.

#10.Find all users location with age is less than 50.
select *
from users 
where age < 50 ;
# conclusion: Targets a specific marketing demographic for surveys or new product launch announcements.

#11. Find the title and Publisher of books that have only been rated once.
select bd.title, bd.publisher 
from books_data as bd 
join bookratings as br 
on bd.isbn = br.isbn 
group by bd.title, bd.publisher 
having count(br.ratings) = 1;
# Conclusion: Identifies new or niche books with low engagement, flagging them for promotional opportunities or content review.

#12. Find books published in the 1990s (1990 to 1999).
select title, Publication_year
from books_data 
where publication_year between 1990 and 1999;
# Conclusion: Generates a nostalgia catalog or a "90s throwback" list for special campaigns.

#13. List the title of all books rated by userid 120.
select bd.title 
from bookratings as br 
join books_data as bd 
on br.isbn = bd.isbn 
where br.userid = 120;
# Conclusion: Used for a user's reading history feature on their profile page.

#14. Identify all locations that have more than 50 users.
select location, count(userid) as user_count 
from users  
group by location
having count(userid) > 50;
# Conclusion: This is useful to target markets for launching regional events or localized services.

#15. List all distinct locations where users reside, in alphabetical order.
select distinct location 
from users 
order by location asc;
# Conclusion: Generates a clean, sorted list for geographical reporting.

#16. Find book titles that begin with the letter 'T'.
select title from books_data  
where title like 't%';
# Conclusion: Helps in pre-fetching common search results starting with a specific letter.

#17. Calculate the running total of books published year-by-year.
select publication_year, count(isbn) as books_in_year, sum(count(isbn)) 
over(order by publication_year asc) as cumulative_books 
from books_data as bd 
group by publication_year 
order by publication_year;
# Conclusion: Tracking cumulative growth of the catalog.

#18. Find the maximum age of all users.
select max(age) as max_age 
from users ;
# Conclusion: Defining the overall maximum range of age of the platform's audience.

#19. List books (isbn, title) that have ratings, but their corresponding userid is not found in the users table.
select bd.isbn, bd.title 
from books_data as bd 
join bookratings as br 
on bd.isbn = br.isbn 
left join users as u 
on br.userid = u.userid 
where u.userid is null;
# Conclusion: identifying records that point to missing users.

#20.List the unique publishers whose name contains the word 'press'.
select distinct publisher 
from books_data  
where publisher like '%press%';
# Conclusion: Vendor management to quickly identify publishing partners that include 'Press' in their name.

# SQL helps guide strategic decisions on marketing, content acquisition, and user engagement.
