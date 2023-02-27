# Load packages
library("dplyr")
library("stringr")
library("ggplot2")

#Load CSV file
spl_data <- read.csv("2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)

# Filter for subjects
subject_checkout <- spl_data %>% 
  filter(Subjects %in% c("Fiction", "Nonfiction"))

# Group subjects for total checkouts
checkout_year <- subject_checkout %>% 
  group_by(CheckoutYear, Subjects) %>% 
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE))


# Create bar chart
ggplot(data = checkout_year) +
  geom_line(aes(x = CheckoutYear, y = total_checkouts, color = Subjects)) +
  labs(title = "Fiction and Nonfiction Checkouts from 2017-2023", 
       x = "Year" , y = "Total Checkouts") 
