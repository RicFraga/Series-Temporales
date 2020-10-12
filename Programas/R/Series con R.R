library(lubridate)
library(tseries)
library(forecast)

# Transformar una cadena a una fecha
x = as.POSIXct("2019-12-15 11:45:34")
y = as.POSIXlt("2019-12-25 11:45:34")

x; y

# Un número que representa la cantidad de segundos transcurridos desde el
# 01-01-1970 00:00:00
unclass(x)

# Es una lista
unclass(y)

# Extracción de componentes de fecha generada mediante el formato POSIXlt
y$zone

# Otra forma
x = as.Date("2019-12-25")
x; class(x)

unclass(x)

50 * 365 - 5 # Número de días desde 01-01-1970 (no considera años bisiestos)

# Otra librería para trabajar con fechas
install.packages('chron')
library(chron)

x = chron("12/25/2019", "23:34:09")

x

unclass(x)


a = as.character(c("1993-12-30 23:45",
                   "1994-11-05 11:43",
                   "1992-03-09 21:54"))

class(a)

b = strptime(a, format = "%Y-%m-%d %H:%M")
b; class(b)

ymd(19931123)
dmy(23111993)
mdy(11231993)

mytimepoint = ymd_hm("1993-11-21 11:23", tz = "Europe/Prague")

# Conocer las posibles zonas horarias
OlsonNames()

mytimepoint
class(mytimepoint)

minute(mytimepoint)
month(mytimepoint)

# Cambiar un solo componente
hour(mytimepoint) <- 14
mytimepoint

wday(mytimepoint, label = T)

# Consultar fecha en otra zona horaria
with_tz(mytimepoint, tz = 'Europe/London')

time1 = ymd_hm("1993-09-23 11:23", tz = 'Europe/Prague')
time2 = ymd_hm("1995-11-02 15:23", tz = 'Europe/Prague')

myinterval = interval(time1, time2); myinterval

class(myinterval)
