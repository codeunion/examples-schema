CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email TEXT NOT NULL,
  username TEXT NOT NULL,
  password_digest TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

ALTER TABLE users ADD UNIQUE (email);
ALTER TABLE users ADD UNIQUE (username);

CREATE TABLE questions (
  id SERIAL PRIMARY KEY,
  author_id INTEGER NOT NULL,
  best_answer_id INTEGER,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE INDEX ON questions(author_id);

CREATE TABLE answers (
  id SERIAL PRIMARY KEY,
  author_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

ALTER TABLE answers ADD FOREIGN KEY (question_id) REFERENCES questions(id);
ALTER TABLE questions ADD FOREIGN KEY (best_answer_id) REFERENCES answers(id);

ALTER TABLE answers ADD UNIQUE (author_id, question_id);
CREATE INDEX ON answers(question_id);

CREATE TABLE answer_votes (
  id SERIAL PRIMARY KEY,
  answer_id INTEGER NOT NULL,
  voter_id INTEGER NOT NULL,
  score INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (answer_id) REFERENCES answers(id),
  FOREIGN KEY (voter_id) REFERENCES users(id),
  CHECK(score IN (-1, 1))
);

ALTER TABLE answer_votes ADD UNIQUE (answer_id, voter_id);
CREATE INDEX ON answer_votes(voter_id);
