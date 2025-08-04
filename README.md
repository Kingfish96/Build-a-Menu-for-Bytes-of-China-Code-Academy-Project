# Build-a-Menu-for-Bytes-of-China-Code-Academy-Project
# 📋 Bytes of China: Restaurant Menu & Reviews Database

This project is a SQL-based database schema designed for **Bytes of China**, a fictional Chinese restaurant that recently moved to a busy street in Chinatown. The database supports a digital menu and a customer review system for display on the restaurant's website.

Built as part of a Codecademy project, this work showcases essential relational database design principles, including table creation, normalization, foreign key constraints, many-to-many relationships, and complex querying.

---

## 🧾 Project Overview

**Client:** Bytes of China  
**Cuisine:** Delectable Chinese cuisine  
**Location:** 2020 Busy Street, Chinatown, MA 02139  
**Telephone:** 617-555-1212  
**Hours:** Mon–Fri 9:00am–9:00pm, Weekends 10:00am–11:00pm  
**Rating:** 3.9 stars (200 reviews)  
**Menu Categories:** Appetizers, Soup, Chicken, Beef, Veal, Vegetarian, Rice & Noodles, Luncheon Specials, House Specials  
**Spicy Dishes:** Indicated with an asterisk (*)  
**Reviews Page:** Displays user-submitted reviews and ratings

---

## 🛠️ Features & Objectives

This project included the following tasks:

- ✅ Design a relational schema for the restaurant menu and reviews  
- ✅ Create and link multiple tables using primary and foreign keys  
- ✅ Handle many-to-many relationships between menu categories and dishes  
- ✅ Populate tables with realistic sample data  
- ✅ Write queries to extract meaningful data for display on the restaurant website  

---

## 🗃️ Database Schema

| Table              | Description                                              |
|--------------------|----------------------------------------------------------|
| `restaurant`       | Basic info such as name, description, rating, phone, hours |
| `address`          | Street and city information for the restaurant (1-to-1)  |
| `category`         | Menu categories (e.g., Chicken, Luncheon Specials)       |
| `dish`             | Menu items with description and spicy flag               |
| `categories_dishes`| Many-to-many table linking dishes and categories with price |
| `review`           | Customer reviews with rating, description, and date      |

---

## 🧪 Example SQL Queries

The project includes example queries that demonstrate how to:

- Retrieve restaurant contact and address info  
- List all spicy dishes with category and price  
- Show dishes that appear in multiple categories  
- Get the highest customer rating and corresponding review  
- Aggregate and filter dish appearances across categories

---

---

## 🧑‍💻 How to Use

1. Open any SQL-compatible environment (e.g., PostgreSQL, SQLite).
2. Copy and run the SQL in `restaurant_db_schema.sql`.
3. Explore the sample queries at the bottom to test the schema.
4. Extend the dataset or schema as needed for your own use.

---

## 🧠 What I Learned

- Designing normalized relational databases  
- Applying SQL `CREATE TABLE`, `INSERT`, `JOIN`, `GROUP BY`, and subqueries  
- Enforcing data integrity with keys and constraints  
- Modeling real-world data with complex relationships  

---

## 📘 Inspiration & Credits

This project is based on the **"Build a Menu for Bytes of China"** project from Codecademy’s Data Engineer Career path. It was adapted and expanded to include full documentation, schema organization, and data validation queries.

---

## 📜 License

This project is open for educational purposes. Feel free to fork and use it to learn or build your own SQL-based apps.


## 📂 File Structure

