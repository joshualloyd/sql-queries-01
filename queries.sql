-- 1. Query all of the entries in the Genre table

SELECT * FROM Genre;

-- 2. Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist
(ArtistName, YearEstablished)
VALUES
('Queen', 1970);

-- 3. Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album
(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
SELECT 'A Night at the Opera', '11/21/1975', 2590, 'EMI', Artist.ArtistId, Genre.GenreId
FROM Artist, Genre
WHERE Artist.ArtistName = "Queen"
AND Genre.label = "Rock"

-- 4. Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
SELECT 'Bohemian Rhapsody', 357, '10/31/1975', Genre.GenreId, Artist.ArtistId, Album.AlbumId
FROM Genre, Artist, Album
WHERE Artist.ArtistName = "Queen"
AND Genre.Label = "Rock"
AND Album.Title = "A Night at the Opera"

-- 5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added. Here is some more info on joins that might help.

-- Reminder: Direction of join matters. Try the following statements and see the difference in results.
-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

SELECT al.Title AS 'album', s.Title AS 'song', ar.ArtistName AS 'artist'
FROM  Song s 
JOIN Artist ar ON ar.ArtistId = s.ArtistId
JOIN Album al ON al.ArtistId = ar.ArtistId 
WHERE ar.ArtistName = 'Queen';

-- 6. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT a.title, COUNT(songid) 'Total Songs'
FROM song s
LEFT JOIN Album a ON s.Albumid = a.Albumid
GROUP BY s.albumid
ORDER BY COUNT(songid) DESC

-- 7. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT(artistId)
FROM Song
WHERE artistId = 8;

-- 8. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

-- 9. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT AlbumLength, title
FROM album
WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM album)

-- 10. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

-- 11. Modify the previous query to also display the title of the album.