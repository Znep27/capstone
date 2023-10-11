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
  release_year INT NOT NULL,
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
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (album_id) REFERENCES albums (album_id)
);