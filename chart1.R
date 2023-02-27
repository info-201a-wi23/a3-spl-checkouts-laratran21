#Load packages
library("dplyr")
library("stringr")
library("ggplot2")

# Load CSV file
spl_data <- read.csv("2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)

# Books checkouts over 2017-2023
material_checkout <- spl_data %>% 
  filter(MaterialType %in% c("BOOK", "EBOOK"))

# Group for total checkout
material_checkout_year <- material_checkout %>% 
  group_by(CheckoutYear, MaterialType) %>% 
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE))

# Chart
ggplot(data = material_checkout_year) +
  geom_line(aes(x = CheckoutYear, y = total_checkouts, color = MaterialType)) +
  labs(title = "Ebook and Book Checkout from 2017-2023", 
       x = "Year" , y = "Total Checkouts") 
