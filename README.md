# 🧠📊 Crypto Analysis Dashboard

A smart, automated dashboard that combines **real-time crypto price data** with **sentiment analysis** from financial news—designed to support **investment decisions** through a data-driven lens.

👉 [Live App on Streamlit](https://mycryptoapp.streamlit.app/)

---

## 🚀 Project Purpose

The Crypto Analysis Dashboard helps users:
- Track live **price changes** for key cryptocurrencies
- Understand **market sentiment** from financial news
- Spot correlations between news tone and price movements
- Automate data ingestion for continuous updates

---

## 💡 Features

- 📈 **Crypto Price Tracker**  
  Fetches and visualizes hourly/daily price data for major coins (BTC, ETH, USDT, SOL, XRP)

- 🗞️ **News Sentiment Analysis**  
  Scrapes Financial Times via SerpAPI and runs sentiment analysis using `TextBlob`

- 🔄 **Automation with AWS Lambda**  
  Data pipelines for prices and articles run automatically on a schedule using `AWS Lambda` + `EventBridge`

- 🗃️ **PostgreSQL Integration (Railway)**  
  Data is stored and managed through a cloud database

- 🧪 **Streamlit Web App**  
  Clean, dark-mode UI for browsing insights, charts, and metrics in real-time

---

## 🧰 Tech Stack

| Tool | Purpose |
|------|---------|
| **Python** | Core logic and data processing |
| **Pandas** | Data wrangling and manipulation |
| **Streamlit** | Frontend dashboard UI |
| **TextBlob** | Sentiment analysis of news snippets |
| **SerpAPI** | Scraping Google News results |
| **AWS Lambda + EventBridge** | Task scheduling and automation |
| **PostgreSQL (via Railway)** | Data storage and access |
| **SQLAlchemy** | Database integration |

---
## Project Structure

crypto_analysis/
│
├── .streamlit/ # Streamlit configuration
│ └── secrets.toml
│
├── app/ # Streamlit frontend app
│ └── streamlit_app.py
│
├── aws/ # AWS Lambda deployment code
│ ├── update_api_table/
│ │ ├── lambda_build/
│ │ ├── update_api_table.py
│ │ ├── update_api_table.zip
│ └── update_ft_table/
│ ├── package/
│ ├── update_ft_table.py
│ ├── update_ft_table.zip
│ └── lambda_insert_crypto.zip
│
├── data/ # Raw and processed data files
│ ├── Raw/
│ └── Processed/
│
├── notebooks/ # Jupyter notebooks for exploration/dev
│ ├── api.ipynb
│ ├── financial_times_scrapping.ipynb
│ ├── nlp_financial_sentiment.ipynb
│ └── railway_connection.ipynb
│
├── src/ # Core backend and processing logic
│ ├── init.py
│ ├── get_api_data/
│ ├── scrape_data/
│ └── sentiment_analyzer/
│
├── .env # Environment variables (not tracked)
├── .gitignore # Files and folders to exclude from Git
├── LICENSE
├── README.md
└── requirements.txt # Python dependencies