# Load packages
library("dplyr")
library("stringr")
library("ggplot2")

# Load CSV file
spl_data <- read.csv("2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)

# Find total audio checkouts from 2017-2023
audio_checkout <- spl_data %>% 
  group_by(CheckoutYear, MaterialType) %>% 
  filter(MaterialType == "AUDIOBOOK") %>% 
  summarize(book_checkouts = sum(Checkouts))

# Chart
ggplot(data = audio_checkout) +
  geom_line(aes(x = CheckoutYear, y = book_checkouts, color = MaterialType)) +
  labs(title = "Audiobook Checkouts From 2017-2023", 
       x = "Year" , y = "Total Checkouts") 
