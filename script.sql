/* 
 *--------------------------------------------
 * Schema Definitions (Tables)
 *--------------------------------------------
 */

-- Table to store restaurant info
CREATE TABLE restaurant(
  id INTEGER PRIMARY KEY,
  name VARCHAR(30),
  description VARCHAR(100),
  rating DECIMAL,
  telephone CHAR(10),
  hours VARCHAR(100)
);

-- Table to store address info, linked to a restaurant
CREATE TABLE address(
  id INTEGER PRIMARY KEY,
  street_number VARCHAR(30),
  street_name VARCHAR(30),
  city VARCHAR(30),
  state VARCHAR(30),
  google_map_link VARCHAR(50),
  restaurant_id INTEGER REFERENCES restaurant(id)
);

-- Table to categorize dishes (e.g., Chicken, Specials)
CREATE TABLE category(
  id CHAR(2) PRIMARY KEY,
  name VARCHAR(30),
  description VARCHAR(200)
);

-- Table to store individual dishes
CREATE TABLE dish(
  id INTEGER PRIMARY KEY,
  name VARCHAR(50),
  description VARCHAR(200),
  hot_and_spicy BOOLEAN
);

-- Many-to-many relationship table between categories and dishes with price info
CREATE TABLE categories_dishes(
  category_id CHAR(2) REFERENCES category(id),
  dish_id INTEGER REFERENCES dish(id),
  price MONEY,
  PRIMARY KEY(category_id, dish_id)
);

-- Table to store customer reviews, linked to a restaurant
CREATE TABLE review(
  id INTEGER PRIMARY KEY,
  rating DECIMAL,
  description VARCHAR(100),
  date DATE,
  restaurant_id INTEGER REFERENCES restaurant(id)
);

/* 
 *--------------------------------------------
 * Sample Data Inserts
 *--------------------------------------------
 */

-- Insert restaurant info
INSERT INTO restaurant VALUES (
  1,
  'Bytes of China',
  'Delectable Chinese Cuisine',
  3.9,
  '6175551212',
  'Mon - Fri 9:00 am to 9:00 pm, Weekends 10:00 am to 11:00 pm'
);

-- Insert address for the restaurant
INSERT INTO address VALUES (
  1,
  '2020',
  'Busy Street',
  'Chinatown',
  'MA',
  'http://bit.ly/BytesOfChina',
  1
);

-- Insert reviews for the restaurant
INSERT INTO review VALUES (
  1,
  5.0,
  'Would love to host another birthday party at Bytes of China!',
  '2020-05-22',
  1
);

INSERT INTO review VALUES (
  2,
  4.5,
  'Other than a small mix-up, I would give it a 5.0!',
  '2020-04-01',
  1
);

INSERT INTO review VALUES (
  3,
  3.9,
  'A reasonable place to eat for lunch, if you are in a rush!',
  '2020-03-15',
  1
);

-- Insert categories for dishes
INSERT INTO category VALUES (
  'C',
  'Chicken',
  NULL
);

INSERT INTO category VALUES (
  'LS',
  'Luncheon Specials',
  'Served with Hot and Sour Soup or Egg Drop Soup and Fried or Steamed Rice between 11:00 am and 3:00 pm from Monday to Friday.'
);

INSERT INTO category VALUES (
  'HS',
  'House Specials',
  NULL
);

-- Insert individual dishes
INSERT INTO dish VALUES (1, 'Chicken with Broccoli', 'Diced chicken stir-fried with succulent broccoli florets', false);
INSERT INTO dish VALUES (2, 'Sweet and Sour Chicken', 'Marinated chicken with tangy sweet and sour sauce together with pineapples and green peppers', false);
INSERT INTO dish VALUES (3, 'Chicken Wings', 'Finger-licking mouth-watering entree to spice up any lunch or dinner', true);
INSERT INTO dish VALUES (4, 'Beef with Garlic Sauce', 'Sliced beef steak marinated in garlic sauce for that tangy flavor', true);
INSERT INTO dish VALUES (5, 'Fresh Mushroom with Snow Peapods and Baby Corns', 'Colorful entree perfect for vegetarians and mushroom lovers', false);
INSERT INTO dish VALUES (6, 'Sesame Chicken', 'Crispy chunks of chicken flavored with savory sesame sauce', false);
INSERT INTO dish VALUES (7, 'Special Minced Chicken', 'Marinated chicken breast sauteed with colorful vegetables topped with pine nuts and shredded lettuce.', false);
INSERT INTO dish VALUES (8, 'Hunan Special Half & Half', 'Shredded beef in Peking sauce and shredded chicken in garlic sauce', true);

-- Insert category-to-dish relationships with price
INSERT INTO categories_dishes VALUES ('C', 1, 6.95);
INSERT INTO categories_dishes VALUES ('C', 3, 6.95);
INSERT INTO categories_dishes VALUES ('LS', 1, 8.95);
INSERT INTO categories_dishes VALUES ('LS', 4, 8.95);
INSERT INTO categories_dishes VALUES ('LS', 5, 8.95);
INSERT INTO categories_dishes VALUES ('HS', 6, 15.95);
INSERT INTO categories_dishes VALUES ('HS', 7, 16.95);
INSERT INTO categories_dishes VALUES ('HS', 8, 17.95);

/* 
 *--------------------------------------------
 * Example Queries
 *--------------------------------------------
 */

-- Retrieve restaurant name, address, and phone number
SELECT restaurant.name, address.street_number, address.street_name, restaurant.telephone
FROM restaurant
JOIN address
  ON restaurant.id = address.restaurant_id;

-- Get the highest review rating given
SELECT MAX(rating) AS best_rating FROM review;

-- List all spicy dishes, their categories, and prices
SELECT dish.name AS spicy_dish_name, category.name AS category, categories_dishes.price
FROM dish
JOIN categories_dishes ON dish.id = categories_dishes.dish_id
JOIN category ON categories_dishes.category_id = category.id
WHERE dish.hot_and_spicy = TRUE;

-- List dishes that appear in more than one category
SELECT dish.name AS dish_name, COUNT(categories_dishes.dish_id) AS dish_count
FROM dish
JOIN categories_dishes ON dish.id = categories_dishes.dish_id
GROUP BY dish.id, dish.name
HAVING COUNT(categories_dishes.dish_id) > 1;

-- Show review(s) with the highest rating and their description
SELECT rating AS best_rating, description
FROM review
WHERE rating = (SELECT MAX(rating) FROM review);
