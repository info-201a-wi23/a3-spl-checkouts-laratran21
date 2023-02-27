# Load necessary packages
library("dplyr")
library("stringr")
library("tidyverse")

# Load the Seattle Library data set chosen
spl_data <- read.csv("2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)
View(spl_data)

# Calculate the number of rows and columns for the data frame
row_lib <- nrow(spl_data)
column_lib <- ncol(spl_data)

# Which year had the highest number of checkouts?
checkout_max <- spl_data %>% filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>% pull(CheckoutYear)

# Which year had the lowest number of checkouts?
min_checkouts <- spl_data %>% filter(Checkouts == min(Checkouts, na.rm = TRUE)) %>% pull(CheckoutYear)

# How many physical book checkouts have there been in total throughout 2017-2023?
book_checkout <- spl_data %>% filter(MaterialType == "BOOK", na.rm = TRUE) %>% summarize(Checkouts = sum(Checkouts)) %>% pull(Checkouts)

# How many E-book checkouts have there been in total throughout 2013-2023?
ebook_checkout <- spl_data %>% filter(MaterialType == "EBOOK", na.rm = TRUE) %>% summarize(Checkouts = sum(Checkouts)) %>% pull(Checkouts)

# What is the difference between E-book and physical book checkouts?
difference_books <- book_checkout - ebook_checkout

# What is the most checkouts in 2022?
max_checkout_2022 <- spl_data %>% filter(CheckoutYear == 2022) %>% filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>% pull(Checkouts)






