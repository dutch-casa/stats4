# Part A:
## Load the necessary data
data <- read.csv("hw4q2.csv")

## Generate the boxplot
boxplot(Humidity ~ Season, data = data,
        main = "Relative Humidity in Summer and Winter",
        xlab = "Season", ylab = "Relative Humidity (%)",
        col = c("coral", "navy"))

