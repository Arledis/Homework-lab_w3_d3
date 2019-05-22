DROP TABLE IF EXISTS album_collections;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE album_collections (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT4 REFERENCES artists(id)
)
