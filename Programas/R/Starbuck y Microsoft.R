library(readr)

path_to_data_sx <- "/home/fraga/Documents/Series Temporales/Data/subuxPrices.csv"
path_to_data_ms <- "/home/fraga/Documents/Series Temporales/Data/msftPrices.csv"

sbux.df = read.csv(path_to_data_sx)

sbux.ts = ts(data = sbux.df$Adj.Close,
             frequency = 12,
             start = c(1993, 3),
             end = c(2008, 3))
class(sbux.ts)

msft.df = read.csv(path_to_data_ms)path_to_data_sx <- "/home/fraga/Documents/Series Temporales/Data/subuxPrices.csv"

msft.ts = ts(data = msft.df$Adj.Close,
             frequency = 12,
             start = c(1993, 3),
             end = c(2008, 3))

sbux.ts
start(sbux.ts)
end(sbux.ts)
frequency(sbux.ts)

# Esto da una serie
tmp = sbux.ts[1:5]
class(tmp)

# Esto da una serie de tiempo
tmp = window(sbux.ts, start = c(1993, 3), end = c(1993, 8))
class(tmp)

sbuxmsft.ts = cbind(sbux.ts, msft.ts)
class(sbuxmsft.ts)

window(sbuxmsft.ts, start = c(1993, 3), end = c(1993, 7))

plot(sbux.ts, col = 'blue', lwd = 2, ylab = 'Adjusted close',
     main = 'Monthly closing price os SBUX')

plot(window(sbux.ts, start = c(2000, 3), end = c(2008, 3)),
     ylab = 'Adjusted Close', col = 'blue', lwd = 2,
     main = 'Monthly closing price of SBUX')

plot(sbuxmsft.ts)

plot(sbuxmsft.ts, plot.type = 'single',
     main = 'Monthly closing prices ons SBUX and MSFT',
     ylab = 'Adjusted close price',
     col = c('blue', 'red'), lty = 1:2)
legend(1994, 35, legend = c('SBUX', 'MSFT'), col = c('blue', 'red'),
       lty = 1:2)

library(zoo)

td = seq(as.Date("1993/3/1"), as.Date('2003/3/1'), 'months')
class(td)
head(td)

td2 = as.Date(sbux.df$Date, format = '%m/%d/%Y')
head(td2)

sbux.z = zoo(x = sbux.df$Adj.Close, order.by = td)
msft.z = zoo(x = msft.df$Adj.Close, order.by = td)

class(sbux.z)
str(sbux.z)
head(sbux.z)

index(sbux.z)
coredata(sbux.z)

start(sbux.z)
end(sbux.z)

sbux.z[as.Date(c("2000/3/1", "2003/3/1"))]

window(sbux.z, start = as.Date("2000/3/1"), end = as.Date("2003/3/1"))

sbuxmsft.z = cbind(sbux.z, msft.z)
class(sbuxmsft.z)
head(sbuxmsft.z)

plot(sbux.z, col = 'blue', lty = 1, lwd = 2, ylim = c(0, 50),
     main = 'Monthly closing prices of SBUX and MSFT',
     ylab = 'Adjusted close price')
lines(msft.z, col = 'red', lty = 2, lwd = 2)
legend(x = 'topleft', legend = c('SBUX', 'MSFT'), col = c('blue', 'red'),
       lty = 1:2)

sbux.z2 = read.zoo(path_to_data_sx,
                   format = '%m/%d/%Y', sep = ',', header = T)

library(tseries)
SBUX.z = get.hist.quote(instrument = 'sbux', start = '1993-03-01',
                        end = '2020-06-01', quote = 'AdjClose',
                        provider = 'yahoo', origin = '1970-01-01',
                        compression = 'd', retclass = 'zoo')

View(SBUX.z)

MSFT.z = get.hist.quote(instrument = 'msft', start = '1993-03-01',
                        end = '2020-06-01', quote = 'AdjClose',
                        provider = 'yahoo', origin = '1970-01-01',
                        compression = 'd', retclass = 'zoo')

View(MSFT.z)


plot(cbind(SBUX.z, MSFT.z), plot.type = 'single', col = c('blue', 'red'),
     lty = 1:2, lwd = 2, main = 'Monthly closing prices of SBUX and MSFT',
     ylab = 'Adjusted closed price')
legend(x = 'topleft', legend = c('SBUX', 'MSFT'), col = c('blue', 'red'),
       lty = 1:2)

install.packages('dygraphs')
library(dygraphs)

dygraph(SBUX.z, 'Monthly closing prices of SBUX')
dygraph(cbind(SBUX.z, MSFT.z), 'Monthly closing prices of SBUX and MSFT')


datos <- rnorm(78, 0, 10)
fechas <- seq(as.Date('2020-03-06'), as.Date('2020-05-22'), by = 'day')
as.numeric(format(fechas[1], '%j'))
miserie.ts <- ts(datos, start = c(2016, 66), frequency = 365)
plot(miserie.ts)

library(zoo)
miserie.z = zoo(datos, fechas)
plot(miserie.z)
dygraph(miserie.z)
