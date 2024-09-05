CREATE TABLE Users (
  User_ID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL UNIQUE,
  Password VARCHAR(100) NOT NULL,
  Date_of_Birth DATE
);
select * from users;

CREATE TABLE artists (
  Artist_ID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Genre VARCHAR(50)
 
);
select * from artists;

CREATE TABLE Albums (
  Album_ID INT AUTO_INCREMENT PRIMARY KEY,
  Artist_ID INT,
  Name VARCHAR(50) NOT NULL,
  Release_Date DATE,
  Image VARCHAR(255),
  FOREIGN KEY (Artist_ID) REFERENCES Artists(Artist_ID)
);
select * from Albums;

CREATE TABLE Tracks (
  Track_ID INT AUTO_INCREMENT PRIMARY KEY,
  Album_ID INT,
  Name VARCHAR(50) NOT NULL,
  Duration INT NOT NULL,
  Path VARCHAR(255),
  FOREIGN KEY (Album_ID) REFERENCES Albums(Album_ID)
);
select * from Tracks;

CREATE TABLE Playlists (
  Playlist_ID INT AUTO_INCREMENT PRIMARY KEY,
  User_ID INT,
  Name VARCHAR(50) NOT NULL,
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);
select * from Playlists;

CREATE TABLE Playlist_Tracks (
  Playlist_ID INT,
  Track_ID INT,
  `Order` INT,
  PRIMARY KEY (Playlist_ID, Track_ID),
  FOREIGN KEY (Playlist_ID) REFERENCES Playlists(Playlist_ID),
  FOREIGN KEY (Track_ID) REFERENCES Tracks(Track_ID)
);
select * from Playlist_Tracks;

CREATE TABLE Followers (
  User_ID INT,
  Artist_ID INT,
  PRIMARY KEY (User_ID, Artist_ID),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (Artist_ID) REFERENCES Artists(Artist_ID)
);
select * from Followers;

CREATE TABLE Likes (
  User_ID INT,
  Track_ID INT,
  Like_Date_Time DATETIME,
  PRIMARY KEY (User_ID, Track_ID),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (Track_ID) REFERENCES Tracks(Track_ID)
);
select * from Likes;
CREATE TABLE Notification (
  Notification_ID INT ,
  User_ID INT NOT NULL,
  Title VARCHAR(100) NOT NULL,
  Content VARCHAR(500) NOT NULL,
  Creation_Date DATE NOT NULL,
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);
CREATE TABLE Payment (
  Payment_ID INT ,
  User_ID INT NOT NULL,
  Payment_Method VARCHAR(50) NOT NULL,
  Payment_Date DATE NOT NULL,
  Amount DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);
