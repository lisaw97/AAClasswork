DROP TABLE IF EXISTS cattoys;
DROP TABLE IF EXISTS cats;
DROP TABLE IF EXISTS toys;

CREATE TABLE cats(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    color VARCHAR(255),
    breed VARCHAR(255)
);

CREATE TABLE toys(
    id SERIAL PRIMARY KEY,
    price float,
    color VARCHAR(255),
    name VARCHAR(255)
);

CREATE TABLE cattoys(
    id SERIAL PRIMARY KEY,
    cat_id integer,
    toy_id integer,

  FOREIGN KEY (cat_id) REFERENCES cats(id),
  FOREIGN KEY (toy_id) REFERENCES toys(id)
);

INSERT INTO
    toys
    (price, color, name)
VALUES
    (1, 'Blue', 'ball'),
    (3.99, 'Shiny', 'feather'),
    (2, 'Red', 'mouse'),
    (4.99, 'Red', 'milk'),
    (9.99, 'Gold', 'cat-nip')
;

INSERT INTO
    cats
    (name, color, breed)
VALUES
    ('Lisa', 'Blue', 'unknown'),
    ('Zaid', 'Shiny', 'cat-god'),
    ('Nelson', 'Gold', 'egyptian'),
    ('Laila', 'Shiny', 'dentist-cat'),
    ('Anthony', 'Gold', 'egyptian')
;

INSERT INTO
    cattoys
    (cat_id, toy_id)
VALUES
    ((SELECT id 
    FROM cats
    WHERE name = 'Lisa'),
    (SELECT id 
     FROM toys
     WHERE name = 'ball')),

     ((SELECT id 
    FROM cats
    WHERE name = 'Zaid'),
    (SELECT id 
     FROM toys
     WHERE name = 'feather')),

     ((SELECT id 
    FROM cats
    WHERE name = 'Nelson'),
    (SELECT id 
     FROM toys
     WHERE name = 'mouse')),

     ((SELECT id 
    FROM cats
    WHERE name = 'Laila'),
    (SELECT id 
     FROM toys
     WHERE name = 'milk')),

     ((SELECT id 
    FROM cats
    WHERE name = 'Anthony'),
    (SELECT id 
     FROM toys
     WHERE name = 'cat-nip'))
;