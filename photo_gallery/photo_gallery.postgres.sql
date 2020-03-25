CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email TEXT NOT NULL,
  password_digest TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE UNIQUE INDEX ON users(email);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE INDEX ON albums(user_id);

CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  album_id INTEGER NOT NULL,
  filename TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums(id)
);

CREATE INDEX ON photos(album_id);
