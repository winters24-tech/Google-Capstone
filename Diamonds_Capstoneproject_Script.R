# Step 1: Getting data into RStudio and loading libraries
## installing packages and loading libraries
install.packages("dplyr")
install.packages("tidyr")
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("skimr")
library(dplyr)
library(tidyr)
library(tidyverse)
library(ggplot2)
library(skimr)


## Using diamonds dataset
data(diamonds)
force(diamonds)


# Step 2: Chekcing dataframe
View(diamonds)
head(diamonds)
glimpse(diamonds)

# Step 3: Checking data for anomalies 
# Removed null, na values
diamonds_2 <- na.omit(diamonds)

# Checking for any inconsistencies
unique(diamonds_2$clarity)
unique(diamonds_2$cut)
unique(diamonds_2$color)


# Checked overview of data
summary(diamonds)
skim_without_charts(diamonds)



# Step 4: Creating visuals

# histogram of values for price
ggplot(data=diamonds, aes(x=price)) +
  geom_histogram(fill="steelblue", color="black") +
  ggtitle("Histogram of Price Values")

# histogram of carat value
ggplot(data=diamonds, aes(x=carat)) +
  geom_histogram(fill="purple", color="black") +
  ggtitle("Histogram of Carat Values")


# scatterplot of carat vs. price, using cut as color variable
ggplot(data=diamonds, aes(x=carat, y=price, color=cut)) + 
  geom_point()

# plot the cut (quality) of diamonds (quality <-  cut <- fair,good,very good, premium, ideal)
ggplot(diamonds, aes(x = cut , fill = cut)) +
  theme_bw() +
  geom_bar()+
  labs(x = "Quality of Diamonds",
       y = "Diamonds Count",
       title = "Quality of the Diamonds")


#plot quality of diamond with color
ggplot(diamonds, aes(x = cut,fill = color)) +
  theme_bw()+
  geom_bar()+
  labs(x="Quality of diamonds",
       y="Diamonds Count",
       title="Quality of the diamonds with color")


#grouping by cut and clarity
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "dodge"
  )+
  labs(title="Grouping by cut and clarity")


#price grouped by cut 
ggplot(diamonds, aes(x=price))+
  geom_density(aes(fill=factor(cut)),alpha=0.5)+
  labs(title="price grouped by cut",
       x="price",
       fill="cut")


#price grouped by color
ggplot(diamonds, aes(x=price))+
  geom_density(aes(fill=factor(color)),alpha=0.5)+
  labs(title="price grouped by color",
       x="price",
       fill="color")
