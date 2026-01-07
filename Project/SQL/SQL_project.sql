-- Project to analyze data in Customer database in SQLite

-- Question 1 : Show the Name and UnitPrice of all tracks in the 'Rock' genre, ordered from most expensive to cheapest.

SELECT 
    tra.name,
    tra.UnitPrice
FROM 
    tracks tra -- Select from the 'tracks' table and give it the alias 'tra'
JOIN genres gen
    ON tra.GenreId = gen.GenreId -- Join with the 'genres' table using the common ID
WHERE 
    gen.name = 'Rock' -- Filter for tracks where the genre name is exactly 'Rock'
ORDER BY
    tra.UnitPrice DESC; -- Sort the results by price from highest to lowest

-- Question 2 : Write a SQL query to retrieve a list of artists who have released more than 10 albums. The report should display two columns: the Artist Name and the Number of Albums.

SELECT
    art.name AS [Artist Name],
    COUNT(alb.AlbumId) AS [Number_of_Albums] -- Count AlbumId within each group
FROM artists art
JOIN albums alb
    ON art.ArtistId = alb.ArtistId -- Join with the Albums table
GROUP BY
    art.name -- Group by artist name
HAVING
    COUNT(alb.AlbumId) > 10 -- Filter only groups with more than 10 albums
ORDER BY 
    COUNT(alb.AlbumId) DESC; -- Sort in descending order by the number of albums

-- Question 3 : Write a SQL query to display the First Name and Last Name of each customer along with the Total Amount they have spent in total. The total amount should be formatted to 2 decimal places. Finally, sort the results in descending order, starting from the customer who spent the most.

SELECT 
	cus.FirstName,
	cus.LastName,
	sum(inv.total) 'Total_Spent'
FROM customers cus
JOIN 
	invoices inv on cus.CustomerId = inv.CustomerId
GROUP by
	cus.CustomerId
ORDER by
	sum(inv.total)
    
-- Question 4 : Write a SQL query to display the Track Name for all tracks whose Length (Milliseconds) is greater than the average length of all tracks found in the database.

SELECT
  Name,
  Milliseconds
FROM
  tracks
WHERE
  Milliseconds > (
    SELECT
      AVG(Milliseconds) -- Subquery: Calculates the average length of all tracks
    FROM
      tracks
  );

-- Question 5 : Write a SQL query to display the Customer Name (First and Last Name) and the Support Representative Name (First and Last Name) assigned to them. You must join the Customers table with the Employees table to retrieve this information.

SELECT
  C.FirstName AS "Customer First Name",
  C.LastName AS "Customer Last Name",
  E.FirstName AS "Rep First Name",
  E.LastName AS "Rep Last Name"
FROM
  customers AS C
INNER JOIN
  employees AS E ON C.SupportRepId = E.EmployeeId

