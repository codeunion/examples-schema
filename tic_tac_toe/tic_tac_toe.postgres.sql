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

CREATE UNIQUE INDEX ON users(email);

CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  winner_id INTEGER,
  completed_at TIMESTAMP,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (winner_id) REFERENCES users(id)
);

CREATE INDEX ON games(winner_id);

CREATE TABLE games_players (
  id SERIAL PRIMARY KEY,
  game_id INTEGER NOT NULL,
  player_id INTEGER NOT NULL,
  token CHAR(1) NOT NULL,
  FOREIGN KEY (game_id) REFERENCES games(id),
  FOREIGN KEY (player_id) REFERENCES users(id)
);

CREATE UNIQUE INDEX ON games_players(game_id, token);

CREATE UNIQUE INDEX ON games_players(game_id, player_id);
CREATE INDEX ON games_players(player_id);

CREATE TABLE turns (
  id SERIAL PRIMARY KEY,
  game_id INTEGER NOT NULL,
  player_id INTEGER NOT NULL,
  position INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL,
  FOREIGN KEY (game_id) REFERENCES games(id),
  FOREIGN KEY (player_id) REFERENCES users(id)
);

CREATE UNIQUE INDEX ON turns(game_id, position);
CREATE INDEX ON turns(game_id, player_id);
CREATE INDEX ON turns(player_id);

CREATE UNIQUE INDEX ON turns(game_id, position);
CREATE UNIQUE INDEX ON turns(game_id)
