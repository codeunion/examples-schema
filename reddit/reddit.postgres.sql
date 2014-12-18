CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL,
  password_digest VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE UNIQUE INDEX ON users(username);
CREATE UNIQUE INDEX ON users(email);

CREATE TABLE submissions (
  id SERIAL PRIMARY KEY,
  author_id INTEGER NOT NULL,
  url VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE INDEX ON submissions(author_id);

CREATE TABLE submission_votes (
  id SERIAL PRIMARY KEY,
  submission_id INTEGER NOT NULL,
  voter_id INTEGER NOT NULL,
  score INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (submission_id) REFERENCES submissions(id),
  FOREIGN KEY (voter_id) REFERENCES users(id)
);

CREATE UNIQUE INDEX ON submission_votes(submission_id, voter_id);
CREATE INDEX ON submission_votes(voter_id);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  author_id INTEGER NOT NULL,
  submission_id INTEGER NOT NULL,
  parent_id INTEGER,
  body TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id),
  FOREIGN KEY (submission_id) REFERENCES submissions(id),
  FOREIGN KEY (parent_id) REFERENCES comments(id)
);

CREATE INDEX ON comments(author_id);
CREATE INDEX ON comments(submission_id);
CREATE INDEX ON comments(parent_id);

CREATE TABLE comment_votes (
  id SERIAL PRIMARY KEY,
  comment_id INTEGER NOT NULL,
  voter_id INTEGER NOT NULL,
  score INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (comment_id) REFERENCES comments(id),
  FOREIGN KEY (voter_id) REFERENCES users(id)
);

CREATE UNIQUE INDEX ON comment_votes(comment_id, voter_id);
CREATE INDEX ON comment_votes(voter_id);