CREATE TABLE Similarity (
  user_id INT,
  track_id INT,
  similarity_score FLOAT,
  PRIMARY KEY (user_id, track_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (track_id) REFERENCES tracks(track_id)
);
CREATE TABLE User_track (
  User_ID INT,
  track_ID INT,
  Play_Date DATE NOT NULL,
  PRIMARY KEY (User_ID, track_ID),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (track_ID) REFERENCES tracks(track_ID)
);
CREATE TABLE Premium_Feature (
  Premium_Feature_ID INT,
  Name VARCHAR(50) NOT NULL
);
CREATE TABLE Subscription_Plan (
  Subscription_Plan_ID INT,
  Name VARCHAR(50) NOT NULL,
  Price DECIMAL(10, 2) NOT NULL,
  Description VARCHAR(500) NOT NULL
);


CREATE TABLE User_Subscription_Plan (
  User_ID INT,
  Subscription_Plan_ID INT,
  Start_Date DATE NOT NULL,
  End_Date DATE NOT NULL,
  PRIMARY KEY (User_ID, Subscription_Plan_ID),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (Subscription_Plan_ID) REFERENCES Subscription_Plan(Subscription_Plan_ID)
);
CREATE TABLE User_songs (
  User_ID INT,
  track_ID INT,
  Play_Date DATE NOT NULL,
  PRIMARY KEY (User_ID, track_ID),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (track_ID) REFERENCES tracks(track_ID)
);


ALTER TABLE Users
DROP COLUMN Profile_Image;
ALTER TABLE Albums
DROP COLUMN Image;
ALTER TABLE Artists
DROP COLUMN Image;
ALTER TABLE Playlists
DROP COLUMN Image;

INSERT INTO Users (User_ID, Name, Email, Password, Date_of_Birth, Profile_Image) VALUES
(01, 'user 1', 'user1@example.com', 'password123', '1995-05-15'),(02, 'user 2', 'user2@example.com', 'password456', '1985-12-10'),
(03, 'user 3', 'user3@example.com', 'password789', '2001-02-20'),(04, 'user 4', 'user4@example.com', 'password456', '1986-12-10'),
(05, 'user 5', 'user5@example.com', 'password456', '1996-12-10'),(06, 'user 6', 'user6@example.com', 'password456', '1987-12-10'),
(07, 'user 7', 'user7@example.com', 'password456', '1997-12-10'),(08, 'user 8', 'user8@example.com', 'password456', '1988-12-10'),
(09, 'user 9', 'user9@example.com', 'password456', '1998-12-10'),(10, 'user 10', 'user10@example.com', 'password456', '1989-12-10'),
(11, 'user 11', 'user11@example.com', 'password456', '1999-12-10'),(12, 'user 12', 'user12@example.com', 'password456', '1990-12-10'),
(13, 'user 13', 'user13@example.com', 'password456', '2000-12-10'),(14, 'user 14', 'user14@example.com', 'password456', '1991-12-10'),
(15, 'user 15', 'user15@example.com', 'password456', '2002-12-10'),(16, 'user 16', 'user16@example.com', 'password456', '1992-12-10'),
(17, 'user 17', 'user17@example.com', 'password456', '2003-12-10'),(18, 'user 18', 'user18@example.com', 'password456', '1993-12-10'),
(19, 'user 19', 'user19@example.com', 'password456', '2004-12-10'),(20, 'user 20', 'user20@example.com', 'password456', '1994-12-10');

INSERT INTO Artists (Artist_ID, Name, Genre)
VALUES
(1, 'Artist 1', 'pop'),(2, 'Artist 2', 'rock'),(3, 'Artist 3', 'hip hop'),(4, 'Artist 4', 'country'),
(5, 'Artist 5', 'pop'),(6, 'Artist 6', 'rock'),(7, 'Artist 7', 'hip hop'),(8, 'Artist 8', 'country'),
(9, 'Artist 9', 'pop'),(10, 'Artist 10', 'rock'),(11, 'Artist 3', 'hip hop'),(12, 'Artist 12', 'country'),
(13, 'Artist 13', 'pop'),(14, 'Artist 14', 'rock'),(15, 'Artist 3', 'hip hop'),(16, 'Artist 16', 'country'),
(17, 'Artist 17', 'pop'),(18, 'Artist 18', 'rock'),(19, 'Artist 3', 'hip hop'),(20, 'Artist 20', 'country');
UPDATE Artists
SET Name='Artist 11' WHERE Artist_ID=15;
UPDATE Artists
SET Name='Artist 15' WHERE Artist_ID=11;
UPDATE Artists
SET Name='Artist 19' WHERE Artist_ID=19;

INSERT INTO Albums (Album_ID, Artist_ID, Name, Release_Date)
VALUES
(1, 1, 'Album 1', '2022-01-01'),(2, 1, 'Album 2', '2022-02-01'),(3, 1, 'Album 3', '2022-03-01'),
(4, 2, 'Album 4', '2021-04-20'),(5, 2, 'Album 5', '2021-05-20'),(6, 2, 'Album 6', '2021-06-20'),
(7, 2, 'Album 7', '2021-07-20'),(8, 2, 'Album 8', '2021-08-20'),(9, 2, 'Album 9', '2021-09-20'),
(10, 2, 'Album 10', '2021-10-20'),(11, 3, 'Album 11', '2023-11-10'),(12, 3, 'Album 12', '2023-12-10'),
(13, 3, 'Album 13', '2023-01-10'),(14, 3, 'Album 14', '2020-03-10'),(15, 3, 'Album 15', '2023-04-10'),
(16, 3, 'Album 16', '2016-03-10'),(17, 3, 'Album 17', '2018-03-10'),(18, 3, 'Album 18', '2019-03-11'),
(19, 3, 'Album 19', '2020-06-10'),(20, 3, 'Album 20', '2011-03-10');

INSERT INTO Tracks (Track_ID, Album_ID, Name, Duration, Path)
VALUES
(1, 1, 'Track 1', 240, '/path/to/track1.mp3'),(2, 1, 'Track 2', 210, '/path/to/track2.mp3'),
(3, 3, 'Track 3', 180, '/path/to/track3.mp3'),(4, 4, 'Track 4', 160, '/path/to/track4.mp3'),
(5, 5, 'Track 5', 150, '/path/to/track5.mp3'),(6, 6, 'Track 6', 200, '/path/to/track6.mp3'),
(7, 7, 'Track 7', 160, '/path/to/track7.mp3'),(8, 8, 'Track 8', 180, '/path/to/track8.mp3'),
(9, 9, 'Track 9', 180, '/path/to/track9.mp3'),(10, 10, 'Track 10', 100, '/path/to/track10.mp3'),
(11, 11, 'Track 11', 240, '/path/to/track11.mp3'),(12, 12, 'Track 12', 220, '/path/to/track12.mp3'),
(13, 13, 'Track 13', 180, '/path/to/track13.mp3'),(14, 14, 'Track 14', 130, '/path/to/track14.mp3'),
(15, 15, 'Track 15', 160, '/path/to/track15.mp3'),(16, 16, 'Track 16', 120, '/path/to/track16.mp3'),
(17, 17, 'Track 17', 150, '/path/to/track17.mp3'),(18, 18, 'Track 18', 210, '/path/to/track18.mp3'),
(19, 19, 'Track 19', 170, '/path/to/track19.mp3'),(20, 20, 'Track 20', 130, '/path/to/track20.mp3');

UPDATE tracks
SET Album_ID=2 WHERE track_ID=2;

INSERT INTO Playlists (Playlist_ID, User_ID, Name)


VALUES
(1, 1, 'Playlist 1'),(2, 2, 'Playlist 2'),(3, 3, 'Playlist 3'),(4, 4, 'Playlist 4'),(5, 5, 'Playlist 5'),
(6, 6, 'Playlist 6'),(7, 7, 'Playlist 7'),(8, 8, 'Playlist 8'),(9, 9, 'Playlist 9'),(10, 10, 'Playlist 10'),
(11, 11, 'Playlist 11'),(12, 12, 'Playlist 12'),(13, 13, 'Playlist 13'),(14, 14, 'Playlist 14'),(15, 15, 'Playlist 15'),
(16, 16, 'Playlist 16'),(17, 17, 'Playlist 17'),(18, 18, 'Playlist 18'),(19, 19, 'Playlist 19'),(20, 20, 'Playlist 20');

INSERT INTO Playlist_Tracks (Playlist_ID, Track_ID, `Order`)

VALUES
(1, 1, 1),(1, 2, 2),(2, 3, 3),(2, 4, 4),(2, 5, 5),(2, 6, 6),(2, 7, 7),(2, 18, 8),(2, 8, 9),(2, 9, 10),
(2, 10, 11),(2, 11, 12),(2, 12, 13),(2, 13, 14),(2, 14, 15),(2, 15, 16),(2, 16, 17),(2, 17, 18),(2, 19, 19),(2, 20, 20);

INSERT INTO Followers (User_ID, Artist_ID)
VALUES
(1, 1),(2, 1),(3, 1),(4, 1),(5, 2),(6, 2),(7, 2),(8, 2),(9, 2),(10, 3),
(11, 3),(12, 3),(13, 3),(14, 4),(15, 4),(16, 4),(17, 4),(18, 5),(19, 5),(20, 5);

INSERT INTO Likes (User_ID, Track_ID, Like_Date_Time)
VALUES
(1, 1, '2024-03-30 10:00:00'),(2, 2, '2024-03-31 14:30:00'),(3, 3, '2024-04-01 08:45:00'),(4, 2, '2024-03-31 14:31:00')
,(5, 2, '2024-03-31 14:32:00'),(6, 2, '2024-03-31 14:33:00'),(7, 2, '2024-03-31 14:34:00'),(8, 2, '2024-03-31 14:35:00')
,(9, 2, '2024-03-31 14:36:00'),(10, 2, '2024-03-31 14:37:00'),(11, 2, '2024-03-31 14:38:00'),(12, 2, '2024-03-31 14:39:00')
,(13, 2, '2024-03-31 14:40:00'),(14, 2, '2024-03-31 14:41:00'),(15, 2, '2024-03-31 14:42:00'),(16, 2, '2024-03-31 14:43:00')
,(17, 2, '2024-03-31 14:44:00'),(18, 2, '2024-03-31 14:45:00'),(19, 2, '2024-03-31 14:46:00'),(20, 2, '2024-03-31 14:47:00');

#Retrieve the name of an artist and the name of all tracks in an album:
SELECT Artists.Name AS Artist_Name, Albums.Name AS Album_Name, Tracks.Name AS Track_Name
FROM Artists
JOIN Albums ON Artists.Artist_ID = Albums.Artist_ID
JOIN Tracks ON Albums.Album_ID = Tracks.Album_ID;

#Retrieve the name of a user, the name of a playlist, and all tracks in the playlist:
SELECT Users.Name AS User_Name, Playlists.Name AS Playlists_Name, Tracks.Name AS Track_Name
FROM Users
JOIN playlists ON users.User_ID = playlists.User_ID
JOIN Playlist_Tracks ON playlists.Playlist_ID = Playlist_Tracks.Playlist_ID
JOIN tracks ON Playlist_Tracks.Track_ID = tracks.Track_ID;

#Retrieve the name of a user and all tracks they have liked:
SELECT Users.Name AS User_Name, Tracks.Name AS Track_Name
FROM Users
JOIN Likes ON Users.User_ID = Likes.User_ID
JOIN Tracks ON Likes.Track_ID = Tracks.Track_ID;

#top 5 most liked tracks:
SELECT t.Track_ID, t.Name AS Track_Name, COUNT(l.Track_ID) AS Likes_Count
FROM Tracks t
LEFT JOIN Likes l ON t.Track_ID = l.Track_ID
GROUP BY t.Track_ID
ORDER BY Likes_Count DESC
LIMIT 3;

#total duration of all tracks in each playlist:
SELECT pt.Playlist_ID, p.Name AS Playlist_Name, SUM(t.Duration) AS Total_Duration
FROM Playlist_Tracks pt
JOIN Tracks t ON pt.Track_ID = t.Track_ID
JOIN Playlists p ON pt.Playlist_ID = p.Playlist_ID
GROUP BY pt.Playlist_ID;

#artists with the most followers:
SELECT ar.Artist_ID, ar.Name AS Artist_Name, COUNT(f.User_ID) AS Follower_Count
FROM Artists ar
LEFT JOIN Followers f ON ar.Artist_ID = f.Artist_ID
GROUP BY ar.Artist_ID
ORDER BY Follower_Count DESC
LIMIT 3;

#playlists that contain tracks from same genres
SELECT pt.Playlist_ID, p.Name AS Playlist_Name
FROM Playlist_Tracks pt
JOIN Tracks t ON pt.Track_ID = t.Track_ID
JOIN Albums al ON t.Album_ID = al.Album_ID
JOIN Artists ar ON al.Artist_ID = ar.Artist_ID
JOIN Playlists p ON pt.Playlist_ID = p.Playlist_ID
GROUP BY pt.Playlist_ID, p.Name
HAVING COUNT(DISTINCT ar.Genre) > 1;

#average duration of tracks in each album:
SELECT a.Album_ID, a.Name AS Album_Name, AVG(t.Duration) AS Average_Duration
FROM Albums a
JOIN Tracks t ON a.Album_ID = t.Album_ID
GROUP BY a.Album_ID, a.Name;

#the most recent release from each artist:
SELECT ar.Artist_ID, ar.Name AS Artist_Name, MAX(al.Release_Date) AS Most_Recent_Release_Date
FROM Artists ar
JOIN Albums al ON ar.Artist_ID = al.Artist_ID
GROUP BY ar.Artist_ID, ar.Name;

#users who have liked all tracks from a specific album:
SELECT l.User_ID, u.Name AS User_Name
FROM Likes l
JOIN Tracks t ON l.Track_ID = t.Track_ID
JOIN Albums al ON t.Album_ID = al.Album_ID
JOIN Users u ON l.User_ID = u.User_ID
WHERE al.Album_ID = 1
GROUP BY l.User_ID, u.Name
HAVING COUNT(DISTINCT t.Track_ID) = (SELECT COUNT(*) FROM Tracks WHERE Album_ID = 1);

#artists with the most tracks in the system:
SELECT ar.Artist_ID, ar.Name AS Artist_Name, COUNT(t.Track_ID) AS Track_Count
FROM Artists ar
JOIN Albums al ON ar.Artist_ID = al.Artist_ID
JOIN Tracks t ON al.Album_ID = t.Album_ID
GROUP BY ar.Artist_ID, ar.Name
ORDER BY Track_Count DESC;



