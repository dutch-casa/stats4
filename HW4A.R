
# Part A:
## First, we need to define the variables:
Location <- c("A", "A", "A", "B", "B", "B", "C")
Height <- c(100, 200, 300, 450, 600, 800, 1000)
Distance <- c(253, 337, 395, 451, 495, 534, 573)

##Create the data frame:
Galileo <- data.frame(Location, Height, Distance)

##Let's print out the data frame
print(Galileo)



# Part B:
##I'll just use built in functions for the mean, median, variance, and IQR:
mean_distance <- mean(Galileo$Distance)
median_distance <- median(Galileo$Distance)
variance_distance <- var(Galileo$Distance)
iqr_distance <- IQR(Galileo$Distance)

cat("Mean of Distance: ", mean_distance, "\n")
cat("Median of Distance: ", median_distance, "\n")
cat("Variance of Distance: ", variance_distance, "\n")
cat("IQR of Distance: ", iqr_distance, "\n")


# Part C:
## Define the DHat var with given formula.
Galileo$D.Hat <- 200 + 0.708 * Galileo$Height - 0.000344 * Galileo$Height^2

## Bool LO:
Galileo$LO <- Galileo$D.Hat < Galileo$Distance
## Display the updated Galileo dataframe
print(Galileo)

## Extract the subset where the estimated distance is NOT lower than the measured distance
Galileo_subset <- subset(Galileo, LO == FALSE)

## Display the subset
print(Galileo_subset)

#Part D:
## Function for the estimated distance (D.Hat)
D.Hat <- function(h) {
  200 + 0.708 * h - 0.000344 * h^2
}

## Generate smooth height values for the curve
Height_curve <- seq(min(Height), max(Height), length.out = 100)
D_Hat_curve <- D.Hat(Height_curve)

## Create the plot
plot(
  Height, Distance, 
  main = "Distance vs. Height", 
  xlab = "Height", 
  ylab = "Distance", 
  pch = 19, 
  col = "blue", 
  xlim = range(Height_curve), 
  ylim = range(c(Distance, D_Hat_curve))
)

## Add the estimated distance curve (D.Hat)
lines(Height_curve, D_Hat_curve, col = "red", lty = 2, lwd = 2)

## Add a legend
legend("bottomright", legend = c("Measured Distance", "Estimated Distance (D.Hat)"), 
       col = c("blue", "red"), pch = c(19, NA), lty = c(NA, 2), lwd = c(NA, 2))

