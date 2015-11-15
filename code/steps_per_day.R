## mean total number of steps taken per day

steps_per_day <- aggregate(activity$steps, by = list(activity$date), FUN = sum)$x
hist(steps_per_day, breaks = seq(from = 0, to = max(c(steps_per_day, 25000), na.rm = TRUE), length.out = 30),
     main = "Total Number of Steps Taken per Day", xlab = "Steps per Day", col = 'red')
mean_steps <- mean(steps_per_day, na.rm = TRUE)
median_steps <- median(steps_per_day, na.rm = TRUE)