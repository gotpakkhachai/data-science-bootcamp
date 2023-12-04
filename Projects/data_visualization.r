library(ggplot2)
data(diamonds)

# Scatterplot of carat vs price
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(alpha = 0.6) +
  labs(x = "Carat", y = "Price") +
  ggtitle("Scatterplot of Carat vs Price")


# Histogram of diamond prices
ggplot(diamonds, aes(x = price)) +
  geom_histogram(binwidth = 500, fill = "skyblue", color = "black") +
  labs(x = "Price", y = "Frequency") +
  ggtitle("Histogram of Diamond Prices")


# Boxplot of price by cut
ggplot(diamonds, aes(x = cut, y = price, fill = cut)) +
  geom_boxplot() +
  labs(x = "Cut", y = "Price") +
  ggtitle("Boxplot of Price by Cut Quality")


# Bar chart of cut counts
ggplot(diamonds, aes(x = cut)) +
  geom_bar(fill = "cornflowerblue") +
  labs(x = "Cut", y = "Count") +
  ggtitle("Bar Chart of Cut Counts")


# Density plot of carat by cut
ggplot(diamonds, aes(x = carat, fill = cut)) +
  geom_density(alpha = 0.6) +
  labs(x = "Carat", y = "Density") +
  ggtitle("Density Plot of Carat by Cut")
