## average daily activity pattern

steps_per_interval <- aggregate(activity$steps, by = list(activity$interval), FUN = mean, na.rm = TRUE)
plot(steps_per_interval$Group.1, steps_per_interval$x, type = 'l', main = "Average Number of Steps Taken\n Averaged Across all Day",
     xlab = "Time in a Day", ylab = "Number of Steps")

steps_per_interval[steps_per_interval$x == max(steps_per_interval$x), 1]