/* Joins: 

SELECT [Column names] 
FROM [Table] [abbv]
JOIN [Table2] [abbv2] ON abbv.prop = abbv2.prop WHERE [Conditions];

SELECT a.Name, b.Name FROM SomeTable a JOIN AnotherTable b ON a.someid = b.someid;
SELECT a.Name, b.Name FROM SomeTable a JOIN AnotherTable b ON a.someid = b.someid WHERE b.email = 'e@mail.com'; */

SELECT *
FROM Invoice i
    JOIN InvoiceLine il ON il.invoiceId = i.invoiceId
WHERE il.UnitPrice > .99;

SELECT i.InvoiceData, c.FirstName, c.LastName, i.Total
FROM Invoice I
    JOIN customer c ON i.CustomerId = i.Customerid;

SELECT c.FirstName, c.LastName, e.FirstName, e.LastName
FROM Customer c
    JOIN Employee e on c.SupportRepId = e.employeeid;

SELECT al.Title, ar.Name
FROM Album al
    JOIN Artist ar ON al.ArtistId = ar.ArtistId;

SELECT pt.TrackId
FROM PlaylistTrack pt
    JOIN Playlist p ON p.PlaylistId = pt.PlaylistId
WHERE p.Name = 'Music';

SELECT t.Name
FROM Track t
    JOIN PlaylistTrack pt ON pt.TrackId = pt.TrackId
WHERE pt.Playlist.id = 5;

SELECT t.name, p.Name
FROM Track t
    JOIN PlaylistTrack pt ON t.TrackId = pt.TrackId
    JOIN Playlist p ON pt.PlaylistId = p.PlaylistId;

SELECT t.Name, a.title
FROM Track t
    JOIN Album a ON t.AlbumId = a.AlbumId
    JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = "Alternative";


/* Nested Queries

 SELECT [Column names] 
FROM [Table] 
WHERE ColumnId IN ( SELECT ColumnId FROM [Table2] WHERE [Condition] );

SELECT Name, Email FROM Athlete WHERE AthleteId IN ( SELECT PersonId FROM PieEaters WHERE Flavor='Apple' ); */


SELECT *
FROM Invoice
WHERE InvoiceId IN ( SELECT InvoiceId
FROM InvoiceLine
WHERE UnitPrice > 0.99 );


SELECT *
FROM PlaylistTrack
WHERE PlaylistId IN ( SELECT PlaylistId
FROM Playlist
WHERE Name = "Music" );

SELECT Name
FROM Track
WHERE TrackId IN ( SELECT TrackId
FROM PlaylistTrack
WHERE PlaylistId = 5 );

SELECT *
FROM Track
WHERE GenreId IN ( SELECT GenreId
FROM Genre
WHERE Name = "Comedy" );

SELECT *
FROM Track
WHERE AlbumId IN ( SELECT AlbumId
FROM Album
WHERE Title = "Fireball" );

SELECT *
FROM Track
WHERE AlbumId IN ( SELECT AlbumId
FROM Album
WHERE Title = "Fireball" );


SELECT *
FROM Track
WHERE AlbumId IN ( 
  SELECT AlbumId
FROM Album
WHERE ArtistId IN ( 
    SELECT ArtistId
FROM Artist
WHERE Name = "Queen" 
  )
);

/* Updating Rows

 UPDATE [Table] 
SET [column1] = [value1], [column2] = [value2] 
WHERE [Condition];

UPDATE Athletes SET sport = 'Picklball' WHERE sport = 'pockleball'; */



SELECT *
FROM Invoice
WHERE InvoiceId IN ( SELECT InvoiceId
FROM InvoiceLine
WHERE UnitPrice > 0.99 );


SELECT *
FROM PlaylistTrack
WHERE PlaylistId IN ( SELECT PlaylistId
FROM Playlist
WHERE Name = "Music" );

SELECT Name
FROM Track
WHERE TrackId IN ( SELECT TrackId
FROM PlaylistTrack
WHERE PlaylistId = 5 );

SELECT *
FROM Track
WHERE GenreId IN ( SELECT GenreId
FROM Genre
WHERE Name = "Comedy" );

SELECT *
FROM Track
WHERE AlbumId IN ( SELECT AlbumId
FROM Album
WHERE Title = "Fireball" );

SELECT *
FROM Track
WHERE AlbumId IN ( SELECT AlbumId
FROM Album
WHERE Title = "Fireball" );


SELECT *
FROM Track
WHERE AlbumId IN ( 
  SELECT AlbumId
FROM Album
WHERE ArtistId IN ( 
    SELECT ArtistId
FROM Artist
WHERE Name = "Queen" 
  )
);


/* Group By

SELECT [Column1], [Column2]
FROM [Table] [abbr]
GROUP BY [Column];*/

SELECT Count(*), g.Name
FROM Track t
    JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name;

SELECT COUNT(*), g.Name
FROM Track t
    JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = 'Pop' OR g.Name = 'Rock'
GROUP BY g.Name;

SELECT ar.Name, Count(*)
FROM Artist ar
    JOIN al ON ar.ArtistId = al.ArtistId
GROUP BY al.ArtistId;

/* Use Distinct

SELECT DISTINCT [Column]
FROM [Table]; */

SELECT DISTINCT Composer
FROM Track;

SELECT DISTINCT BillingPostalCode
FROM Invoice;

SELECT DISTINCT Company
FROM Customer

/* Delete Rows
Make a dummy Table

CREATE TABLE practice_delete ( Name string, Type string, Value integer );
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "bronze", 50);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "bronze", 50);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "bronze", 50);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "silver", 100);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "silver", 100);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "gold", 150);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "gold", 150);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "gold", 150);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "gold", 150);

SELECT * FROM practice_delete; */

DELETE
FROM practice_delete
WHERE Type = 'bronze';

DELETE
FROM practice_delete
Where Type = 'silver';

DELETE
FROM practice_delete
WHERE Value = 150;


	









