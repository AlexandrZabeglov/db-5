CREATE TABLE IF NOT EXISTS ganre (
id SERIAL PRIMARY key,
variety_name VARCHAR(40) NOT NULL
);
CREATE TABLE IF NOT EXISTS musican (
id SERIAL PRIMARY KEY,
ganre_id integer references ganre(id),
artist_name VARCHAR(60) NOT null
);
CREATE TABLE IF NOT EXISTS ganre_musican (
ganre_id INTEGER REFERENCES ganre(id),
musican_id INTEGER REFERENCES musican(id),
CONSTRAINT pk PRIMARY KEY (musican_id, ganre_id)
);
CREATE TABLE IF NOT EXISTS album (
id SERIAL PRIMARY KEY,
musican_id integer references musican(id),
title VARCHAR(20) NOT NULL,
year_of_realese date NOT NULL
);
CREATE TABLE IF NOT EXISTS musican_album (
musican_id INTEGER REFERENCES musican(id),
album_id INTEGER REFERENCES album(id),
CONSTRAINT l PRIMARY KEY (musican_id, album_id)
);
CREATE TABLE IF NOT EXISTS tracks(
id SERIAL PRIMARY KEY,
album_id integer REFERENCES album(id),
track_title VARCHAR(40) NOT NULL,
duration time NOT NULL
);
CREATE TABLE IF NOT EXISTS collection(
id SERIAL PRIMARY KEY,
track_id integer references tracks(id),
collection_title VARCHAR(50) NOT NULL,
year_of_release date NOT NULL
);
CREATE TABLE IF NOT EXISTS collection_tracks(
track_id INTEGER REFERENCES tracks(id),
collection_id INTEGER REFERENCES collection(id),
constraint mk primary key (collection_id, track_id)
);
