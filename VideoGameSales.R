# Title: VideoGameSales
# Author: Elvira Khwatenge
# Date: Sys.Date()

# Load necessary libraries
library(dplyr)
library(ggplot2)
library(tidyr)

# Load data
vg_data <- read.csv("vgsales.csv")

# Introduction
# The dataset includes details on video game sales across different platforms, genres, and regions.

# Step 1: Sales Trends Over Time
# Convert Year column to integer and group data by Year to observe trends
vg_data <- vg_data %>% mutate(Year = as.integer(Year))

yearly_sales <- vg_data %>%
  group_by(Year) %>%
  summarise(Total_Global_Sales = sum(Global_Sales, na.rm = TRUE))

# Plotting Global Sales Trends Over Time
ggplot(yearly_sales, aes(x = Year, y = Total_Global_Sales)) +
  geom_line() +
  labs(title = "Global Sales Trends Over Time", x = "Year", y = "Total Global Sales (millions)") +
  theme_minimal()

# Step 2: Platform Performance
# Summing up Global Sales by Platform
platform_sales <- vg_data %>%
  group_by(Platform) %>%
  summarise(Total_Global_Sales = sum(Global_Sales, na.rm = TRUE)) %>%
  arrange(desc(Total_Global_Sales))

# Plotting Platform Popularity
ggplot(platform_sales, aes(x = reorder(Platform, -Total_Global_Sales), y = Total_Global_Sales)) +
  geom_bar(stat = "identity") +
  labs(title = "Sales by Platform", x = "Platform", y = "Total Global Sales (millions)") +
  theme_minimal() +
  coord_flip()

# Platform-Specific Preferences by Genre
platform_genre_sales <- vg_data %>%
  group_by(Platform, Genre) %>%
  summarise(Total_Global_Sales = sum(Global_Sales, na.rm = TRUE)) %>%
  arrange(desc(Total_Global_Sales))

ggplot(platform_genre_sales, aes(x = reorder(Platform, -Total_Global_Sales), y = Total_Global_Sales, fill = Genre)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Platform-Specific Preferences by Genre", x = "Platform", y = "Total Global Sales (millions)") +
  theme_minimal() +
  coord_flip()

# Step 3: Genre Trends
# Summing up Global Sales by Genre
genre_sales <- vg_data %>%
  group_by(Genre) %>%
  summarise(Total_Global_Sales = sum(Global_Sales, na.rm = TRUE)) %>%
  arrange(desc(Total_Global_Sales))

# Plotting Genre Popularity
ggplot(genre_sales, aes(x = reorder(Genre, -Total_Global_Sales), y = Total_Global_Sales)) +
  geom_bar(stat = "identity") +
  labs(title = "Sales by Genre", x = "Genre", y = "Total Global Sales (millions)") +
  theme_minimal()

# Emerging Genres Over Time
genre_trends <- vg_data %>%
  filter(!is.na(Year)) %>%
  group_by(Year, Genre) %>%
  summarise(Total_Global_Sales = sum(Global_Sales, na.rm = TRUE))

ggplot(genre_trends, aes(x = Year, y = Total_Global_Sales, color = Genre)) +
  geom_line() +
  labs(title = "Genre Sales Trends Over Time", x = "Year", y = "Total Global Sales (millions)") +
  theme_minimal()

# Step 4: Regional Analysis
# Summing up Sales by Region
regional_sales <- vg_data %>%
  summarise(
    NA_Sales = sum(NA_Sales, na.rm = TRUE),
    EU_Sales = sum(EU_Sales, na.rm = TRUE),
    JP_Sales = sum(JP_Sales, na.rm = TRUE),
    Other_Sales = sum(Other_Sales, na.rm = TRUE)
  )

# Reshape data for plotting
regional_sales_long <- regional_sales %>%
  pivot_longer(cols = everything(), names_to = "Region", values_to = "Total_Sales")

# Plotting Regional Sales Distribution
ggplot(regional_sales_long, aes(x = Region, y = Total_Sales)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Sales by Region", x = "Region", y = "Total Sales (millions)") +
  theme_minimal()

# Localized Preferences by Genre
regional_genre_sales <- vg_data %>%
  group_by(Genre) %>%
  summarise(
    NA_Sales = sum(NA_Sales, na.rm = TRUE),
    EU_Sales = sum(EU_Sales, na.rm = TRUE),
    JP_Sales = sum(JP_Sales, na.rm = TRUE),
    Other_Sales = sum(Other_Sales, na.rm = TRUE)
  )

# Reshape data for plotting
regional_genre_sales_long <- regional_genre_sales %>%
  pivot_longer(cols = -Genre, names_to = "Region", values_to = "Total_Sales")

# Plotting Genre Preferences by Region
ggplot(regional_genre_sales_long, aes(x = reorder(Genre, -Total_Sales), y = Total_Sales, fill = Region)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Genre Preferences by Region", x = "Genre", y = "Total Sales (millions)") +
  theme_minimal() +
  coord_flip()

# Summary
# Insights gained include trends over time, platform performance, and regional genre preferences, supporting strategic decision-making in game development and marketing.

