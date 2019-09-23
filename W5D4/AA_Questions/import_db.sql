PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  body TEXT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- seeding
INSERT INTO
  users (fname, lname)
VALUES
  ('Lisa', 'Wen'),
  ('Maureen', 'Durnin'),
  ('Diego', 'Wolf'),
  ('Alex', 'Nguyen');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('water fountains?!', 
  'what is it going to take to get more water fountains installed at AA?',
  (SELECT
    users.id
  FROM
    users
  WHERE
    users.fname = 'Alex')),
  
  ('meditation circle', 
  'would anybody be interested in meditating every wednesday at lunch?',
  (SELECT
    users.id
  FROM
    users
  WHERE
    users.fname = 'Maureen')),

  ('smoking computer', 
  'my computer is on fire. does anybody have any advice for troubleshooting?',
  (SELECT
    users.id
  FROM
    users
  WHERE
    users.fname = 'Lisa'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT
      users.id
    FROM 
      users
    WHERE
      users.fname = 'Maureen'),
  (SELECT
    questions.id
  FROM
    questions
  WHERE
    questions.title like '%smoking%')),

  ((SELECT
      users.id
    FROM 
      users
    WHERE
      users.fname = 'Diego'),
  (SELECT
    questions.id
  FROM
    questions
  WHERE
    questions.title like '%meditation%')),
    
  ((SELECT
      users.id
    FROM 
      users
    WHERE
      users.fname = 'Alex'),
  (SELECT
    questions.id
  FROM
    questions
  WHERE
    questions.title like '%smoking%'));

INSERT INTO
  replies (user_id, question_id, parent_reply_id, body)
VALUES
  ((SELECT
      users.id
    FROM 
      users
    WHERE
      users.fname = 'Maureen'),
  (SELECT
    questions.id
  FROM
    questions
  WHERE
    questions.title like '%water fountain%'), 
  NULL, 
  'GOD. I hate when buildings dont have enough water fountains. Its the worst.'),
  ((SELECT
    users.id 
  FROM
    users
  WHERE
    users.fname = 'Diego'),
  (SELECT
    questions.id
  FROM
    questions
  WHERE
    questions.title LIKE '%water%'),
  1, 
  'I BRING MY OWN WATERBOTTLE. YOU SHOULD DO THE SAME.');

  INSERT INTO
    question_likes(user_id, question_id)
  VALUES
    ((SELECT 
      users.id 
    FROM 
      users
    WHERE
      users.fname = 'Alex'),
    (SELECT
      questions.id
    FROM
      questions
    WHERE
      title LIKE '%computer%')
      ),
    ((SELECT 
      users.id 
    FROM 
      users
    WHERE
      users.fname = 'Maureen'),
    (SELECT
      questions.id
    FROM
      questions
    WHERE
      title LIKE '%computer%')
      );
