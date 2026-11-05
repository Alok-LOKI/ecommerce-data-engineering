I just finished an end-to-end E-commerce Data Engineering project.

I wanted to build the backend of an online store myself: from the data model all the way to a working REST API.

What I built:
- Designed a normalized ERD with 7 entities: Customers, Categories, Suppliers, Products, Orders, Order Items and Payments
- Built the schema in PostgreSQL on Supabase, using primary keys, foreign keys and constraints to keep the data consistent
- Wrote 15 analytical SQL queries: JOINs, aggregations, GROUP BY, low-stock alerts, revenue totals and orders with missing payments
- Exposed the database through 20 REST API endpoints (full CRUD) and tested every one in Postman

Tech stack:
PostgreSQL | Supabase | dbdiagram.io | REST API | Postman | SQL | JSON

Key takeaways:
- A good data model makes everything after it easier
- Constraints catch bad data before it causes problems
- Supabase turns a Postgres database into a REST API with almost no setup

The screenshots show the ERD, the schema and some query results.
GitHub: https://github.com/Alok-LOKI/ecommerce-data-engineering

Feedback is welcome.

#DataEngineering #SQL #PostgreSQL #Supabase #RESTAPI #Postman #DatabaseDesign #ERD #DataModeling #Portfolio #LearningInPublic

---
Suggested images to attach (in this order):
1. erd/dbddia (1).png â€“ ERD
2. erd/supabase-schema-bqubgslkjggogzlbqxtz.png â€“ Supabase schema
3. screenshots/11 Total revenue generated from all orders.png
4. screenshots/10 Orders that have no payment record.png
5. screenshots/13 Number of products in each category.png
6. screenshots/3 Get all products with their category names.png
7. A screenshot of a Postman request (please add one, since none is in the repo yet)
