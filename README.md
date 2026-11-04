**E-commerce Sales Analysis with SQL (Google BigQuery)**

**-Overview**
This project uses SQL in Google BigQuery to answer business questions about an online clothing store's sales and customers. I wrote and ran every query myself in the free BigQuery sandbox.

**Dataset**
Source: TheLook eCommerce, a public BigQuery dataset (bigquery-public-data.thelook_ecommerce)
What it is: a synthetic (fictional) e-commerce dataset created by Google, with tables for orders, order items, products and users
Tables used: order_items, products, users
Note: the data is synthetic and refreshed regularly, so totals may differ if the queries are re-run on another day. The results below were run in early November 2026.


**Questions**
Q1	Which product categories bring in the most revenue from completed orders?	JOIN, GROUP BY, SUM, ROUND
Q2	How many customers are in each age group?	CASE, COUNT
Q3	How much do customers in each age group spend?	CASE, JOIN, COUNT(DISTINCT)
Q4	How did revenue change month to month over the last 12 full months?	CTE, LAG window function, SAFE_DIVIDE

Repository structure
├── README.md
├── sql/        SQL queries (q1–q4)
├── results/    Query results exported as CSV
└── images/     Screenshots of queries and results

**Findings**
"Revenue" throughout means the total sale price of completed order items, not profit.

Q1: Revenue by product category
Outerwear & Coats (about $334k) and Jeans (about $331k) were the top two categories, almost level with each other.
Sweaters came third at about $210k, roughly $120k behind the leaders.
Revenue drops off steadily after that, with the smallest categories (Jumpsuits & Rompers, Clothing Sets) earning under $10k each.

Q2: Customers by age group
45+ is the largest group (44,142 customers), followed by 25–44 (33,760) and Under 25 (22,098).

Q3: Spending by age group
Revenue per customer was almost the same in every age group: about $100 for Under 25 and 25–44, and $98 for 45+.
The 45+ group brought in the most total revenue (about $1.19m), but because it has the most buying customers, not because each customer spends more.
Takeaway: in this data, age doesn't change how much a customer spends; the size of each group drives the totals.

Q4: Month-to-month revenue change (Nov 2025 – Oct 2026)
Monthly revenue grew in 10 of the 11 month-to-month comparisons, from about $59k in November 2025 to about $121k in September 2026.
The only fall was February 2026 (−7.2%), which is also the shortest month.
October 2026 jumped 80.7% to about $219k. A spike this large would need checking before reporting it to a business: since the dataset is synthetic and regenerated, it may reflect how the data is created rather than real sales behaviour.
Screenshots



Tools
Google BigQuery (sandbox, free tier)
SQL (GoogleSQL)
