-- In this schema, when a player initiates a new game, the computer would
-- pick one of the entries from the `phrases` table as the phrase-to-guess.
--
-- Every turn or guess would result in a new entry in the `turns` table,
-- containing the letter the player guessed for that turn.

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email TEXT NOT NULL,
  password_digest TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

ALTER TABLE users ADD UNIQUE (email);

CREATE TABLE phrases (
  id SERIAL PRIMARY KEY,
  body TEXT NOT NULL
);

CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  player_id INTEGER NOT NULL,
  phrase_id INTEGER NOT NULL,
  guess_limit INTEGER NOT NULL,
  completed_at TIMESTAMP,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (player_id) REFERENCES users(id),
  FOREIGN KEY (phrase_id) REFERENCES phrases(id),
  CHECK(guess_limit > 0)
);

CREATE INDEX ON games(player_id);

CREATE TABLE turns (
  id SERIAL PRIMARY KEY,
  game_id INTEGER NOT NULL,
  letter_guessed CHAR(1) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  FOREIGN KEY (game_id) REFERENCES games(id)
);

-- For a given game, a player can't guess the same letter twice.
ALTER TABLE turns ADD UNIQUE (game_id, letter_guessed);
