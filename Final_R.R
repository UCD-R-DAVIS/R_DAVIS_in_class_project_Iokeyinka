

library(tidyverse)

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Generate hypothetical data
years <- 2007:2024
sectors <- c("Beverages", "Home Utensils", "Restaurants", "Retail Packaging")

# Create a data frame with random consumption values (in tonnes) for each sector and year
set.seed(123) # For reproducibility
data <- expand.grid(Year = years, Sector = sectors)
data$Consumption <- round(runif(nrow(data), min = 50, max = 500)) # Random values in tonnes

# Summarize data (if needed)
data_summary <- data %>%
  group_by(Year, Sector) %>%
  summarize(Consumption = sum(Consumption), .groups = "drop")

# Plot the bar chart
ggplot(data_summary, aes(x = Year, y = Consumption, fill = Sector)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Single-Use Plastic Consumption in Lagos State (2007-2024)",
    x = "Year",
    y = "Consumption (tonnes)",
    fill = "Sector"
  ) +
  theme_minimal() +
  theme(
    text = element_text(size = 14),
    plot.title = element_text(hjust = 0.5),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )
