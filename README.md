# 🗃️ SQL Basics — A Fun SQL Project

This project shows how to work with data using **SQL** (a language used to talk to databases, like asking questions about a big table of information).

## 🤔 What Does This Project Do?

It uses a small table of **5 people's information** (name, city, age, phone number) and walks through common SQL commands — one by one — using simple comments in plain English.

## 📚 What You Will Learn

- How to create a table (like making an empty spreadsheet)
- How to add data into the table
- How to look at all the data, or only some columns
- How to find only the rows you want (filtering)
- How to sort the data (smallest to biggest, etc.)
- How to limit how many rows are shown
- How to rename columns just for display
- How to add a new calculated column
- How to update or delete data
- How to find totals, averages, min, and max
- How to group similar rows and get facts about each group
- How to join two tables together
- How to work with text (uppercase, lowercase, length)
- How to remove duplicate values
- How to write a query inside another query (subquery)
- How to save a query as a reusable "view"
- How to make searching faster with an index
- How to combine two queries into one list (union)

## 🧰 What You Need Before Running It

Any SQL tool works! A few easy options:
- **SQLite** (simplest, no setup needed) — comes built into Python
- **MySQL** or **PostgreSQL** (a couple of commands may need tiny tweaks)
- Free online tools like [SQLiteOnline.com](https://sqliteonline.com) or [DB Fiddle](https://www.db-fiddle.com)

## ▶️ How to Run It

**Option 1 — Using Python (easiest, no installs needed):**
```python
import sqlite3
conn = sqlite3.connect("demo.db")
with open("sql_demo.sql") as f:
    conn.executescript(f.read())
```

**Option 2 — Using the SQLite command line:**
```bash
sqlite3 demo.db < sql_demo.sql
```

**Option 3 — Paste it into any online SQL tool** and run it directly.

## 📁 Files

- `sql_demo.sql` — the main script with all SQL commands and comments

## 🙋 Who Is This For?

Anyone who wants to learn SQL from scratch! Every command has a plain-English comment explaining exactly what it does and why.

---

⭐ If this helped you, consider giving the repo a star!
