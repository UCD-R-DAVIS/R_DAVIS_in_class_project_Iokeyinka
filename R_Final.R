# Load necessary libraries
library(tidyverse)

# Read the file from the URL
url <- "https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv"
laps <- read_csv(url)

library(dplyr)
laps_dt <- laps %>%
  filter(sport == "running") %>%        # Filter only running activities
  filter(minutes_per_mile < 5,            # Remove abnormally fast laps
         minutes_per_mile > 10,           # Remove walking laps
        total_elapsed_time_s <= 1)            # Remove laps with elapsed time <= 1 minute
        
laps <- laps %>%
  mutate(
    time_period = case_when(
      timestamp < "2024-01-01" ~ "Pre-2024 Running",
      timestamp >= "2024-01-01" & timestamp < "2024-07-01" ~ "Rehab (Jan-Jun 2024)",
      timestamp >= "2024-07-01" ~ "Post-Rehab (July 2024+)"
    )
  )


# Scatter plot with improvements and trendlines
laps_post_rehab <- laps %>%
  filter(time_period == "Post-Rehab (July 2024+)") %>%  # Filter for post-rehab time period
  group_by(date = as.Date(timestamp)) %>%              # Group by run date
  mutate(lap_number = rank(timestamp)) %>%             # Rank timestamps to assign lap numbers
  filter(lap_number <= 3)                              # Keep only laps 1-3

laps_clean <- laps %>%
  filter(is.finite(minutes_per_mile), is.finite(steps_per_minute))

ggplot(laps_clean, aes(x = minutes_per_mile, y = steps_per_minute, color = time_period)) +
  geom_point(alpha = 0.7, size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_manual(values = c("blue", "orange", "green")) +
  labs(
    title = "SPM vs Pace by Lap",
    x = "Minutes per Mile",
    y = "Steps Per Minute (SPM)",
    color = "Time Period"
  ) +
  theme_minimal() +
  theme(
    text = element_text(size = 14),
    plot.title = element_text(hjust = 0.5),
    legend.position = "bottom"
  )


laps_post_rehab <- laps %>%
  filter(time_period == "Post-Rehab (July 2024+)") %>%
  group_by(date = as.Date(timestamp)) %>%
  mutate(lap_number = rank(timestamp)) %>%
  filter(lap_number <= 3)                      # Focus only on laps 1-3





ggplot(laps_post_rehab, aes(x = lap_number, y = spm, group = date, color = as.factor(date))) +
  geom_line() +
  geom_point(aes(size = minutes_per_mile)) +
  scale_color_viridis_d() +
  labs(
    title = "SPM vs Lap Number (Post-Rehab)",
    x = "Lap Number",
    y = "Steps Per Minute (SPM)",
    color = "Run Date",
    size = "Minutes per Mile"
  ) +
  xlim(1, 3) +  # Assuming only laps 1-3 are relevant
  ylim(100, 200) +  # Adjust based on the range of SPM values
  theme_minimal() +
  theme(
    text = element_text(size = 14),
    plot.title = element_text(hjust = 0.5),
    legend.position = "bottom"
  )









