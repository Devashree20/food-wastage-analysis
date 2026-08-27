df <- read.csv("food_wastage_data.csv", check.names = FALSE)

head(df)
summary(df)

cat("Total Food Waste:",
    sum(df$`Wastage Food Amount`), "\n")

cat("Average Food Waste:",
    mean(df$`Wastage Food Amount`), "\n")

food_waste <- aggregate(
  `Wastage Food Amount` ~ `Type of Food`,
  data = df,
  FUN = sum
)

print(food_waste)

event_waste <- aggregate(
  `Wastage Food Amount` ~ `Event Type`,
  data = df,
  FUN = mean
)

print(event_waste)

season_waste <- aggregate(
  `Wastage Food Amount` ~ Seasonality,
  data = df,
  FUN = mean
)

print(season_waste)

barplot(
  food_waste$`Wastage Food Amount`,
  names.arg = food_waste$`Type of Food`,
  main = "Food Waste by Food Type",
  xlab = "Type of Food",
  ylab = "Total Food Waste",
  las = 2
)

plot(
  df$`Number of Guests`,
  df$`Wastage Food Amount`,
  main = "Number of Guests vs Food Waste",
  xlab = "Number of Guests",
  ylab = "Wastage Food Amount",
  pch = 19
)

boxplot(
  `Wastage Food Amount` ~ `Event Type`,
  data = df,
  main = "Food Waste by Event Type",
  xlab = "Event Type",
  ylab = "Wastage Food Amount",
  las = 2
)

boxplot(
  `Wastage Food Amount` ~ Seasonality,
  data = df,
  main = "Food Waste by Seasonality",
  xlab = "Seasonality",
  ylab = "Wastage Food Amount"
)

