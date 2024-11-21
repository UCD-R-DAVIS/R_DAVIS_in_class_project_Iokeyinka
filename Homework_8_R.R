library(tidyverse)
library(lubridate)

## Data import
mloa <- read_csv("https://raw.githubusercontent.com/ucd-r-davis/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

mloa2 = mloa %>%
  # Remove NA's
  filter(rel_humid != -99) %>%
  filter(temp_C_2m != -999.9) %>%
  filter(windSpeed_m_s != -999.9) %>%
  # Create datetime column (README indicates time is in UTC)
  mutate(datetime = ymd_hm(paste0(year,"-", 
                                  month, "-", 
                                  day," ", 
                                  hour24, ":", 
                                  min), 
                           tz = "UTC")) %>%
  # Convert to local time
  mutate(datetimeLocal = with_tz(datetime, tz = "Pacific/Honolulu"))

## Aggregate and plot
mloa2 %>%
  # Extract month and hour from local time column
  mutate(localMon = month(datetimeLocal, label = TRUE),
         localHour = hour(datetimeLocal)) %>%
  # Group by local month and hour
  group_by(localMon, localHour) %>%
  # Calculate mean temperature
  summarize(meantemp = mean(temp_C_2m)) %>%
  # Plot
  ggplot(aes(x = localMon,
             y = meantemp)) +
  # Color points by local hour
  geom_point(aes(col = localHour)) +
  # Use a nice color ramp
  scale_color_viridis_c() +
  # Label axes, add a theme
  xlab("Month") +
  ylab("Mean temperature (degrees C)") +
  theme_classic()
