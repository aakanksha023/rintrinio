## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include=FALSE-----------------------------------------------------
suppressPackageStartupMessages(library(devtools))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(rintrinio))
suppressMessages(load_all())

api_key <- 'OjhlMjhjNTBmY2IyMWJiMWE0MTExYjQwNWZmZTVkZWM1'

## ----echo=TRUE----------------------------------------------------------------
time_series <- gather_financial_statement_time_series(api_key = api_key, ticker = 'AAPL', 
                                       statement = 'balance_sheet_statement', 
                                       year = c("2018", "2019"), period = c('Q1'))

knitr::kable(time_series)

## -----------------------------------------------------------------------------
company_compare <- gather_financial_statement_company_compare(api_key = api_key, ticker = c("AAPL", "CSCO"), 
                                           statement = "income_statement", 
                                           year = "2019", period = "Q1")

knitr::kable(company_compare)

## -----------------------------------------------------------------------------
stock_data <- gather_stock_time_series(api_key = api_key, ticker = "CSCO", start_date = "2019-01-01", end_date = "2019-12-31",
                                       allow_max_rows = TRUE)

ggplot(stock_data, aes(x = date, y = close)) +
  geom_line() +
  ggtitle("Cisco Close Prices over 2019") +
  labs(x = "Time", y = "Close Price")

## -----------------------------------------------------------------------------
stock_returns <- gather_stock_returns(api_key = api_key, ticker = c("AAPL", "CSCO"), buy_date = "2019-01-01", 
                     sell_date = "2019-03-31")

knitr::kable(stock_returns)

