data("AirPassengers")

plot(AirPassengers)
# Sí hay una tendencia positiva, al igual que estacionalidad

help("AirPassengers")
# La frecuencia de muestreo es mensual

components <- decompose(AirPassengers, type = 'multiplicative')
autoplot(components$trend)
