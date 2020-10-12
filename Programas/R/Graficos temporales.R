mydata <- runif(n = 50, min =10, max = 45)

mytimeseries <- ts(data = mydata, 
                   start = 1956, 
                   frequency = 4)

plot(mytimeseries)
class(mytimeseries)
time(mytimeseries)

# Serie de tiempo empezando desde un mes específico (Marzo - 3)
mytimeseries = ts(data = mydata,
                  start = c(1956, 3),
                  frequency = 4)

plot(nottem)

library(ggplot2)
library(forecast)

autoplot((nottem))
autoplot(nottem) + ggtitle("Autoplot of Nottingham temperature data")
