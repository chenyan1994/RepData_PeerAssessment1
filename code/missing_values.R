## Imputing missing values

sum(is.na(activity))

activity_without_NAs <- activity
for (i in 1:nrow(activity_without_NAs)){
        if (is.na(activity_without_NAs$steps[i])){
                activity_without_NAs$steps[i] <- steps_per_interval[which(activity_without_NAs$interval[i] == steps_per_interval$Group.1), ]$x
        }
}

steps_per_day_without_NAs <- aggregate(activity_without_NAs$steps, by = list(activity_without_NAs$date), FUN = sum)$x
hist(steps_per_day_without_NAs, breaks = seq(from = 0, to = max(c(steps_per_day, 25000), na.rm = TRUE), length.out = 30),
     main = "Total Number of Steps Taken per Day (without NAs)", xlab = "Steps per Day", col = 'red')
mean(steps_per_day_without_NAs, na.rm = TRUE)
median(steps_per_day_without_NAs, na.rm = TRUE)