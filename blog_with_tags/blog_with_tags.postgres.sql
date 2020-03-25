CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email TEXT NOT NULL,
  password_digest TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

ALTER TABLE users ADD UNIQUE (email);

CREATE TABLE articles (
  id SERIAL PRIMARY KEY,
  author_id INTEGER NOT NULL,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE INDEX ON articles(author_id);

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

ALTER TABLE tags ADD UNIQUE (name);

CREATE TABLE taggings (
  id SERIAL PRIMARY KEY,
  article_id INTEGER NOT NULL,
  tag_id INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (article_id) REFERENCES articles(id),
  FOREIGN KEY (tag_id) REFERENCES tags(id)
);

ALTER TABLE taggings ADD UNIQUE (article_id, tag_id);
CREATE INDEX ON taggings(tag_id);
