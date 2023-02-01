CREATE TABLE users (
  ID SERIAL PRIMARY KEY,
  name TEXT,
  username TEXT,
  password TEXT
);

CREATE TABLE tweets (
  ID SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users (ID),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  message VARCHAR(255)
);

INSERT INTO users (name, username, password)
  VALUES
    ('Santa Claus', 'santaclaus', '1234'),
    ('Donald Trump', 'trump', '4321');

INSERT INTO tweets (user_id, message)
  VALUES
    (1, 'Hohohoho! Merry christmas!'),
    (2, '#fakenews'),
    (2, 'Did I win?');

-- Select all tweets with user info
SELECT
  tweets.id,
  tweets.message,
  tweets.created_at,
  users.username,
  users.name
FROM
  tweets
JOIN users ON
  tweets.user_id = users.id
ORDER BY created_at DESC;


/*
comment
*/
