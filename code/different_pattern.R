## differences in activity patterns between weekdays and weekends


weekday <- weekdays(as.Date(activity_without_NAs$date))
weekday[weekday == 'Sunday' | weekday == 'Saturday'] <- 'weekend'
weekday[weekday == 'Monday' | weekday == 'Friday' | weekday == 'Thursday' | weekday == 'Tuesday' | weekday == 'Wednesday'] <- 'weekday'
activity_without_NAs$weekday <- factor(weekday)

library(lattice)
interval <- aggregate(activity_without_NAs$steps, 
                      by = list(activity_without_NAs$interval, activity_without_NAs$weekday), FUN = mean)
xyplot(interval$x ~ interval$Group.1 | interval$Group.2, layout = c(1, 2), 
       type = 'l', xlab = 'Interval', ylab = 'Number of Steps', main = "Differences in Activity Patterns between Weekdays and Weekends")
