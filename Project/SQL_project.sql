-- Project to analyze data in Customer database in SQLite

-- Question: Show the Name and UnitPrice of all tracks in the 'Rock' genre, ordered from most expensive to cheapest.
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
