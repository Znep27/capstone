DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE albums (
  album_id INT NOT NULL,
  artist_id INT NOT NULL,
  album_title VARCHAR(100) NOT NULL,
  artist VARCHAR(100) NOT NULL,
  release_year VARCHAR(4) NOT NULL,
  genre VARCHAR(50),
  cover_art VARCHAR(100),
  PRIMARY KEY (album_id)
);

CREATE TABLE ratings (
  user_id INT NOT NULL,
  album_id INT NOT NULL,
  rating INT NOT NULL,
  CHECK (rating BETWEEN 0 AND 11),
  PRIMARY KEY (rating),
  FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE,
  FOREIGN KEY (album_id) REFERENCES albums (album_id)
    ON DELETE CASCADE
);

INSERT INTO users
	(user_name)
VALUES 
  ("abc123"),
  ("johndoe1"),
  ("musicfan"),
  ("helloworld"),
  ("miadawg27");

INSERT INTO albums
	(album_id, artist_id, album_title, artist, release_year, genre, cover_art)
VALUES 
  (2159146, 119149, "The Mollusk", "Ween", "1997", "Alternative Rock", "https://www.theaudiodb.com/images/media/album/thumb/the-mollusk-602c46751d5c2.jpg"),
  (2122363, 113051, "Pork Soda", "Primus", "1993", "Alternative Metal", "https://www.theaudiodb.com/images/media/album/thumb/wtuqqw1387692549.jpg"),
  (2337348, 134567, "Nonagon Infinity", "King Gizzard & The Lizard Wizard", "2016", null, "https://www.theaudiodb.com/images/media/album/thumb/4kgst21598635195.jpg"),
  (2123412, 113225, "Nothingface", "Voivod", "1989", "Progressive Metal", "https://www.theaudiodb.com/images/media/album/thumb/wwuspr1367825201.jpg"),
  (2114340, 111733, "Plastic Surgery Disasters", "Dead Kennedys", "1982", "Punk Rock", "https://www.theaudiodb.com/images/media/album/thumb/plastic-surgery-disasters-4dd48d0717fb8.jpg");

INSERT INTO ratings
	(user_name)
VALUES 
  (1, 2159146, 10),
  (1, 2122363, 10),
  (1, 2337348, 10),
  (1, 2123412, 10),
  (1, 2114340, 10),
  (2, 2159146, 10),
  (2, 2122363, 9),
  (2, 2337348, 8),
  (2, 2123412, 7),
  (2, 2114340, 6),
  (3, 2159146, 6),
  (3, 2122363, 7),
  (3, 2337348, 8),
  (3, 2123412, 9),
  (3, 2114340, 10),
  (4, 2159146, 1),
  (4, 2122363, 2),
  (4, 2337348, 3),
  (4, 2123412, 4),
  (4, 2114340, 5),
  (5, 2159146, 5),
  (5, 2122363, 4),
  (5, 2337348, 3),
  (5, 2123412, 2),
  (5, 2114340, 1);