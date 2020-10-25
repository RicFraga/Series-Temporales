library(tseries)
library(forecast)

# Simulación de datos normalmente distribuidos
x <- rnorm(100)

# Dickey - Fuller test
adf.test(x)

# Graficar temperaturas del castillo de Nottingham
plot(nottem)

# Descomponer en efectos de tendencia, estacional y residual
plot(decompose(nottem))

# ¿Es esta serie estacionaria?
adf.test(nottem)

# Serie no estacionaria
y <- diffinv(x)
plot(y)
adf.test(y)

# ACF y PACF de la serie nottem
acf(nottem, lag.max = 20, plot = T)
pacf(nottem, lag.max = 20, plot = T)

# Ruido blanco
acf(x, plot = T)

# Otra forma de hacer la descomposición
autoplot(decompose(nottem, type = 'additive'))

plot(stl(nottem, s.window = 'periodic'))

mynottem <- decompose(nottem, type =  'additive')
class(mynottem)
